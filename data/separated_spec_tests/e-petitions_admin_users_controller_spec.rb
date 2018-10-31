require 'rails_helper'

RSpec.describe Admin::AdminUsersController, type: :controller, admin: true do
  describe "not logged in" do
    describe "GET 'index'" do
      it "should redirect to the login page" 

    end

    describe "GET 'new'" do
      it "should redirect to the login page" 

    end
  end

  describe "logged in as moderator user" do
    let(:user) { FactoryBot.create(:moderator_user) }
    before :each do
      login_as(user)
    end

    describe "GET 'index'" do
      it "should be unsuccessful" 

    end
  end

  context "logged in as sysadmin but need to reset password" do
    let(:user) { FactoryBot.create(:sysadmin_user, :force_password_reset => true) }
    before :each do
      login_as(user)
    end

    it "should redirect to edit profile page" 

  end

  describe "logged in as sysadmin user" do
    let(:user) { FactoryBot.create(:sysadmin_user, :first_name => 'Sys', :last_name => 'Admin') }
    before :each do
      login_as(user)
    end

    describe "GET 'index'" do
      before :each do
        @user1 = FactoryBot.create(:moderator_user, :first_name => 'John', :last_name => 'Kennedy')
        @user2 = FactoryBot.create(:moderator_user, :first_name => 'Hilary', :last_name => 'Clinton')
        @user3 = FactoryBot.create(:moderator_user, :first_name => 'Ronald', :last_name => 'Reagan')
        @user4 = FactoryBot.create(:moderator_user, :first_name => 'Bill', :last_name => 'Clinton')
      end

      it "should be successful" 


      it "should display a list of users (sorted by name)" 

    end

    describe "GET 'new'" do
      it "should be successful" 


      it "should assign a new user" 

    end

    describe "POST 'create'" do
      def do_create
        post :create, :admin_user => admin_user_attributes
      end

      describe "with valid params" do
        let(:admin_user_attributes) do
          {
            :first_name => 'John',
            :last_name => 'Kennedy',
            :role => 'moderator',
            :email => 'admin@example.com',
            :password => 'Letmein1!',
            :password_confirmation => 'Letmein1!'
          }
        end

        it "should create a new user" 


        it "should redirect to the index" 

      end

      describe "with invalid params" do
        let(:admin_user_attributes) do
          {
            :email => 'admin@example.com'
          }
        end

        it "should not create a new user" 


        it "should re-render the new template" 

      end
    end

    describe "GET 'edit'" do
      let(:edit_user) { FactoryBot.create(:moderator_user) }

      def do_get
        get :edit, :id => edit_user.to_param
      end

      it "should be successful" 


      it "should assign the user" 

    end

    describe "PUT 'update'" do
      let(:edit_user) { FactoryBot.create(:moderator_user, :email => "admin@example.com", :failed_login_count => 5) }

      def do_update
        patch :update,
          :id => edit_user.to_param,
          :admin_user => admin_user_attributes
      end

      describe "with valid params" do
        let(:admin_user_attributes) do
          {
            :email => "another_admin@example.com",
            :account_disabled => '0'
          }
        end

        it "should update the user and redirect to the index" 


        it "should reset the failed login count to 0" 

      end

      describe "with invalid params" do
        let(:admin_user_attributes) do
          {
            :email => "bademailaddress"
          }
        end

        it "should not update the user" 

      end
    end

    describe "DELETE 'destroy'" do
      let(:delete_user) { FactoryBot.create(:moderator_user, :email => 'admin@example.com') }

      it "deletes the requested user" 


      it "will not let you delete yourself" 

    end
  end
end

