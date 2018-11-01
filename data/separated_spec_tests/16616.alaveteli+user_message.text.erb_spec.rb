# -*- encoding : utf-8 -*-
require File.expand_path(File.join('..', '..', '..', 'spec_helper'), __FILE__)

describe "contact_mailer/user_message" do
  let(:user) { FactoryBot.create(:user, :name => "Test Us'r") }

  before do
    allow(AlaveteliConfiguration).to receive(:site_name).
      and_return("l'Information")
    assign(:message, "hi!")
  end

  it "does not add HTMLEntities to the site name" 


  it "does not add HTMLEntities to the user name" 

end

