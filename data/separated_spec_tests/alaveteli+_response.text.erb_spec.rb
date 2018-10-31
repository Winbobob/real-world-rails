# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "notification_mailer/info_requests/messages/_response.text.erb" do
  let!(:notification) { FactoryBot.create(:notification) }
  let!(:info_request_event) { notification.info_request_event }
  let!(:incoming_message) { info_request_event.incoming_message }
  let!(:info_request) do
    info_request = info_request_event.info_request
    info_request.title = "Something & Something else"
    info_request.save!
    info_request
  end
  let!(:public_body) do
    public_body = info_request.public_body
    public_body.name = "One & Two"
    public_body.save!
    info_request.reload
    public_body
  end
  let(:template) { "notification_mailer/info_requests/messages/response" }

  before do
    allow(info_request).to receive(:law_used_human).and_return("FOI & EIR")
    render partial: template,
           locals: { info_request: info_request,
                     info_request_event: info_request_event }
  end

  it "prints a link to the response" 


  it "doesn't escape HTMLEntities in the law used" 


  it "doesn't escape HTMLEntities in info_request title" 


  it "doesn't escape HTMLEntities in the public_body name" 

end

