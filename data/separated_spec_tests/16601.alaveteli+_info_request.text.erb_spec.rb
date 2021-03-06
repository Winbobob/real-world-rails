# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "notification_mailer/info_requests/_info_request.text.erb" do
  let(:notification) { FactoryBot.create(:notification) }
  let(:info_request_event) { notification.info_request_event }
  let(:incoming_message) { info_request_event.incoming_message }
  let(:info_request) { info_request_event.info_request }
  let(:template) do
    "notification_mailer/info_requests/info_request.text.erb"
  end

  before do
    render partial: template,
           locals: { info_request: info_request,
                     notifications: [notification] }
  end

  it "renders the notification partial for the event type" 

end

