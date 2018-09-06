require 'rails_helper'

RSpec.describe Admin::ProfileController, type: :controller, admin: true do
  before :each do
    @user = FactoryBot.create(:sysadmin_user, :password => 'Letmein1!',
                           :password_confirmation => 'Letmein1!', :force_password_reset => true)
  end

  describe "not logged in" do
    describe "GET 'edit'" do
      it "should redirect to the login page" 

    end
  end

  context "logged in but need to reset password" do
    before :each do
      login_as(@user)
    end

    it "should render successfully" 

  end

  context "logged in" do
    before :each do
      login_as(@user)
    end

    describe "GET 'edit'" do
      it "should render successfully" 

    end

    describe "GET 'update'" do
      def do_patch(current_password, new_password, password_confirmation)
        admin_user_attributes = {
          current_password: current_password,
          password: new_password,
          password_confirmation: password_confirmation
        }
        patch :update, id: 50000, admin_user: admin_user_attributes
      end

      context "successful password change" do
        it "should update password" 


        it "should update password_changed_at to current time" 


        it "should set force_password_reset to false" 


        it "should redirect" 

      end

      context "unsuccessful password change" do
        it "should have current password incorrect" 


        it "should not update password_changed_at" 


        it "should have current password and new password are the same" 


        it "should have new password as invalid" 


        it "should have password as invalid when confirmation is different" 

      end
    end
  end
end

