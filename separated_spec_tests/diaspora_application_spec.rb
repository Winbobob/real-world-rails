# frozen_string_literal: true

describe ApplicationController, type: :request do
  describe "csrf token validation" do
    context "without a current user" do
      before do
        @user = alice
        @user.password = "evankorth"
        @user.password_confirmation = "evankorth"
        @user.save
      end

      it "redirects to the new session page on validation fails" 


      it "doesn't redirect to the new session page if the validation succeeded" 

    end

    context "with a current user" do
      before do
        sign_in alice
      end

      it "signs out users if a wrong token was given" 


      it "sends an email to the current user if the token validation failed" 


      it "doesn't sign out users if the token was correct" 

    end
  end
end

