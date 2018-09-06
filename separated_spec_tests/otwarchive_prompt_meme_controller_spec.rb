require 'spec_helper'

describe Challenge::PromptMemeController do
  include LoginMacros

  describe "destroy" do
    before(:each) do
      @collection = FactoryGirl.create(:collection, challenge: PromptMeme.new)
      @collection.save
      fake_login_known_user(@collection.owners.first.user)
      delete :destroy, params: { id: @collection.challenge.id, collection_id: @collection.name }
    end

    it "remove challenge variables on Collection" 


    it "sets a flash message" 


    it "redirects to the collection's main page" 

  end
end

