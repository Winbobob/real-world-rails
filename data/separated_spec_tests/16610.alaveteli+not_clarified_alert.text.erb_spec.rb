# -*- encoding : utf-8 -*-
require File.expand_path(File.join('..', '..', '..', 'spec_helper'), __FILE__)

describe "request_mailer/not_clarified_alert" do
  let(:body) { FactoryBot.create(:public_body, :name => "Apostrophe's") }
  let(:request) { FactoryBot.create(:info_request, :public_body => body) }

  before do
    allow(AlaveteliConfiguration).to receive(:site_name).
      and_return("l'Information")
  end

  it "does not add HTMLEntities to the FOI law title" 


  it "does not add HTMLEntities to the public body name" 


  it "does not add HTMLEntities to the site name" 

end

