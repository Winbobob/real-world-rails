require 'rails_helper'

RSpec.describe CaseWorkers::Admin::CaseWorkersController, type: :controller do
  let(:admin) { create(:case_worker, :admin) }

  subject { create(:case_worker) }

  before { sign_in admin.user }


  describe 'GET #index' do
    before { get :index }

    it 'returns http success' 


    it 'assigns @case_workers' 


    it 'renders the template' 


    context 'search' do
      before { get :index, params: { search: subject.user.last_name } }

      it 'finds the case workers with specified search criteria' 

    end
  end

  describe "GET #show" do

    before { get :show, params: { id: subject } }

    it "returns http success" 


    it 'assigns @case_worker' 


    it 'renders the template' 


    render_views

  end

  describe "GET #new" do
    before { get :new }

    it "returns http success" 


    it 'assigns @case_worker' 


    it 'renders the template' 


    render_views

  end

  describe "GET #edit" do

    before { get :edit, params: { id: subject } }

    it "returns http success" 


    it 'assigns @case_worker' 


    it 'renders the template' 

  end

  describe "GET #change_password" do

    before { get :change_password, params: { id: subject } }

    it "returns http success" 


    it 'assigns @advocate' 


    it 'renders the template' 

  end

  describe "POST #create" do
    context 'when valid' do
      let(:case_worker_params) {
        {
          case_worker: {
            user_attributes: {
              email: 'foo@foobar.com',
              password: 'password',
              password_confirmation: 'password',
              first_name: 'John',
              last_name: 'Smith'
            },
            roles: ['case_worker'],
            location_id: create(:location).id
          }
        }
      }

      it 'creates a case_worker' 


      it 'redirects to case workers index' 


      it 'attempts to deliver an email' 


      describe 'if there is an issue with delivering the email' do
        let(:mailer) { double DeviseMailer }

        before do
          allow(DeviseMailer).to receive(:reset_password_instructions).and_raise(NoMethodError)
        end

        it 'raises an error' 

      end
    end

    context 'when invalid' do
      it 'does not create a case worker' 


      it 'renders the new template' 

    end
  end

  describe "PUT #update" do

    context 'when valid' do
      before(:each) { put :update, params: { id: subject, case_worker: { roles: ['admin'] } } }

      it 'updates a case_worker' 


      it 'redirects to case workers index' 

    end

    context 'when invalid' do
      before(:each) { put :update, params: { id: subject, case_worker: { roles: ['foo'] } } }

      it 'does not update case worker' 


      it 'renders the edit template' 

    end

    context 'allocating claims' do
      let(:claims) { create_list(:submitted_claim, 3) }

      it 'allocates claims to case worker' 

    end
  end

  describe "PUT #update_password" do

    before do
      subject.user.update(password: 'password', password_confirmation: 'password')
      sign_in subject.user #need to sign in again after password change
    end

    context 'when valid' do
      before(:each) do
        put :update_password, params: { id: subject, case_worker: { user_attributes: { current_password: 'password', password: 'password123', password_confirmation: 'password123' } } }
      end

      it 'redirects to case_worker show action' 

    end

    context 'when mandatory params for case worker are not provided' do
      it 'raises a paramenter missing error' 

    end

    context 'when invalid' do
      it 'renders the change password template' 

    end
  end

  describe "DELETE #destroy" do
    after do
      expect(response).to redirect_to(case_workers_admin_case_workers_url)
    end

    context 'case worker without sent messages' do

      it 'destroys the case worker' 


      it 'redirects to case worker admin root url with notice message' 

    end
  end
end

