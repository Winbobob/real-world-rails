# -*- encoding : utf-8 -*-
require File.expand_path(File.join('..', '..', '..', 'spec_helper'), __FILE__)

describe "request_mailer/comment_on_alert_plural" do
  let(:request) { FactoryBot.create(:info_request) }
  let(:comment) { FactoryBot.create(:comment) }

  before do
    allow(AlaveteliConfiguration).to receive(:site_name).
      and_return("l'Information")
  end

  it "does not add HTMLEntities to the FOI law title" 


  it "does not add HTMLEntities to the site name" 

end

