require "spec_helper"

RSpec.describe UsersController do
  let(:test_organization) { Fabricate(:organization) }
  let(:member_admin) do
    Fabricate(:member,
              organization: test_organization,
              manager: true)
  end
  let(:member) do
    Fabricate(:member,
              organization: test_organization,
              manager: false)
  end
  let(:another_member) do
    Fabricate(:member,
              organization: test_organization,
              manager: false)
  end
  let(:wrong_email_member) do
    Fabricate(:member,
              organization: test_organization,
              manager: false)
  end
  let(:empty_email_member) do
    Fabricate(:member,
              organization: test_organization,
              manager: false)
  end

  let!(:user) { member.user }
  let!(:another_user) { another_member.user }
  let!(:admin_user) { member_admin.user }
  let!(:wrong_user) { wrong_email_member.user }
  let!(:empty_email_user) { empty_email_member.user }

  include_context "stub browser locale"
  before { set_browser_locale("ca") }

  describe "GET #index" do
    before { login(user) }

    it 'sorts the users by their member_uid asc by default' 


    it 'allows to sort by member_uid' 


    context 'when a user has many memberships' do
      let!(:member_in_another_organization) { Fabricate(:member, user: user) }

      before do
        member.account.update_attribute(
          :balance,
          Time.parse('13:33').seconds_since_midnight
        )
      end

      it 'gets her membership in the current organization' 


      it 'shows data for her membership in the current organization' 

    end

    context "with an normal logged user" do
      it "populates and array of users" 

    end

    context "with an admin logged user" do
      it "populates and array of users" 

    end

    context 'when sorting by balance' do
      before do
        login(user)
        member_admin.account.update_attribute(:balance, 3600)
      end

      context 'desc' do
        let(:direction) { 'desc' }

        it 'orders the rows by their balance' 

      end

      context 'asc' do
        let(:direction) { 'asc' }

        it 'orders the rows by their balance' 

      end
    end

    context 'when searching' do
      it 'allows to search by member_uid' 

    end
  end

  describe "GET #show" do
    context "with valid params" do
      context "with a normal logged user" do
        before { login(another_user) }

        it "assigns the requested user to @user" 


        it 'links to new_transfer_path for his individual offers' 

      end

      context "with an admin logged user" do
        before { login(admin_user) }

        it "assigns the requested user to @user" 


        it 'links to new_transfer_path' 


        it 'links to new_transfer_path for his individual offers' 

      end
    end
  end

  describe "POST #create" do
    context "with empty email" do

      subject do
        post "create",
             user: Fabricate.to_params(:user,
                                       username: user.username + "2",
                                       email: "",
                                       phone: "1234",
                                       alt_phone: "4321")
      end

      before { login(admin_user) }

      it "can create a user with empty email and generates dummy email" 

    end

    context "with valid params" do
      subject { post "create", user: Fabricate.to_params(:user) }

      context "with a normal logged user" do
        it "does not create a new user" 

      end

      context "with an admin logged user" do
        before { login(admin_user) }

        it "creates a new user" 


        it "can create a user with a valid email" 


        it "cannot create a user with invalid email" 


        it "cannot create a user with dummy @example.com" 


        it "cannot create a user with existing e-mail" 


      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      context "with a logged" do
        context "normal user" do
          before { login(member.user) }
          it "locates the requested @user" 


          it "changes @user's own attributes" 


          it "cannot change another user's attributes" 

        end

        context "admin user" do
          before { login(admin_user) }

          it "locates the requested @user" 


          it "changes @user's attributes" 

        end
      end
    end

    context "with invalid params" do
      context "with a logged admin user" do
        before { login(admin_user) }

        it "does not change @user's attributes" 

      end
    end
  end
end

