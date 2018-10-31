# -*- encoding : utf-8 -*-
require File.expand_path(File.join('..', '..', '..', 'spec_helper'), __FILE__)

describe "outgoing_mailer/initial_request" do
  let(:body) { FactoryGirl.create(:public_body, :name => "Apostrophe's") }
  let(:request) { FactoryGirl.create(:info_request, :public_body => body) }
  let(:outgoing_message) { FactoryGirl.create(:initial_request) }

  it "does not add HTMLEntities to the public body name" 


  it "does not add HTMLEntities to the FOI law title" 


  it "does not add HTMLEntities to the public body email address" 

end

