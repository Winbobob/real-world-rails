require 'rails_helper'

RSpec.describe ExternalUsers::Admin::ExternalUsersController, type: :controller do
  let(:provider) { create(:provider) }

  context 'admin user' do
    let(:admin) { create(:external_user, :admin, provider: provider) }

    subject { create(:external_user, provider: provider) }

    before { sign_in admin.user }

    describe "GET #index" do

      it "returns http success" 


      it 'assigns @eternal_users' 


      it 'renders the template' 

    end

    describe "GET #show" do
      before { get :show, params: { id: subject } }

      it "returns http success" 


      it 'assigns @external_user' 


      it 'renders the template' 

    end

    describe "GET #new" do
      before { get :new }

      it "returns http success" 


      it 'assigns @external_user' 


      it 'renders the template' 

    end

    describe "GET #edit" do
      before { get :edit, params: { id: subject } }

      it "returns http success" 


      it 'assigns @external_user' 


      it 'renders the template' 

    end

    describe "GET #change_password" do
      before { get :change_password, params: { id: subject } }

      it "returns http success" 


      it 'assigns @external_user' 


      it 'renders the template' 

    end

    describe "POST #create" do
      context 'when valid' do
        let(:params) {
          {
            external_user: {
              user_attributes: {
                email: 'foo@foobar.com',
                password: 'password',
                password_confirmation: 'password',
                first_name: 'John',
                last_name: 'Smith',
                email_notification_of_message: 'true'
              },
              roles: ['advocate'],
              supplier_number: 'AB124'
            }
          }
        }

        it 'creates a external_user' 


        it 'redirects to external_users index' 

      end

      context 'when invalid' do
        it 'does not create a external_user' 


        it 'renders the new template' 

      end
    end

    describe "PUT #update" do

      context 'when valid' do
        before(:each) { put :update, params: { id: subject, external_user: { roles: ['admin'] } } }

        it 'updates a external_user' 


        it 'redirects to external_users index' 

      end

      context 'when invalid' do
        before(:each) { put :update, params: { id: subject, external_user: { roles: ['foo'] } } }

        it 'does not update external_user' 


        it 'renders the edit template' 

      end
    end

    describe "PUT #update_password" do

      before do
        subject.user.update(password: 'password', password_confirmation: 'password')
        sign_in subject.user #need to sign in again after password change
      end

      context 'when valid' do
        before(:each) do
          put :update_password, params: { id: subject, external_user: { user_attributes: { current_password: 'password', password: 'password123', password_confirmation: 'password123' } } }
        end

        it 'redirects to external_user show action' 

      end

      context 'when mandatory params for external user are not provided' do
        it 'raises a paramenter missing error' 

      end

      context 'when invalid' do
        it 'renders the change password template' 

      end
    end

    describe "DELETE #destroy" do


      it 'destroys the external user' 


      it 'redirects to external_user admin root url' 

    end
  end


  ######################## NON ADMIN USER #################

  context 'non-admin user' do
    let(:external_user)         { create(:external_user, provider: provider) }
    let(:other_external_user)   { create(:external_user, provider: provider) }

    before do
      2.times { create :user }
      sign_in external_user.user
    end

    describe "GET #index" do
      it 'redirects to all claims page with Unauthorised in flash' 

    end

    describe "GET #show" do
      it 'displays the show page for the current user' 


      it 'doesnt show the details for a different user' 

    end

    describe "GET #new" do
      it 'redirects to all claims page with Unauthorised in flash' 

    end

    describe "POST #create" do
      it 'redirects to all claims page with Unauthorised in flash' 

    end

    describe "GET #edit" do
      it 'displays the edit form' 

    end

    describe "PUT #update" do
      context 'current user' do
        it 'updates non-roles attributes' 


        it 'ignores roles attributes' 


        it 'redirects to external_users index' 

      end

      context 'other user' do
        it 'does not allow any updates' 

      end

    end
    describe "DELETE #destroy" do
      it 'does not allow user to delete himself' 


      it 'does not allow user to delete other user' 

    end

    def params_updating_roles(external_user)
      HashWithIndifferentAccess.new(
        { id: external_user,
          external_user: {
            user_attributes: {
              id: external_user.user.id,
              email: 'bobsmith@example.com'
            }
          },
          roles: %w{ admin advocate litigator}
        })
    end

    def params_updating_email(external_user)
      HashWithIndifferentAccess.new(
        {id: external_user,
          external_user: {
            user_attributes: {
              id: external_user.user.id,
              email: 'bobsmith@example.com'
            }
          }
        })
    end

  end
end

