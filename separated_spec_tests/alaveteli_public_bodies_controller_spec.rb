# -*- encoding : utf-8 -*-
require 'spec_helper'

RSpec.describe AlaveteliPro::PublicBodiesController do

  describe "#index" do
    let!(:pro_user) { FactoryGirl.create(:pro_user) }
    let!(:body) { FactoryGirl.create(:public_body, :name => 'example') }
    let!(:defunct_body) do
      FactoryGirl.create(:defunct_public_body, :name => 'defunct')
    end
    let!(:not_apply_body) do
      FactoryGirl.create(:not_apply_public_body, :name => 'not_apply')
    end
    let!(:not_requestable_body) do
      FactoryGirl.create(:public_body, :name => 'not_requestable',
                                       :request_email => 'blank')
    end

    before do
      session[:user_id] = pro_user.id
      update_xapian_index
    end

    it "returns json" 


    it "returns bodies which match the search query" 


    it "returns a whitelisted set of properties for each body" 


    it "excludes defunct bodies" 


    it "excludes not_apply bodies" 


    it "excludes bodies that aren't requestable" 

  end
end

