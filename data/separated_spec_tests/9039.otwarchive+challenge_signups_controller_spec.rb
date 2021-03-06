require 'spec_helper'

describe ChallengeSignupsController, type: :controller do
  include LoginMacros
  include RedirectExpectationHelper
  let(:user) { create(:user) }
 
  let(:closed_challenge) { create(:gift_exchange, :closed) }
  let(:closed_collection) { create(:collection, challenge: closed_challenge) }
  let(:closed_signup) { create(:gift_exchange_signup, collection_id: closed_collection.id) }
  let(:closed_collection_owner) { User.find(closed_collection.all_owners.first.user_id) }
  let(:closed_signup_owner) { Pseud.find(closed_signup.pseud_id).user }

  let(:open_challenge) { create(:gift_exchange, :open) }
  let(:open_collection) { create(:collection, challenge: open_challenge) }
  let(:open_signup) { create(:gift_exchange_signup, collection_id: open_collection.id) }
  let(:open_collection_owner) { User.find(open_collection.all_owners.first.user_id) }
  let(:open_signup_owner) { Pseud.find(open_signup.pseud_id).user }

  describe "new" do
    context "when sign-ups are closed" do
      it "redirects and errors" 

    end

    context "when sign-ups are open" do
      it "redirects to edit page with notice if user is already signed up" 

    end

    context "when collection has no challenge" do
      let(:plain_collection) { create(:collection) }

      it "redirects and errors" 

    end
  end

  describe "show" do
    # TODO: AO3-5552
    xit "redirects and errors if there is no sign-up with that id" do
      fake_login
      get :show, params: { id: 0, collection_id: closed_collection.name }
      it_redirects_to_with_error(collection_path(closed_collection),
                                 "What sign-up did you want to work on?")
    end

    it "redirects and errors if the user does not own the sign-up or the collection" 

  end

  describe "index" do
    it "redirects and errors if the current user is not allowed to see the specified user's sign-ups" 


    it "redirects and errors if the current user is not allowed to see the CSV" 

  end

  describe "destroy" do
    context "when sign-ups are open" do
      it "deletes the sign-up and redirects with notice" 

    end
    context "when sign-ups are closed" do
      it "redirects and errors" 

    end
  end

  describe "update" do
    context "when sign-ups are open" do
      let(:params) do
        { 
          challenge_signup: { pseud_id: open_signup_owner.pseuds.first.id },
          id: open_signup,
          collection_id: open_collection.name
        }
      end

      it "renders edit if update_attributes fails" 


      it "redirects and errors if the current user can't edit the sign-up" 

    end

    context "when sign-ups are closed" do
      let(:params) do
        { 
          challenge_signup: { pseud_id: closed_signup_owner.pseuds.first.id },
          id: closed_signup,
          collection_id: closed_collection.name
        }
      end

      it "redirects and errors without updating the sign-up" 


      it "redirects and errors if the current user can't edit the sign-up" 

    end
  end

  describe "gift_exchange_to_csv" do
    let(:collection) { create(:collection, challenge: create(:gift_exchange)) }
    let(:signup) { create(:gift_exchange_signup, collection_id: collection.id) }

    before do
      signup_offer = signup.offers.first
      signup_offer.tag_set = create(:tag_set)
      signup_offer.save
      
      signup_request = signup.requests.first
      signup_request.tag_set = create(:tag_set)
      signup_request.save
    end

    it "generates a CSV with all the challenge information" 

  end

  describe "prompt_meme_to_csv" do
    let(:tag_set) { create(:tag_set) }
    let(:collection) { create(:collection, challenge: create(:prompt_meme)) }
    let(:signup) { create(:prompt_meme_signup, collection_id: collection.id) }

    before do
      prompt = signup.prompts.first
      prompt.tag_set = create(:tag_set)
      prompt.save
    end

    it "generates a CSV with all the challenge information" 

  end
end

