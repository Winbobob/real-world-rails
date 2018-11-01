require 'spec_helper'

describe Projects::CreateService, '#execute' do
  include GitHelpers

  let(:gitlab_shell) { Gitlab::Shell.new }
  let(:user) { create :user }
  let(:opts) do
    {
      name: 'GitLab',
      namespace_id: user.namespace.id
    }
  end

  it 'creates labels on Project creation if there are templates' 


  context 'user namespace' do
    it do
      project = create_project(user, opts)

      expect(project).to be_valid
      expect(project.owner).to eq(user)
      expect(project.team.maintainers).to include(user)
      expect(project.namespace).to eq(user.namespace)
    end
  end

  describe 'after create actions' do
    it 'invalidate personal_projects_count caches' 

  end

  context "admin creates project with other user's namespace_id" do
    it 'sets the correct permissions' 

  end

  context 'group namespace' do
    let(:group) do
      create(:group).tap do |group|
        group.add_owner(user)
      end
    end

    before do
      user.refresh_authorized_projects # Ensure cache is warm
    end

    it do
      project = create_project(user, opts.merge!(namespace_id: group.id))

      expect(project).to be_valid
      expect(project.owner).to eq(group)
      expect(project.namespace).to eq(group)
      expect(user.authorized_projects).to include(project)
    end
  end

  context 'error handling' do
    it 'handles invalid options' 


    it 'sets invalid service as inactive' 

  end

  context 'wiki_enabled creates repository directory' do
    context 'wiki_enabled true creates wiki repository directory' do
      it do
        project = create_project(user, opts)

        expect(wiki_repo(project).exists?).to be_truthy
      end
    end

    context 'wiki_enabled false does not create wiki repository directory' do
      it do
        opts[:wiki_enabled] = false
        project = create_project(user, opts)

        expect(wiki_repo(project).exists?).to be_falsey
      end
    end

    def wiki_repo(project)
      relative_path = ProjectWiki.new(project).disk_path + '.git'
      Gitlab::Git::Repository.new(project.repository_storage, relative_path, 'foobar')
    end
  end

  context 'import data' do
    it 'stores import data and URL' 

  end

  context 'builds_enabled global setting' do
    let(:project) { create_project(user, opts) }

    subject { project.builds_enabled? }

    context 'global builds_enabled false does not enable CI by default' do
      before do
        project.project_feature.update_attribute(:builds_access_level, ProjectFeature::DISABLED)
      end

      it { is_expected.to be_falsey }
    end

    context 'global builds_enabled true does enable CI by default' do
      it { is_expected.to be_truthy }
    end
  end

  context 'restricted visibility level' do
    before do
      stub_application_setting(restricted_visibility_levels: [Gitlab::VisibilityLevel::PUBLIC])

      opts.merge!(
        visibility_level: Gitlab::VisibilityLevel::PUBLIC
      )
    end

    it 'does not allow a restricted visibility level for non-admins' 


    it 'allows a restricted visibility level for admins' 

  end

  context 'repository creation' do
    it 'synchronously creates the repository' 


    context 'when another repository already exists on disk' do
      let(:repository_storage) { 'default' }

      let(:opts) do
        {
          name: 'Existing',
          namespace_id: user.namespace.id
        }
      end

      context 'with legacy storage' do
        before do
          gitlab_shell.create_repository(repository_storage, "#{user.namespace.full_path}/existing")
        end

        after do
          gitlab_shell.remove_repository(repository_storage, "#{user.namespace.full_path}/existing")
        end

        it 'does not allow to create a project when path matches existing repository on disk' 


        it 'does not allow to import project when path matches existing repository on disk' 

      end

      context 'with hashed storage' do
        let(:hash) { '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b' }
        let(:hashed_path) { '@hashed/6b/86/6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b' }

        before do
          stub_application_setting(hashed_storage_enabled: true)
          allow(Digest::SHA2).to receive(:hexdigest) { hash }
        end

        before do
          gitlab_shell.create_repository(repository_storage, hashed_path)
        end

        after do
          gitlab_shell.remove_repository(repository_storage, hashed_path)
        end

        it 'does not allow to create a project when path matches existing repository on disk' 

      end
    end
  end

  context 'when readme initialization is requested' do
    it 'creates README.md' 

  end

  context 'when there is an active service template' do
    before do
      create(:service, project: nil, template: true, active: true)
    end

    it 'creates a service from this template' 

  end

  context 'when a bad service template is created' do
    it 'sets service to be inactive' 

  end

  context 'when skip_disk_validation is used' do
    it 'sets the project attribute' 

  end

  it 'calls the passed block' 


  it 'writes project full path to .git/config' 


  def create_project(user, opts)
    Projects::CreateService.new(user, opts).execute
  end
end

