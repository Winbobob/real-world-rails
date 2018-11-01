require 'spec_helper'

describe Gitlab::LegacyGithubImport::ProjectCreator do
  let(:user) { create(:user) }
  let(:namespace) { create(:group) }

  let(:repo) do
    OpenStruct.new(
      login: 'vim',
      name: 'vim',
      full_name: 'asd/vim',
      clone_url: 'https://gitlab.com/asd/vim.git'
    )
  end

  subject(:service) { described_class.new(repo, repo.name, namespace, user, github_access_token: 'asdffg') }

  before do
    namespace.add_owner(user)

    expect_next_instance_of(Project) do |project|
      expect(project).to receive(:add_import_job)
    end
  end

  describe '#execute' do
    it 'creates a project' 


    it 'handle GitHub credentials' 


    context 'when GitHub project is private' do
      it 'sets project visibility to private' 

    end

    context 'when GitHub project is public' do
      it 'sets project visibility to public' 

    end

    context 'when visibility level is restricted' do
      context 'when GitHub project is private' do
        before do
          stub_application_setting(restricted_visibility_levels: [Gitlab::VisibilityLevel::PRIVATE])
          allow_any_instance_of(ApplicationSetting).to receive(:default_project_visibility).and_return(Gitlab::VisibilityLevel::INTERNAL)
        end

        it 'sets project visibility to the default project visibility' 

      end

      context 'when GitHub project is public' do
        before do
          stub_application_setting(restricted_visibility_levels: [Gitlab::VisibilityLevel::PUBLIC])
          allow_any_instance_of(ApplicationSetting).to receive(:default_project_visibility).and_return(Gitlab::VisibilityLevel::INTERNAL)
        end

        it 'sets project visibility to the default project visibility' 

      end
    end

    context 'when GitHub project has wiki' do
      it 'does not create the wiki repository' 

    end

    context 'when GitHub project does not have wiki' do
      it 'creates the wiki repository' 

    end
  end
end

