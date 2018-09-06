require 'spec_helper'

describe 'User activates Slack notifications' do
  let(:user) { create(:user) }
  let(:service) { SlackService.new }
  let(:project) { create(:project, slack_service: service) }

  before do
    project.add_master(user)
    sign_in(user)
  end

  context 'when service is not configured yet' do
    before do
      visit(project_settings_integrations_path(project))

      click_link('Slack notifications')
    end

    it 'activates service' 

  end

  context 'when service is already configured' do
    before do
      service.fields
      service.update_attributes(
        push_channel: 1,
        issue_channel: 2,
        merge_request_channel: 3,
        note_channel: 4,
        tag_push_channel: 5,
        pipeline_channel: 6,
        wiki_page_channel: 7)

      visit(edit_project_service_path(project, service))
    end

    it 'filters events by channel' 

  end
end

