require 'spec_helper'

feature 'Setup Mattermost slash commands', :js do
  let(:user) { create(:user) }
  let(:project) { create(:project) }
  let(:service) { project.create_mattermost_slash_commands_service }
  let(:mattermost_enabled) { true }

  before do
    stub_mattermost_setting(enabled: mattermost_enabled)
    project.add_master(user)
    sign_in(user)
    visit edit_project_service_path(project, service)
  end

  describe 'user visits the mattermost slash command config page' do
    it 'shows a help message' 


    it 'shows a token placeholder' 


    it 'redirects to the integrations page after saving but not activating' 


    it 'redirects to the integrations page after activating' 


    it 'shows the add to mattermost button' 


    it 'shows an explanation if user is a member of no teams' 


    it 'shows an explanation if user is a member of 1 team' 


    it 'shows a disabled prefilled select if user is a member of 1 team' 


    it 'has a hidden input for the prefilled value if user is a member of 1 team' 


    it 'shows an explanation user is a member of multiple teams' 


    it 'shows a select with team options user is a member of multiple teams' 


    it 'shows an error alert with the error message if there is an error requesting teams' 


    it 'enables the submit button if the required fields are provided', :js do
      stub_teams(count: 1)

      click_link 'Add to Mattermost'

      expect(find('input[type="submit"]')['disabled']).not_to eq("true")
    end

    it 'disables the submit button if the required fields are not provided', :js do
      stub_teams(count: 1)

      click_link 'Add to Mattermost'

      fill_in('mattermost_trigger', with: '')

      expect(find('input[type="submit"]')['disabled']).to eq("true")
    end

    def stub_teams(count: 0)
      teams = create_teams(count)

      allow_any_instance_of(MattermostSlashCommandsService).to receive(:list_teams) { [teams, nil] }

      teams
    end

    def create_teams(count = 0)
      teams = []

      count.times do |i|
        teams.push({ "id" => "x#{i}", "display_name" => "x#{i}-name" })
      end

      teams
    end

    describe 'mattermost service is not enabled' do
      let(:mattermost_enabled) { false }

      it 'shows the correct trigger url' 


      it 'shows a token placeholder' 

    end
  end

  describe 'stable logo url' do
    it 'shows a publicly available logo' 

  end
end

