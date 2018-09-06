# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "notification_mailer/very_overdue_notification.text.erb" do
  let(:body) { FactoryGirl.create(:public_body, :name => "Apostrophe's") }
  let(:request) do
    FactoryGirl.create(:info_request,
                       :public_body => body,
                       :title => "Request apostrophe's data")
  end

  before do
    allow(AlaveteliConfiguration).to receive(:site_name).
      and_return("l'Information")
  end

  it "does not add HTMLEntities to the FOI law title" 


  it "does not add HTMLEntities to the request title" 


  it "does not add HTMLEntities to the public body name" 


  it "does not add HTMLEntities to the site name" 

end
