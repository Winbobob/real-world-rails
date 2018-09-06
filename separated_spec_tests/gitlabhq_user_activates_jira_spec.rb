require 'spec_helper'

describe 'User activates Jira', :js do
  let(:user) { create(:user) }
  let(:project) { create(:project) }

  let(:url) { 'http://jira.example.com' }
  let(:test_url) { 'http://jira.example.com/rest/api/2/serverInfo' }

  def fill_form(active = true)
    check 'Active' if active

    fill_in 'service_url', with: url
    fill_in 'service_username', with: 'username'
    fill_in 'service_password', with: 'password'
    fill_in 'service_jira_issue_transition_id', with: '25'
  end

  before do
    project.add_master(user)
    sign_in(user)

    visit project_settings_integrations_path(project)
  end

  describe 'user sets and activates Jira Service' do
    context 'when Jira connection test succeeds' do
      before do
        server_info = { key: 'value' }.to_json
        WebMock.stub_request(:get, test_url).with(basic_auth: %w(username password)).to_return(body: server_info)

        click_link('JIRA')
        fill_form
        click_button('Test settings and save changes')
        wait_for_requests
      end

      it 'activates the JIRA service' 


      it 'shows the JIRA link in the menu' 

    end

    context 'when Jira connection test fails' do
      it 'shows errors when some required fields are not filled in' 


      it 'activates the JIRA service' 

    end
  end

  describe 'user sets Jira Service but keeps it disabled' do
    before do
      click_link('JIRA')
      fill_form(false)
      click_button('Save changes')
    end

    it 'saves but does not activate the JIRA service' 


    it 'does not show the JIRA link in the menu' 

  end
end

