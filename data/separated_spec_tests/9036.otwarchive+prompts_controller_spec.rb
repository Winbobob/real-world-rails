require "spec_helper"

describe PromptsController do
  include LoginMacros
  include RedirectExpectationHelper

  let(:collection) { create(:collection) }
  let(:open_signup) do
    signups = create(:challenge_signup)
    signups.collection.challenge.signup_open = true
    signups.collection.challenge.save
    signups
  end
  let(:signup) { create(:challenge_signup) }

  let(:user) { create(:user) }
  before do
    fake_login_known_user(user)
  end

  describe "no_challenge" do
    it "should show an error and redirect" 

  end

  describe "no_signup" do
    it "should show an error and redirect" 

  end

  describe "signups_closed" do
    let(:user) { Pseud.find(ChallengeSignup.in_collection(signup.collection).first.pseud_id).user }
    it "should show an error and redirect" 

  end

  describe "not_signup_owner" do
    it "should show an error and redirect" 

  end

  describe "new" do
    context "when prompt_type is offer" do
      let(:user) { Pseud.find(ChallengeSignup.in_collection(open_signup.collection).first.pseud_id).user }
      it "should have no errors" 

    end
  end

  describe "create" do
    let(:user) { Pseud.find(ChallengeSignup.in_collection(open_signup.collection).first.pseud_id).user }
    it "should have no errors and redirect to the edit page" 

  end

  describe "update" do
    context "when prompt is valid" do
      let(:user) { Pseud.find(ChallengeSignup.in_collection(open_signup.collection).first.pseud_id).user }
      it "should save the prompt and redirect with a success message" 

    end
  end

  describe "destroy" do
    let(:user) { Pseud.find(ChallengeSignup.in_collection(signup.collection).first.pseud_id).user }
    it "redirects with an error when sign-ups are closed" 


    context "where current_user is signup owner" do
      let(:user) { Pseud.find(ChallengeSignup.in_collection(open_signup.collection).first.pseud_id).user }
      it "redirects with an error when it would make a sign-up invalid" 


      it "deletes the prompt and redirects with a success message" 

    end
  end

  describe "edit" do
    context "no prompt" do
      it "should show an error and redirect" 

    end
  end
end

