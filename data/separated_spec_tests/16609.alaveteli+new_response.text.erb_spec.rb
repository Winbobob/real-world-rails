# -*- encoding : utf-8 -*-
require File.expand_path(File.join('..', '..', '..', 'spec_helper'), __FILE__)

describe "request_mailer/new_response" do
  let(:incoming_message) { FactoryBot.create(:incoming_message) }
  let(:request) { incoming_message.info_request }

  before do
    allow(AlaveteliConfiguration).to receive(:site_name).
      and_return("l'Information")
  end

  it "does not add HTMLEntities to the FOI law title" 


  it "does not add HTMLEntities to the site name" 

end

