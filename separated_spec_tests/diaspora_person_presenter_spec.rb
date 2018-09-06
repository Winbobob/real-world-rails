# frozen_string_literal: true

describe PersonPresenter do
  let(:profile_user) { FactoryGirl.create(:user_with_aspect) }
  let(:person) { profile_user.person }

  let(:mutual_contact) {
    FactoryGirl.create(:contact, user: current_user, person: person, sharing: true, receiving: true)
  }
  let(:receiving_contact) {
    FactoryGirl.create(:contact, user: current_user, person: person, sharing: false, receiving: true)
  }
  let(:sharing_contact) {
    FactoryGirl.create(:contact, user: current_user, person: person, sharing: true, receiving: false)
  }
  let(:non_contact) {
    FactoryGirl.create(:contact, user: current_user, person: person, sharing: false, receiving: false)
  }

  describe "#as_json" do
    context "with no current_user" do
      it "returns the user's basic profile" 


      it "returns the user's additional profile if the user has set additional profile public" 


      it "doesn't return user's additional profile if the user hasn't set additional profile public" 

    end

    context "with a current_user" do
      let(:current_user) { FactoryGirl.create(:user) }
      let(:presenter){ PersonPresenter.new(person, current_user) }
      # here private information == addtional user profile, because additional profile by default is private

      it "doesn't share private information when the users aren't connected" 


      it "doesn't share private information when the current user is sharing with the person" 


      it "shares private information when the users aren't connected, but profile is public" 


      it "has private information when the person is sharing with the current user" 


      it "has private information when the relationship is mutual" 


      it "returns the user's private information if a user is logged in as herself" 

    end
  end

  describe "#full_hash" do
    let(:current_user) { FactoryGirl.create(:user) }

    before do
      @p = PersonPresenter.new(person, current_user)
    end

    context "relationship" do
      it "is mutual?" 


      it "is receiving?" 


      it "is sharing?" 


      it "isn't sharing?" 

    end

    describe "block" do
      it "contains the block id if it exists" 


      it "is false if no block is present" 

    end
  end

  describe "#hovercard" do
    let(:current_user) { FactoryGirl.create(:user) }
    let(:presenter) { PersonPresenter.new(person, current_user) }

    it "contains data required for hovercard" 

  end
end

