require "spec_helper"

describe "legacy URL redirection", type: :request do

  before(:each) do
    @person = FactoryGirl.create(:person)
    @community = FactoryGirl.create(:community, :domain => "market.custom.org", use_domain: true)
  end

  it "redirects /people/:id to /:username" 


  it "redirects /people/:id/settings to /:username/settings" 


  it "redirects /en/people/:id/settings to /:username/settings" 


  it "doesn't redirect /people/incorrect_id" 


end

