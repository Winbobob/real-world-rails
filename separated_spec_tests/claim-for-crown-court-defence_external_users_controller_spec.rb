require 'rails_helper'
require 'json'

RSpec.describe SuperAdmins::ExternalUsersController, type: :controller do
  let(:super_admin)   { create(:super_admin) }
  let(:provider)      { create(:provider) }
  let(:frozen_time)  { 6.months.ago }
  let(:external_user)   do
    Timecop.freeze(frozen_time) { create(:external_user, :admin, provider: provider) }
  end

  before { sign_in super_admin.user }

  describe "GET #show" do
    before { get :show, params: { provider_id: provider, id: external_user } }

    it "returns http success" 


    it 'assigns @provider and @external_user' 

  end

  describe "GET #index" do
    before { get :index, params: { provider_id: provider } }

    it "returns http success" 


    it 'assigns @provider' 


    it 'assigns @external_users' 

  end

  describe 'GET #find' do
    before { get :find }

    it 'returns http success' 

  end

  describe 'POST #search' do
    subject { response }

    before { post :search, params: { external_user: { email: email } } }

    context 'when the email is for a provider' do
      let(:email) { external_user.email }

      it { is_expected.to redirect_to(super_admins_provider_external_user_path(external_user.provider, external_user)) }
    end

    context 'when the email is for a non-provider' do
      let(:email) { super_admin.email }

      it { is_expected.to redirect_to(super_admins_external_users_find_path) }
    end

    context 'when the email does not exist' do
      let(:email) { 'vail.email@does.not.exist.com' }

      it { is_expected.to redirect_to(super_admins_external_users_find_path) }
    end
  end

  describe "GET #new" do
    let(:external_user) do
     a = ExternalUser.new(provider: provider)
     a.build_user
     a
    end

    before { get :new, params: { provider_id: provider } }

    it "returns http success" 


    # NOTE: use json comparison because we are not interested in
    #       whether the object is the same just that it creates a
    #       new one and builds its user
    it 'assigns @provider and @external_user' 


    it 'builds user for @external_user' 


    it 'renders the new template' 


  end

  describe "POST #create" do

    def post_to_create_external_user_action(options={})
      post :create, params: {
        provider_id: provider,
        external_user: {
          user_attributes: {
            email: 'foo@foobar.com',
            email_confirmation: 'foo@foobar.com',
            first_name: options[:valid]==false ? '' : 'john',
            last_name: 'Smith'
          },
          roles: ['advocate'],
          supplier_number: 'AB124'
        }
      }
    end

    context 'when valid' do
      it 'creates an external_user' 


      it 'redirects to external_users show view' 

    end

    context 'when invalid' do
      it 'does not create an external_user' 


      it 'renders the new template' 

    end
  end

  describe "GET #edit" do
    before { get :edit, params: { provider_id: provider, id: external_user } }

    it "returns http success" 


   it 'assigns @provider and @external_user' 
    it 'renders the template' 

  end

  describe "PUT #update" do

    context 'when valid' do
      before(:each) { put :update, params: { provider_id: provider, id: external_user, external_user: { supplier_number: 'XX100', roles: ['advocate'] } } }

      it 'updates an external_user' 


      it 'redirects to external_users index' 

    end

    context 'when invalid' do
      before(:each) { put :update, params: { provider_id: provider, id: external_user, external_user: { roles: ['foo'] } } }

      it 'does not update external_user' 


      it 'renders the edit template' 

    end
  end

  describe "GET #change_password" do
    before { get :change_password, params: { provider_id: provider, id: external_user } }

    it "returns http success" 


    it 'assigns @provider and @external_user' 


    it 'renders the change password template' 

  end

  describe "PUT #update_password" do

    context 'when valid' do

      before(:each) do
        put :update_password, params: { provider_id: provider, id: external_user, external_user: { user_attributes: { password: 'password123', password_confirmation: 'password123' } } }
        external_user.reload
      end

      it 'does not require current password to be successful in updating the user record ' 


      it 'redirects to external_user show action' 

    end

    context 'when invalid' do

      before(:each) do
        put :update_password, params: { provider_id: provider, id: external_user, external_user: { user_attributes: { password: 'password123', password_confirmation: 'passwordxxx' } } }
      end

      it 'does not update the user record' 


      it 'renders the change password template' 

    end

  end

end

