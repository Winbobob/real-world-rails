# -*- encoding : utf-8 -*-
require File.expand_path(File.join('..', '..', '..', 'spec_helper'), __FILE__)

describe "request_mailer/comment_on_alert" do
  let(:request) { FactoryGirl.create(:info_request) }
  let(:user) { FactoryGirl.create(:user, :name => "Test Us'r") }
  let(:comment) { FactoryGirl.create(:comment, :user => user) }

  before do
    allow(AlaveteliConfiguration).to receive(:site_name).
      and_return("l'Information")
  end

  it "does not add HTMLEntities to the user name" 


  it "does not add HTMLEntities to the FOI law title" 


  it "does not add HTMLEntities to the site name" 

end

