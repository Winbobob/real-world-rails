# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "notification_mailer/embargo_expiring_notification.text.erb" do
  let!(:info_request) do
    FactoryBot.create(:embargo_expiring_request)
  end

  before do
    allow(AlaveteliConfiguration).
      to receive(:site_name).and_return("Something & something")
  end

  before do
    assign(:info_request, info_request)
    render
  end

  it "does not HTML escape the site name" 


  it "prints the message correctly" 

end

