require 'spec_helper'

describe ChallengeAssignmentsController do
  include LoginMacros
  include RedirectExpectationHelper

  context "when not logged in" do
    describe 'no_challenge' do
      let(:collection) { create(:collection) }

      it 'error to login page' 

    end

    describe "defaulting" do
      it "fails because no user specified" 

    end
  end

  context "when logged in" do
    let(:gift_exchange) { create(:gift_exchange) }
    let(:collection) { create(:collection, challenge: gift_exchange, challenge_type: "GiftExchange") }
    let(:user) { collection.owners.first.user }
    let(:otheruser) { create(:user) }

    describe 'no_challenge' do
      let(:collectionwithoutchallenge) { create(:collection) }
      let(:usernochallenge) { collectionwithoutchallenge.owners.first.user }

      it 'show an error, redirect to collection and return false for mod' 


      it 'show an error, redirect to user and return false for non-mod' 

    end

    describe 'no_assignment with collection' do
      it 'show an error, redirect and return false' 

    end

    describe 'no_assignment with no collection' do
      it 'show an error, redirect and return false' 

    end

    describe "defaulting" do
      let(:open_assignment) { create(:challenge_assignment, collection_id: collection.id) }

      it "fails if user not specified" 


      it "fails if you're not the owner of the assignment you're defaulting on" 

    end

    describe "show" do
      let(:defaulted_assignment) { create(:challenge_assignment, collection_id: collection.id, defaulted_at: Time.now) }

      it "won't show if you're not the right user" 


      it "will tell you if you've defaulted" 

    end

    describe "index" do
      render_views
      let!(:open_assignment) { create(:challenge_assignment, collection_id: collection.id) }
      let!(:defaulted_assignment) { create(:challenge_assignment, collection_id: collection.id, defaulted_at: Time.now) }

      it "errors if you're not a mod and try to see someone else's assignment" 


      it "shows defaulted assignments within a collection" 


      it "shows unfulfilled assignments within a collection" 


      it "won't show specific to that user and collection for offering user" 


      it "shows specific to that user and collection for mod" 

    end
  end
end

