require 'spec_helper'

describe Projects::UpdateService do
  include ProjectForksHelper

  let(:user) { create(:user) }
  let(:project) do
    create(:project, creator: user, namespace: user.namespace)
  end

  describe '#execute' do
    let(:gitlab_shell) { Gitlab::Shell.new }
    let(:admin) { create(:admin) }

    context 'when changing visibility level' do
      context 'when visibility_level is INTERNAL' do
        it 'updates the project to internal' 

      end

      context 'when visibility_level is PUBLIC' do
        it 'updates the project to public' 

      end

      context 'when visibility_level is PRIVATE' do
        before do
          project.update!(visibility_level: Gitlab::VisibilityLevel::PUBLIC)
        end

        it 'updates the project to private' 

      end

      context 'when visibility levels are restricted to PUBLIC only' do
        before do
          stub_application_setting(restricted_visibility_levels: [Gitlab::VisibilityLevel::PUBLIC])
        end

        context 'when visibility_level is INTERNAL' do
          it 'updates the project to internal' 

        end

        context 'when visibility_level is PUBLIC' do
          it 'does not update the project to public' 


          context 'when updated by an admin' do
            it 'updates the project to public' 

          end
        end
      end

      context 'when project visibility is higher than parent group' do
        let(:group) { create(:group, visibility_level: Gitlab::VisibilityLevel::INTERNAL) }

        before do
          project.update(namespace: group, visibility_level: group.visibility_level)
        end

        it 'does not update project visibility level' 

      end
    end

    describe 'when updating project that has forks' do
      let(:project) { create(:project, :internal) }
      let(:forked_project) { fork_project(project) }

      it 'updates forks visibility level when parent set to more restrictive' 


      it 'does not update forks visibility level when parent set to less restrictive' 

    end

    context 'when updating a default branch' do
      let(:project) { create(:project, :repository) }

      it 'changes a default branch' 


      it 'does not change a default branch' 

    end

    context 'when we update project but not enabling a wiki' do
      it 'does not try to create an empty wiki' 


      it 'handles empty project feature attributes' 

    end

    context 'when enabling a wiki' do
      it 'creates a wiki' 


      it 'logs an error and creates a metric when wiki can not be created' 

    end

    context 'when changing feature visibility to private' do
      it 'updates the visibility correctly' 

    end

    context 'when updating a project that contains container images' do
      before do
        stub_container_registry_config(enabled: true)
        stub_container_registry_tags(repository: /image/, tags: %w[rc1])
        create(:container_repository, project: project, name: :image)
      end

      it 'does not allow to rename the project' 


      it 'allows to update other settings' 

    end

    context 'when renaming a project' do
      let(:repository_storage) { 'default' }
      let(:repository_storage_path) { Gitlab.config.repositories.storages[repository_storage].legacy_disk_path }

      context 'with legacy storage' do
        let(:project) { create(:project, :legacy_storage, :repository, creator: user, namespace: user.namespace) }

        before do
          gitlab_shell.create_repository(repository_storage, "#{user.namespace.full_path}/existing")
        end

        after do
          gitlab_shell.remove_repository(repository_storage, "#{user.namespace.full_path}/existing")
        end

        it 'does not allow renaming when new path matches existing repository on disk' 


        it 'renames the project without upgrading it' 


        context 'when hashed storage is enabled' do
          before do
            stub_application_setting(hashed_storage_enabled: true)
            stub_feature_flags(skip_hashed_storage_upgrade: false)
          end

          it 'migrates project to a hashed storage instead of renaming the repo to another legacy name' 


          context 'when skip_hashed_storage_upgrade feature flag is enabled' do
            before do
              stub_feature_flags(skip_hashed_storage_upgrade: true)
            end

            it 'renames the project without upgrading it' 

          end
        end
      end

      context 'with hashed storage' do
        let(:project) { create(:project, :repository, creator: user, namespace: user.namespace) }

        before do
          stub_application_setting(hashed_storage_enabled: true)
        end

        it 'does not check if new path matches existing repository on disk' 

      end
    end

    context 'when passing invalid parameters' do
      it 'returns an error result when record cannot be updated' 

    end

    context 'when updating #pages_https_only', :https_pages_enabled do
      subject(:call_service) do
        update_project(project, admin, pages_https_only: false)
      end

      it 'updates the attribute' 


      it 'calls Projects::UpdatePagesConfigurationService' 

    end

    context 'when updating #pages_access_level' do
      subject(:call_service) do
        update_project(project, admin, project_feature_attributes: { pages_access_level: ProjectFeature::PRIVATE })
      end

      it 'updates the attribute' 


      it 'calls Projects::UpdatePagesConfigurationService' 

    end
  end

  describe '#run_auto_devops_pipeline?' do
    subject { described_class.new(project, user).run_auto_devops_pipeline? }

    context 'when master contains a .gitlab-ci.yml file' do
      before do
        allow(project.repository).to receive(:gitlab_ci_yml).and_return("script: ['test']")
      end

      it { is_expected.to eq(false) }
    end

    context 'when auto devops is nil' do
      it { is_expected.to eq(false) }
    end

    context 'when auto devops is explicitly enabled' do
      before do
        project.create_auto_devops!(enabled: true)
      end

      it { is_expected.to eq(true) }
    end

    context 'when auto devops is explicitly disabled' do
      before do
        project.create_auto_devops!(enabled: false)
      end

      it { is_expected.to eq(false) }
    end

    context 'when auto devops is set to instance setting' do
      before do
        project.create_auto_devops!(enabled: nil)
        allow(project.auto_devops).to receive(:previous_changes).and_return('enabled' => true)
      end

      context 'when auto devops is enabled system-wide' do
        before do
          stub_application_setting(auto_devops_enabled: true)
        end

        it { is_expected.to eq(true) }
      end

      context 'when auto devops is disabled system-wide' do
        before do
          stub_application_setting(auto_devops_enabled: false)
        end

        it { is_expected.to eq(false) }
      end
    end
  end

  def update_project(project, user, opts)
    described_class.new(project, user, opts).execute
  end
end

