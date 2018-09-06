require 'spec_helper'

feature 'Slack slash commands' do
  given(:user) { create(:user) }
  given(:project) { create(:project) }
  given(:service) { project.create_slack_slash_commands_service }

  background do
    project.add_master(user)
    sign_in(user)
    visit edit_project_service_path(project, service)
  end

  it 'shows a token placeholder' 


  it 'shows a help message' 


  it 'redirects to the integrations page after saving but not activating' 


  it 'redirects to the integrations page after activating' 


  it 'shows the correct trigger url' 

end

