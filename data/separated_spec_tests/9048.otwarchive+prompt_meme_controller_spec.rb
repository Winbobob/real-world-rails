require 'spec_helper'

describe Challenge::PromptMemeController do
  include LoginMacros
  include RedirectExpectationHelper

  let(:collection) { create(:collection, challenge: PromptMeme.new) }

  describe "new" do
    context "when the collection already has a challenge" do
      before do
        fake_login_known_user(collection.owners.first.user)
        post :new, params: { collection_id: collection.name }
      end

      it "redirects to edit meme collection path with notice" 

    end
  end

  describe "update" do
    context "when it fails to update parameters" do
      before do
        fake_login_known_user(collection.owners.first.user)
        allow_any_instance_of(PromptMeme).to receive(:update_attributes).and_return(false)
        allow(controller).to receive(:prompt_meme_params).and_return({})
        post :update, params: { collection_id: collection.name, prompt_meme: {} }
      end

      it "renders edit page" 


      after do
        allow(controller).to receive(:prompt_meme_params).and_call_original
        allow_any_instance_of(PromptMeme).to receive(:update_attributes).and_call_original
      end
    end
  end

  describe "destroy" do
    before(:each) do
      collection.save
      fake_login_known_user(collection.owners.first.user)
      delete :destroy, params: { id: collection.challenge.id, collection_id: collection.name }
    end

    it "remove challenge variables on Collection" 


    it "sets a flash message" 


    it "redirects to the collection's main page" 

  end
end

