require 'spec_helper'

describe 'User activates issue tracker', :js do
  let(:user) { create(:user) }
  let(:project) { create(:project) }

  let(:url) { 'http://tracker.example.com' }

  def fill_form(active = true)
    check 'Active' if active

    fill_in 'service_project_url', with: url
    fill_in 'service_issues_url', with: "#{url}/:id"
    fill_in 'service_new_issue_url', with: url
  end

  before do
    project.add_master(user)
    sign_in(user)

    visit project_settings_integrations_path(project)
  end

  shared_examples 'external issue tracker activation' do |tracker:|
    describe 'user sets and activates the Service' do
      context 'when the connection test succeeds' do
        before do
          stub_request(:head, url).to_return(headers: { 'Content-Type' => 'application/json' })

          click_link(tracker)
          fill_form
          click_button('Test settings and save changes')
          wait_for_requests
        end

        it 'activates the service' 


        it 'shows the link in the menu' 

      end

      context 'when the connection test fails' do
        it 'activates the service' 

      end
    end

    describe 'user sets the service but keeps it disabled' do
      before do
        click_link(tracker)
        fill_form(false)
        click_button('Save changes')
      end

      it 'saves but does not activate the service' 


      it 'does not show the external tracker link in the menu' 

    end
  end

  it_behaves_like 'external issue tracker activation', tracker: 'Redmine'
  it_behaves_like 'external issue tracker activation', tracker: 'Bugzilla'
  it_behaves_like 'external issue tracker activation', tracker: 'Custom Issue Tracker'
end

