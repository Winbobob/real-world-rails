require 'rails_helper'

RSpec.describe BusinessEntitiesController, type: :controller do
  let!(:office) { create :office }
  let(:admin) { create :admin, office: office }

  describe 'GET #index' do
    subject { response }
    before do
      sign_in admin
      get :index, office_id: office.id
    end

    it { is_expected.to have_http_status(:success) }

    it { is_expected.to render_template(:index) }

    it 'assigns the @jurisdictions variable' 

  end

  describe 'GET #new' do
    subject { response }

    let(:business_entity) { office.business_entities.first }
    let(:jurisdiction) { create :jurisdiction }

    before { sign_in admin }

    describe 'when an unused jurisdiction parameter is provided' do
      before { get :new, office_id: office.id, jurisdiction_id: jurisdiction.id }

      it { is_expected.to have_http_status(:success) }

      it { is_expected.to render_template(:new) }

      it 'assigns the @business_entity variable' 

    end

    describe 'when an used jurisdiction parameter is provided' do
      before { get :new, office_id: office.id, jurisdiction_id: business_entity.jurisdiction.id }

      it { is_expected.to have_http_status(:redirect) }

      it { is_expected.to redirect_to(office_business_entities_path) }

    end

    describe 'when a jursidiction parameter is not provided' do
      before { get :new, office_id: office.id }

      it { is_expected.to have_http_status(:redirect) }

      it { is_expected.to redirect_to(office_business_entities_path) }
    end
  end

  describe 'POST #create' do
    subject { response }

    let(:jurisdiction) { create :jurisdiction }
    let(:params) { { office_id: office.id, jurisdiction_id: jurisdiction.id, business_entity: { name: 'test - jurisdiction', be_code: 'code', sop_code: code } } }

    before do
      sign_in admin
      post :create, params
    end

    describe 'with the correct parameters' do
      let(:code) { '321654' }

      it { is_expected.to have_http_status(:redirect) }

      it { is_expected.to redirect_to(office_business_entities_path) }
    end

    describe 'with the incorrect parameters' do
      let(:code) { '' }

      it { is_expected.to have_http_status(:success) }

      it { is_expected.to render_template(:new) }
    end
  end

  describe 'GET #edit' do
    subject { response }

    let(:business_entity) { office.business_entities.first }

    before do
      sign_in admin
      get :edit, office_id: office.id, id: business_entity.id
    end

    it { is_expected.to have_http_status(:success) }

    it { is_expected.to render_template(:edit) }

    it 'assigns the @business_entity variable' 

  end

  describe 'PUT #update' do
    subject { response }

    let(:business_entity) { office.business_entities.first }
    let(:params) { { name: 'Digital - Family', be_code: 'code', sop_code: code } }

    before do
      sign_in admin
      put :update, office_id: office.id, id: business_entity.id, business_entity: params
    end

    describe 'with the correct parameters' do
      let(:code) { '321654' }

      it { is_expected.to have_http_status(:redirect) }

      it { is_expected.to redirect_to(office_business_entities_path) }
    end

    describe 'with the incorrect parameters' do
      let(:code) { '' }

      it { is_expected.to have_http_status(:success) }

      it { is_expected.to render_template(:edit) }
    end
  end

  describe 'GET #deactivate' do
    subject { response }

    let(:business_entity) { office.business_entities.first }

    before do
      sign_in admin
      get :deactivate, office_id: office.id, id: business_entity.id
    end

    it { is_expected.to have_http_status(:success) }

    it { is_expected.to render_template(:deactivate) }

    it 'assigns the @business_entity variable' 

  end

  describe 'POST #confirm_deactivate' do
    subject { response }

    let(:business_entity) { office.business_entities.first }

    before do
      sign_in admin
      post :confirm_deactivate, office_id: office.id, id: business_entity.id
    end

    it { is_expected.to have_http_status(:redirect) }

    it { is_expected.to redirect_to(office_business_entities_path) }
  end
end

