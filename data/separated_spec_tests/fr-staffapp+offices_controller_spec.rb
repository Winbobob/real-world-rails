require 'rails_helper'

RSpec.describe OfficesController, type: :controller do
  let(:office)      { create(:office, jurisdictions: []) }
  let(:user)        { create :user, office: office }

  let(:jurisdiction) { create :jurisdiction }
  let(:valid_params) { attributes_for(:office).merge(jurisdiction_ids: [jurisdiction.id]) }

  before do
    bypass_rescue
    sign_in(user)
  end

  def mock_authorize(record, authorized)
    expectation = receive(:authorize).with(record)
    expectation.and_raise(Pundit::NotAuthorizedError) unless authorized

    expect(controller).to expectation
    allow(controller).to receive(:verify_authorized) if authorized
  end

  shared_examples 'when not authorized' do
    context 'when not authorized' do
      let(:authorized) { false }

      it 'raises Pundit error' 

    end
  end

  describe 'GET #index' do
    subject(:make_request) { get :index }

    before do
      mock_authorize(:office, authorized)
    end

    context 'when authorized' do
      let(:authorized) { true }

      before { make_request }

      it 'renders the correct template' 


      it 'assigns all offices' 

    end

    include_examples 'when not authorized'
  end

  describe 'GET #show' do
    subject(:make_request) { get :show, id: office.id }

    before do
      mock_authorize(office, authorized)
    end

    context 'when authorized' do
      let(:authorized) { true }

      before { make_request }

      it 'renders the correct template' 


      it 'assigns the office' 

    end

    include_examples 'when not authorized'
  end

  describe 'GET #new' do
    subject(:make_request) { get :new }

    before do
      mock_authorize(Office, authorized)
    end

    context 'when authorized' do
      let(:authorized) { true }

      before { make_request }

      it 'renders the correct template' 


      it 'assigns a new office' 

    end

    include_examples 'when not authorized'
  end

  describe 'GET #edit' do
    subject(:make_request) { get :edit, id: office.id }

    let(:assigned_jurisdiction) { create :jurisdiction }

    before do
      create :business_entity, office: office, jurisdiction: assigned_jurisdiction
      mock_authorize(office, authorized)
    end

    context 'when authorized' do
      let(:authorized) { true }

      before { make_request }

      it 'renders the correct template' 


      it 'assigns the office' 


      it 'assigns only available jurisdictions' 

    end

    include_examples 'when not authorized'
  end

  describe 'POST #create' do
    subject(:make_request) { post :create, office: params }

    let(:new_office) { build_stubbed(:office) }
    let(:params) { valid_params }

    before do
      allow(Office).to receive(:new).and_return(new_office)
      mock_authorize(new_office, authorized)
    end

    context 'when authorized' do
      let(:authorized) { true }

      before do
        allow(new_office).to receive(:errors).and_return(saved ? [] : [double, double])
        allow(new_office).to receive(:save).and_return(saved)
        make_request
      end

      context 'when the office can be saved' do
        let(:saved) { true }

        it 'sets a flash notice' 


        it 'redirects to the office show page' 

      end

      context 'when the office can not be saved' do
        let(:saved) { false }

        it 'does not redirect' 


        it 'renders the new template' 


        it 'assigns the office' 

      end
    end

    include_examples 'when not authorized'
  end

  describe 'PUT #update' do
    subject(:make_request) { put :update, id: existing_office.id, office: params }

    let(:existing_office) { office }
    let(:params) { valid_params }

    before do
      allow(Office).to receive(:find).with(existing_office.to_param.to_s).and_return(existing_office)
      mock_authorize(existing_office, authorized)
    end

    context 'when authorized' do
      let(:authorized) { true }
      let(:manager_setup) { instance_double(ManagerSetup, setup_profile?: false, in_progress?: false) }

      before do
        allow(ManagerSetup).to receive(:new).and_return(manager_setup)
        allow(ManagerSetup).to receive(:new).and_return(manager_setup)
        allow(existing_office).to receive(:errors).and_return(saved ? [] : [double, double])
        allow(existing_office).to receive(:save).and_return(saved)
        make_request
      end

      context 'when the office can be saved' do
        let(:saved) { true }

        it 'sets a flash notice' 


        context 'when the user is a manager setting up a new office' do
          context 'when the manager needs to setup their profile' do
            let(:manager_setup) { instance_double(ManagerSetup, setup_profile?: true, in_progress?: true) }

            it 'redirects to the user edit profile page' 

          end
          context 'when the manager does not need to setup their profile' do
            let(:manager_setup) { instance_double(ManagerSetup, setup_profile?: false, in_progress?: true) }
            it 'redirects to the home page' 

          end
        end

        context 'when the user is not a manager setting up a new office' do
          it 'redirects to the office show page' 

        end
      end

      context 'when the office can not be saved' do
        let(:saved) { false }

        it 'renders the new template' 


        it 'assigns the office' 

      end
    end

    include_examples 'when not authorized'
  end
end

