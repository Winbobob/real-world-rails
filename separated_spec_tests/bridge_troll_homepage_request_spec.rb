require 'rails_helper'

describe "visiting the home page" do
  describe "as an unauthenticated user" do
    let(:new_user_form_values) { {
      first_name: "Jane",
      last_name: "Doe",
      email: "jane@doe.com",
      password: "password"
    } }

    it "can sign up" 


    it "has a sign up link in the upcoming events section" 

  end

  describe "as an authenticated user" do
    before do
      @user = create(:user)
      sign_in_as(@user)
    end

    it "has a link to email notification preferences" 

  end

  describe "navbar" do
    describe "as an unauthenticated user" do
      it "has only sign in / sign up links" 

    end

    describe "as an authenticated user" do
      before do
        @user = create(:user)
        sign_in_as(@user)
      end

      it 'allows the user to log out or view/edit their account details' 

    end
  end
end

