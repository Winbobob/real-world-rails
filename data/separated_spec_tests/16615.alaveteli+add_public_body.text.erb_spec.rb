# -*- encoding : utf-8 -*-
require File.expand_path(File.join('..', '..', '..', 'spec_helper'), __FILE__)

describe "contact_mailer/add_public_body" do
  let(:user) { FactoryBot.create(:user, :name => "Test Us'r") }
  let(:change_request) do
    FactoryBot.create(
      :add_body_request,
      :public_body_name => "Apostrophe's",
      :user => user,
      :notes => "Meeting starts at 12 o'clock")
  end

  before do
    allow(AlaveteliConfiguration).to receive(:site_name).
      and_return("l'Information")
  end

  it "does not add HTMLEntities to the user name" 


  it "does not add HTMLEntities to the site name" 


  it "does not add HTMLEntities to the public body name" 


end

