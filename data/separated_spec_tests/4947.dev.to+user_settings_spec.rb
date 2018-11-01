require "rails_helper"

RSpec.describe "UserSettings", type: :request do
  let(:user) { create(:user) }

  describe "GET /settings/:tab" do
    context "when not signed-in" do
      it "redirects them to login" 

    end

    context "when signed-in" do
      before { login_as user }

      it "renders various settings tabs properly" 


      it "handles unknown settings tab properly" 


      it "doesn't let user access membership if user has no monthly_dues" 


      it "allows user with monthly_dues to access membership" 


      it "allows users to visit the account page" 


      it "renders heads up dupe account message with proper param" 

    end
  end

  describe "PUT /update/:id" do
    before { login_as user }

    it "updates summary" 


    it "updates username to too short username" 

  end

  describe "DELETE /users/remove_association" do
    context "when user has two identities" do
      let(:user) { create(:user, :two_identities) }

      before { login_as user }

      it "allows the user to remove an identity" 


      it "removes the correct identity" 


      it "removes their associated username" 


      it "redirects successfully to /settings/account" 


      it "renders a successful response message" 


      it "does not show the Remove OAuth section afterward" 

    end

    # Users won't be able to do this via the view, but in case they hit the route somehow...
    context "when user has only one identity" do
      before { login_as user }

      it "sets the proper error message" 


      it "does not delete any identities" 


      it "redirects successfully to /settings/account" 

    end
  end

  describe "DELETE /users/destroy" do
    context "when user has no articles or comments" do
      before do
        login_as user
        delete "/users/destroy"
      end

      it "destroys the user" 


      it "sends an email to the user" 


      it "signs out the user" 


      it "redirects successfully to the home page" 

    end

    context "when users are not allowed to destroy" do
      let(:user_with_article) { create(:user, :with_article) }
      let(:user_with_comment) { create(:user, :with_only_comment) }
      let(:user_with_article_and_comment) { create(:user, :with_article_and_comment) }
      let(:users) { [user_with_article, user_with_comment, user_with_article_and_comment] }

      it "does not allow invalid users to delete their account" 


      it "redirects successfully to /settings/account" 


      it "shows the proper error message after redirecting" 

    end
  end
end

