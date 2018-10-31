# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "notification_mailer/response_notification.text.erb" do
  let(:notification) { FactoryBot.create(:notification) }
  let(:info_request_event) { notification.info_request_event }
  let(:incoming_message) { info_request_event.incoming_message }
  let(:info_request) { info_request_event.info_request }

  before do
    allow(AlaveteliConfiguration).to receive(:site_name).
      and_return("l'Information")
  end

  it "does not add HTMLEntities to the FOI law title" 


  it "does not add HTMLEntities to the site name" 

end

