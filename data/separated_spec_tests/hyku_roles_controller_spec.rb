RSpec.describe RolesController, type: :controller do
  before do
    sign_in user
  end

  let(:valid_attributes) do
    { site_roles: ['admin'] }
  end

  context 'with an unprivileged user' do
    let(:user) { create(:user) }

    describe "GET #edit" do
      it "denies the request" 

    end

    describe "PUT #update" do
      it "denies the request" 

    end
  end

  context 'with an administrator' do
    let(:user) { FactoryGirl.create(:admin) }

    describe "GET #index" do
      before do
        # it should not return guest users
        create(:user, guest: true)
      end

      it "assigns the users as @users" 

    end

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) do
          { site_roles: ['admin', 'superadmin'] }
        end

        it "updates the requested role" 


        it "assigns the requested user as @user" 


        it "redirects to the site roles" 

      end
    end
  end
end

