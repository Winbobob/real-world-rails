# -*- encoding : utf-8 -*-
require 'spec_helper'

RSpec.describe AlaveteliPro::PublicBodiesController do

  describe "#index" do
    let!(:pro_user) { FactoryBot.create(:pro_user) }
    let!(:body) { FactoryBot.create(:public_body, :name => 'example') }
    let!(:defunct_body) do
      FactoryBot.create(:defunct_public_body, :name => 'defunct')
    end
    let!(:not_apply_body) do
      FactoryBot.create(:not_apply_public_body, :name => 'not_apply')
    end
    let!(:not_requestable_body) do
      FactoryBot.create(:public_body, :name => 'not_requestable',
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

