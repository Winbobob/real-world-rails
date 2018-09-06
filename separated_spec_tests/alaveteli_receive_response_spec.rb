# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../alaveteli_dsl')

describe "receiving responses to requests in alaveteli_pro" do
  context "when an embargoed request gets a new response" do
    let!(:pro_user) { FactoryGirl.create(:pro_user) }
    let!(:pro_user_session) { login(pro_user) }
    let!(:info_request) do
      FactoryGirl.create(:embargo_expiring_request,
                         :user => pro_user)
    end

    it "appears in the request list as having received a response" 


  end

end

