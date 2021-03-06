# -*- encoding : utf-8 -*-
require File.expand_path(File.join('..', '..', '..', 'spec_helper'), __FILE__)

describe "request_mailer/stopped_responses" do
  let(:user) { FactoryBot.create(:user, :name => "Test Us'r") }
  let(:body) { FactoryBot.create(:public_body, :name => "Apostrophe's") }
  let(:request) do
    FactoryBot.create(:info_request,
                      :public_body => body,
                      :user => user,
                      :title => "Request apostrophe's data")
  end

  before do
    allow(AlaveteliConfiguration).to receive(:site_name).
      and_return("l'Information")
    assign(:contact_email, "nospam@example.com")
  end

  it "does not add HTMLEntities to the FOI law title" 


  it "does not add HTMLEntities to the request title" 


  it "does not add HTMLEntities to the user name" 


  it "does not add HTMLEntities to the public body name" 


  it "does not add HTMLEntities to the contact email" 


  it "does not add HTMLEntities to the site name" 

end

