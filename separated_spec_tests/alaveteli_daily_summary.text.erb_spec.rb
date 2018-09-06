# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "notification_mailer/daily_summary" do
  let(:notifications) { FactoryGirl.create_list(:notification, 5) }
  let(:grouped_notifications) do
    notifications.group_by { |n| n.info_request_event.info_request }
  end

  before do
    allow(AlaveteliConfiguration).to receive(:site_name).
      and_return("l'Information")
  end

  it "does not add HTMLEntities to the site name" 

end

