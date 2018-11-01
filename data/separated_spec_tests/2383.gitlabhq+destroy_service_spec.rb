require 'spec_helper'

describe Projects::DestroyService do
  include ProjectForksHelper

  let!(:user) { create(:user) }
  let!(:project) { create(:project, :repository, namespace: user.namespace) }
  let!(:path) do
    Gitlab::GitalyClient::StorageSettings.allow_disk_access do
      project.repository.path_to_repo
    end
  end
  let!(:remove_path) { path.sub(/\.git\Z/, "+#{project.id}+deleted.git") }
  let!(:async) { false } # execute or async_execute

  before do
    stub_container_registry_config(enabled: true)
    stub_container_registry_tags(repository: :any, tags: [])
  end

  shared_examples 'deleting the project' do
    it 'deletes the project' 

  end

  shared_examples 'deleting the project with pipeline and build' do
    context 'with pipeline and build' do # which has optimistic locking
      let!(:pipeline) { create(:ci_pipeline, project: project) }
      let!(:build) { create(:ci_build, :artifacts, pipeline: pipeline) }

      before do
        perform_enqueued_jobs do
          destroy_project(project, user, {})
        end
      end

      it_behaves_like 'deleting the project'
    end
  end

  shared_examples 'handles errors thrown during async destroy' do |error_message|
    it 'does not allow the error to bubble up' 


    it 'unmarks the project as "pending deletion"' 


    it 'stores an error message in `projects.delete_error`' 

  end

  context 'Sidekiq inline' do
    before do
      # Run sidekiq immediately to check that renamed repository will be removed
      perform_enqueued_jobs { destroy_project(project, user, {}) }
    end

    it_behaves_like 'deleting the project'

    context 'when has remote mirrors' do
      let!(:project) do
        create(:project, :repository, namespace: user.namespace).tap do |project|
          project.remote_mirrors.create(url: 'http://test.com')
        end
      end
      let!(:async) { true }

      it 'destroys them' 

    end

    it 'invalidates personal_project_count cache' 


    context 'when project has exports' do
      let!(:project_with_export) do
        create(:project, :repository, namespace: user.namespace).tap do |project|
          create(:import_export_upload,
                 project: project,
                 export_file: fixture_file_upload('spec/fixtures/project_export.tar.gz'))
        end
      end
      let!(:async) { true }

      it 'destroys project and export' 

    end
  end

  context 'Sidekiq fake' do
    before do
      # Dont run sidekiq to check if renamed repository exists
      Sidekiq::Testing.fake! { destroy_project(project, user, {}) }
    end

    it { expect(Project.all).not_to include(project) }
    it { expect(Dir.exist?(path)).to be_falsey }
    it { expect(Dir.exist?(remove_path)).to be_truthy }
  end

  context 'when flushing caches fail' do
    before do
      new_user = create(:user)
      project.team.add_user(new_user, Gitlab::Access::DEVELOPER)
      allow_any_instance_of(described_class).to receive(:flush_caches).and_raise(::Redis::CannotConnectError)
    end

    it 'keeps project team intact upon an error' 

  end

  context 'with async_execute' do
    let(:async) { true }

    context 'async delete of project with private issue visibility' do
      before do
        project.project_feature.update_attribute("issues_access_level", ProjectFeature::PRIVATE)
        # Run sidekiq immediately to check that renamed repository will be removed
        perform_enqueued_jobs { destroy_project(project, user, {}) }
      end

      it_behaves_like 'deleting the project'
    end

    it_behaves_like 'deleting the project with pipeline and build'

    context 'errors' do
      context 'when `remove_legacy_registry_tags` fails' do
        before do
          expect_any_instance_of(described_class)
            .to receive(:remove_legacy_registry_tags).and_return(false)
        end

        it_behaves_like 'handles errors thrown during async destroy', "Failed to remove some tags"
      end

      context 'when `remove_repository` fails' do
        before do
          expect_any_instance_of(described_class)
            .to receive(:remove_repository).and_return(false)
        end

        it_behaves_like 'handles errors thrown during async destroy', "Failed to remove project repository"
      end

      context 'when `execute` raises expected error' do
        before do
          expect_any_instance_of(Project)
            .to receive(:destroy!).and_raise(StandardError.new("Other error message"))
        end

        it_behaves_like 'handles errors thrown during async destroy', "Other error message"
      end

      context 'when `execute` raises unexpected error' do
        before do
          expect_any_instance_of(Project)
            .to receive(:destroy!).and_raise(Exception.new('Other error message'))
        end

        it 'allows error to bubble up and rolls back project deletion' 

      end
    end
  end

  describe 'container registry' do
    context 'when there are regular container repositories' do
      let(:container_repository) { create(:container_repository) }

      before do
        stub_container_registry_tags(repository: project.full_path + '/image',
                                     tags: ['tag'])
        project.container_repositories << container_repository
      end

      context 'when image repository deletion succeeds' do
        it 'removes tags' 

      end

      context 'when image repository deletion fails' do
        it 'raises an exception' 

      end
    end

    context 'when there are tags for legacy root repository' do
      before do
        stub_container_registry_tags(repository: project.full_path,
                                     tags: ['tag'])
      end

      context 'when image repository tags deletion succeeds' do
        it 'removes tags' 

      end

      context 'when image repository tags deletion fails' do
        it 'raises an exception' 

      end
    end
  end

  context 'for a forked project with LFS objects' do
    let(:forked_project) { fork_project(project, user) }

    before do
      project.lfs_objects << create(:lfs_object)
      forked_project.reload
    end

    it 'destroys the fork' 

  end

  context 'as the root of a fork network' do
    let!(:fork_network) { create(:fork_network, root_project: project) }

    it 'updates the fork network with the project name' 

  end

  context '#attempt_restore_repositories' do
    let(:path) { project.disk_path + '.git' }

    before do
      expect(project.gitlab_shell.exists?(project.repository_storage, path)).to be_truthy
      expect(project.gitlab_shell.exists?(project.repository_storage, remove_path)).to be_falsey

      # Dont run sidekiq to check if renamed repository exists
      Sidekiq::Testing.fake! { destroy_project(project, user, {}) }

      expect(project.gitlab_shell.exists?(project.repository_storage, path)).to be_falsey
      expect(project.gitlab_shell.exists?(project.repository_storage, remove_path)).to be_truthy
    end

    it 'restores the repositories' 

  end

  def destroy_project(project, user, params = {})
    if async
      Projects::DestroyService.new(project, user, params).async_execute
    else
      Projects::DestroyService.new(project, user, params).execute
    end
  end
end

