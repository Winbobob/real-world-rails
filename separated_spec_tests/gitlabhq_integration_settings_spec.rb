require 'spec_helper'

describe 'Projects > Settings > Integration settings' do
  let(:project) { create(:project) }
  let(:user) { create(:user) }
  let(:role) { :developer }
  let(:integrations_path) { project_settings_integrations_path(project) }

  before do
    sign_in(user)
    project.add_role(user, role)
  end

  context 'for developer' do
    let(:role) { :developer }

    it 'to be disallowed to view' 

  end

  context 'for master' do
    let(:role) { :master }

    context 'Webhooks' do
      let(:hook) { create(:project_hook, :all_events_enabled, enable_ssl_verification: true, project: project) }
      let(:url) { generate(:url) }

      it 'show list of webhooks' 


      it 'create webhook' 


      it 'edit existing webhook' 


      it 'test existing webhook', :js do
        WebMock.stub_request(:post, hook.url)
        visit integrations_path

        find('.hook-test-button.dropdown').click
        click_link 'Push events'

        expect(current_path).to eq(integrations_path)
      end

      context 'remove existing webhook' do
        it 'from webhooks list page' 


        it 'from webhook edit page' 

      end
    end

    context 'Webhook logs' do
      let(:hook) { create(:project_hook, project: project) }
      let(:hook_log) { create(:web_hook_log, web_hook: hook, internal_error_message: 'some error') }

      it 'show list of hook logs' 


      it 'show hook log details' 


      it 'retry hook log' 

    end
  end
end

