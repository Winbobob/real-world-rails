require 'spec_helper'

describe ProjectsHelper do
  include ProjectForksHelper

  describe "#project_status_css_class" do
    it "returns appropriate class" 

  end

  describe "can_change_visibility_level?" do
    let(:project) { create(:project) }
    let(:user) { create(:project_member, :reporter, user: create(:user), project: project).user }
    let(:forked_project) { fork_project(project, user) }

    it "returns false if there are no appropriate permissions" 


    it "returns true if there are permissions and it is not fork" 


    it 'allows visibility level to be changed if the project is forked' 


    context "forks" do
      it "returns false if there are permissions and origin project is PRIVATE" 


      it "returns true if there are permissions and origin project is INTERNAL" 

    end
  end

  describe "readme_cache_key" do
    let(:project) { create(:project, :repository) }

    before do
      helper.instance_variable_set(:@project, project)
    end

    it "returns a valid cach key" 


    it "returns a valid cache key if HEAD does not exist" 

  end

  describe "#project_list_cache_key", :clean_gitlab_redis_shared_state do
    let(:project) { create(:project, :repository) }
    let(:user) { create(:user) }

    before do
      allow(helper).to receive(:current_user).and_return(user)
      allow(helper).to receive(:can?).with(user, :read_cross_project) { true }
    end

    it "includes the route" 


    it "includes the project" 


    it "includes the controller name" 


    it "includes the controller action" 


    it "includes the application settings" 


    it "includes a version" 


    it 'includes wether or not the user can read cross project' 


    it "includes the pipeline status when there is a status" 

  end

  describe '#load_pipeline_status' do
    it 'loads the pipeline status in batch' 

  end

  describe '#show_no_ssh_key_message?' do
    let(:user) { create(:user) }

    before do
      allow(helper).to receive(:current_user).and_return(user)
    end

    context 'user has no keys' do
      it 'returns true' 

    end

    context 'user has an ssh key' do
      it 'returns false' 

    end
  end

  describe '#show_no_password_message?' do
    let(:user) { create(:user) }

    before do
      allow(helper).to receive(:current_user).and_return(user)
    end

    context 'user has password set' do
      it 'returns false' 

    end

    context 'user has hidden the message' do
      it 'returns false' 

    end

    context 'user requires a password for Git' do
      it 'returns true' 

    end

    context 'user requires a personal access token for Git' do
      it 'returns true' 

    end
  end

  describe '#link_to_set_password' do
    let(:user) { create(:user, password_automatically_set: true) }

    before do
      allow(helper).to receive(:current_user).and_return(user)
    end

    context 'password authentication is enabled for Git' do
      it 'returns link to set a password' 

    end

    context 'password authentication is disabled for Git' do
      it 'returns link to create a personal access token' 

    end
  end

  describe '#link_to_member_avatar' do
    let(:user) { build_stubbed(:user) }
    let(:expected) { double }

    before do
      expect(helper).to receive(:avatar_icon_for_user).with(user, 16).and_return(expected)
    end

    it 'returns image tag for member avatar' 


    it 'returns image tag with avatar class' 

  end

  describe '#link_to_member' do
    let(:group)   { build_stubbed(:group) }
    let(:project) { build_stubbed(:project, group: group) }
    let(:user)    { build_stubbed(:user) }

    describe 'using the default options' do
      it 'returns an HTML link to the user' 

    end
  end

  describe 'default_clone_protocol' do
    context 'when user is not logged in and gitlab protocol is HTTP' do
      it 'returns HTTP' 

    end

    context 'when user is not logged in and gitlab protocol is HTTPS' do
      it 'returns HTTPS' 

    end
  end

  describe '#sanitizerepo_repo_path' do
    let(:project) { create(:project, :repository) }
    let(:storage_path) { Gitlab.config.repositories.storages.default.legacy_disk_path }

    before do
      allow(Settings.shared).to receive(:[]).with('path').and_return('/base/repo/export/path')
    end

    it 'removes the repo path' 


    it 'removes the temporary repo path used for uploads/exports' 

  end

  describe '#last_push_event' do
    let(:user) { double(:user, fork_of: nil) }
    let(:project) { double(:project, id: 1) }

    before do
      allow(helper).to receive(:current_user).and_return(user)
      helper.instance_variable_set(:@project, project)
    end

    context 'when there is no current_user' do
      let(:user) { nil }

      it 'returns nil' 

    end

    it 'returns recent push on the current project' 

  end

  describe '#get_project_nav_tabs' do
    let(:project) { create(:project) }
    let(:user)    { create(:user) }

    before do
      allow(helper).to receive(:can?) { true }
    end

    subject do
      helper.send(:get_project_nav_tabs, project, user)
    end

    context 'when builds feature is enabled' do
      before do
        allow(project).to receive(:builds_enabled?).and_return(true)
      end

      it "does include pipelines tab" 

    end

    context 'when builds feature is disabled' do
      before do
        allow(project).to receive(:builds_enabled?).and_return(false)
      end

      it "do not include pipelines tab" 

    end
  end

  describe '#show_projects' do
    let(:projects) do
      create(:project)
      Project.all
    end

    it 'returns true when there are projects' 


    it 'returns true when there are no projects but a name is given' 


    it 'returns true when there are no projects but personal is present' 


    it 'returns false when there are no projects and there is no name' 

  end

  describe('#push_to_create_project_command') do
    let(:user) { create(:user, username: 'john') }

    it 'returns the command to push to create project over HTTP' 


    it 'returns the command to push to create project over SSH' 

  end

  describe '#any_projects?' do
    let!(:project) { create(:project) }

    it 'returns true when projects will be returned' 


    it 'returns false when no projects will be returned' 


    it 'returns true when using a non-empty Array' 


    it 'returns false when using an empty Array' 


    it 'only executes a single query when a LIMIT is applied' 

  end

  describe '#git_user_name' do
    let(:user) { double(:user, name: 'John "A" Doe53') }
    before do
      allow(helper).to receive(:current_user).and_return(user)
    end

    it 'parses quotes in name' 

  end
end

