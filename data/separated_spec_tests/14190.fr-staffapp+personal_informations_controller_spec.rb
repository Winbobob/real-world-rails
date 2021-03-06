require 'rails_helper'

RSpec.describe Applications::Process::PersonalInformationsController, type: :controller do
  let(:user)          { create :user }
  let(:application) { build_stubbed(:application, office: user.office, detail: detail) }
  let(:detail) { build_stubbed(:detail) }

  let(:personal_information_form) { instance_double('Forms::Application::Applicant') }

  before do
    sign_in user
    allow(Application).to receive(:find).with(application.id.to_s).and_return(application)
    allow(Forms::Application::Applicant).to receive(:new).with(application.applicant).and_return(personal_information_form)
  end

  describe 'GET #personal_information' do
    before do
      get :index, application_id: application.id
    end

    context 'when the application does exist' do
      it 'responds with 200' 


      it 'renders the correct template' 


      it 'assigns the correct form' 

    end
  end

  describe 'PUT #personal_information_save' do
    let(:expected_params) { { last_name: 'Name', date_of_birth: '20/01/2980', married: false } }

    before do
      allow(personal_information_form).to receive(:update_attributes).with(expected_params)
      allow(personal_information_form).to receive(:save).and_return(form_save)

      post :create, application_id: application.id, application: expected_params
    end

    context 'when the form can be saved' do
      let(:form_save) { true }

      it 'redirects to application_details' 

    end

    context 'when the form can not be saved' do
      let(:form_save) { false }

      it 'renders the correct template' 


      it 'assigns the correct form' 

    end
  end

  context 'after an application is processed' do
    let!(:application) { create :application, :processed_state, office: user.office }

    describe 'when accessing the personal_details view' do
      before { get :index, application_id: application.id }

      subject { response }

      it { is_expected.to have_http_status(:redirect) }

      it { is_expected.to redirect_to(processed_application_path(application)) }

      it 'is expected to set the flash message' 

    end
  end

  context 'after an application is deleted' do
    let!(:application) { create :application, :deleted_state, office: user.office }

    describe 'when accessing the personal_details view' do
      before { get :index, application_id: application.id }

      subject { response }

      it { is_expected.to have_http_status(:redirect) }

      it { is_expected.to redirect_to(deleted_application_path(application)) }

      it 'is expected to set the flash message' 

    end
  end

  context 'when an application is awaiting evidence' do
    let!(:application) { create :application, :waiting_for_evidence_state, office: user.office }
    let!(:evidence) { create :evidence_check, application: application }

    describe 'when accessing the personal_details view' do
      before { get :index, application_id: application.id }

      subject { response }

      it { is_expected.to have_http_status(:redirect) }

      it { is_expected.to redirect_to(evidence_path(evidence)) }

      it 'is expected to set the flash message' 

    end
  end

  context 'when an application is part_payment' do
    let(:application) { create :application, :waiting_for_part_payment_state, office: user.office }
    let!(:part_payment) { create(:part_payment, application: application) }

    describe 'when accessing the personal_details view' do
      before { get :index, application_id: application.id }

      subject { response }

      it { is_expected.to have_http_status(:redirect) }

      it { is_expected.to redirect_to(part_payment_path(part_payment)) }

      it 'is expected to set the flash message' 

    end
  end
end

