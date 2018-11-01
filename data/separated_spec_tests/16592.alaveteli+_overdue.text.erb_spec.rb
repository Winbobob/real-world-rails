# -*- encoding : utf-8 -*-
require 'spec_helper'

describe(
  "notification_mailer/info_request_batches/messages/_overdue.text.erb") do
  let!(:public_body_1) { FactoryBot.create(:public_body, name: "One & Two") }
  let!(:public_body_2) { FactoryBot.create(:public_body) }
  let!(:batch_request) do
    batch = FactoryBot.create(:info_request_batch,
                              title: "Something & something else",
                              public_bodies: [public_body_1, public_body_2])
    batch.create_batch!
    batch
  end
  let!(:batch_requests) { batch_request.info_requests.order(:created_at) }
  let!(:batch_notifications) do
    notifications = []

    event_1 = FactoryBot.create(:overdue_event,
                                info_request: batch_requests.first)
    notification_1 = FactoryBot.create(:daily_notification,
                                       info_request_event: event_1)
    notifications << notification_1

    event_2 = FactoryBot.create(:overdue_event,
                                info_request: batch_requests.second)
    notification_2 = FactoryBot.create(:daily_notification,
                                       info_request_event: event_2)
    notifications << notification_2

    notifications
  end
  let(:template) do
    "notification_mailer/info_request_batches/messages/overdue"
  end

  before do
    render partial: template,
           locals: { notifications: batch_notifications }
  end

  it "doesn't escape HTMLEntities in public body names" 


  it "prints a link for each notification" 


  context "when there are multiple overdue requests" do
    it "prints pluralised messages" 

  end

  context "when there's just one overdue request" do
    it "prints singular messages" 

  end
end

