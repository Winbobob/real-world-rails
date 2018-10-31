# -*- encoding : utf-8 -*-
require File.expand_path(File.join('..', '..', '..', 'spec_helper'), __FILE__)

describe "contact_mailer/update_public_body_email" do
  let(:user) { FactoryBot.create(:user, :name => "Test Us'r") }
  let(:public_body) do
    FactoryBot.create(:public_body, :name => "Apostrophe's")
  end
  let(:change_request) do
    FactoryBot.create(
      :update_body_request,
      :public_body => public_body,
      :user => user)
  end

  it "does not add HTMLEntities to the user name" 


  it "does not add HTMLEntities to the public body name" 

end

