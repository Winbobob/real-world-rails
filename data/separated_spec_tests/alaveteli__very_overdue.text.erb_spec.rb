# -*- encoding : utf-8 -*-
require 'spec_helper'

describe("notification_mailer/info_requests/messages/_very_overdue.text.erb") do
  let!(:public_body) { FactoryGirl.create(:public_body, name: "One & Two") }
  let!(:info_request) do
    FactoryGirl.create(:overdue_request, public_body: public_body)
  end
  let!(:info_request_event) do
    FactoryGirl.create(:overdue_event, info_request: info_request)
  end
  let!(:notification) do
    FactoryGirl.create(:daily_notification,
                       info_request_event: info_request_event)
  end
  let(:template) do
    "notification_mailer/info_requests/messages/overdue"
  end

  before do
    allow(info_request).to receive(:law_used_human).and_return("FOI & EIR")
    render partial: template, locals: { info_request: info_request }
  end

  it "doesn't escape HTMLEntities in the public_body name" 


  it "doesn't escape HTMLEntities in the law used" 


  it "prints a link for the request" 

end

