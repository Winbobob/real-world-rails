require 'rails_helper'

RSpec.describe EvidenceController, type: :controller do
  let(:office) { create(:office) }
  let(:user) { create :user, office: office }
  let(:applicant) { create :applicant_with_all_details }
  let(:application) { create :application, office: office, applicant: applicant }
  let(:evidence) { create :evidence_check, application_id: application.id }
  let(:evidence_check_flagging_service) { double }

  before do
    allow(EvidenceCheck).to receive(:find).with(evidence.id.to_s).and_return(evidence)
    allow(EvidenceCheckFlaggingService).to receive(:new).with(evidence).and_return(evidence_check_flagging_service)
    allow(evidence_check_flagging_service).to receive(:can_be_flagged?).and_return(true)
    allow(evidence_check_flagging_service).to receive(:process_flag)
  end

  describe 'GET #show' do
    context 'as a signed out user' do
      before { get :show, id: evidence.id }

      it { expect(response).to have_http_status(:redirect) }

      it { expect(response).to redirect_to(user_session_path) }
    end

    context 'as a signed in user' do
      before do
        sign_in user
        get :show, id: evidence.id
      end

      it 'returns the correct status code' 


      it 'renders the correct template' 


      it 'assigns the details model' 

    end
  end

  describe 'GET #accuracy' do
    context 'as a signed out user' do
      before { get :accuracy, id: evidence.id }

      it { expect(response).to have_http_status(:redirect) }

      it { expect(response).to redirect_to(user_session_path) }
    end

    context 'as a signed in user' do
      before do
        allow(Forms::Evidence::Accuracy).to receive(:new).with(evidence).and_return(form)
        sign_in user
        get :accuracy, id: evidence.id
      end

      let(:form) { double }
      let(:expected_form_params) do
        {
          correct: evidence.correct,
          incorrect_reason: evidence.incorrect_reason
        }
      end

      it 'returns the correct status code' 


      it 'renders the correct template' 


      it 'assigns the evidence form' 

    end
  end

  describe 'POST #accuracy_save' do
    let(:expected_form_params) { { correct: true, incorrect_reason: 'reason' } }

    context 'as a signed out user' do
      before { post :accuracy_save, id: evidence.id, evidence: expected_form_params }

      it { expect(response).to have_http_status(:redirect) }

      it { expect(response).to redirect_to(user_session_path) }
    end

    context 'as a signed in user' do
      let(:form) { double }

      before do
        allow(Forms::Evidence::Accuracy).to receive(:new).with(evidence).and_return(form)
        allow(form).to receive(:update_attributes).with(expected_form_params)
        allow(form).to receive(:save).and_return(form_save)

        sign_in user
        post :accuracy_save, id: evidence.id, evidence: expected_form_params
      end

      context 'when the form can be saved' do
        let(:form_save) { true }

        context 'when the form evidence is correct' do
          let(:form) { instance_double(Forms::Evidence::Accuracy, correct: true) }

          it 'redirects to the income page' 

        end
        context 'when the form evidence is not correct' do
          let(:form) { instance_double(Forms::Evidence::Accuracy, correct: false) }

          it 'redirects to the income page' 

        end
      end

      context 'when the form can not be saved' do
        let(:form_save) { false }

        it 'assigns the form' 


        it 'renders the accuracy template again' 

      end
    end
  end

  describe 'GET #income' do
    context 'as a signed out user' do
      before { get :income, id: evidence.id }

      it { expect(response).to have_http_status(:redirect) }

      it { expect(response).to redirect_to(user_session_path) }
    end

    context 'as a signed in user' do
      let(:form) { double }

      before do
        allow(Forms::Evidence::Income).to receive(:new).with(evidence).and_return(form)
        sign_in user
        get :income, id: evidence.id
      end

      it 'returns the correct status code' 


      it 'renders the correct template' 


      it 'assigns the income form' 

    end
  end

  describe 'POST #income_save' do
    let(:expected_form_params) { { income: '1000' } }

    context 'as a signed out user' do
      before { post :income_save, id: evidence.id, evidence: expected_form_params }

      it { expect(response).to have_http_status(:redirect) }

      it { expect(response).to redirect_to(user_session_path) }
    end

    context 'as a signed in user' do
      let(:form) { double }

      before do
        allow(Forms::Evidence::Income).to receive(:new).with(evidence).and_return(form)
        allow(form).to receive(:update_attributes).with(expected_form_params)
        allow(form).to receive(:save).and_return(form_save)
        sign_in user
        post :income_save, id: evidence.id, evidence: expected_form_params
      end

      context 'when the form is filled in correctly' do
        let(:form_save) { true }
        it 'returns redirects to the result page' 


        it 'returns the correct status code' 

      end

      context 'when the form is filled incorrectly' do
        let(:form_save) { false }

        it 're-renders the view' 

      end
    end
  end

  describe 'GET #result' do
    context 'as a signed out user' do
      before { get :result, id: evidence }

      it { expect(response).to have_http_status(:redirect) }

      it { expect(response).to redirect_to(user_session_path) }
    end

    context 'as a signed in user' do
      before do
        sign_in user
        get :result, id: evidence
      end

      it 'returns the correct status code' 


      it 'renders the correct template' 

    end
  end

  describe 'GET #summary' do
    context 'as a signed out user' do
      before { get :summary, id: evidence }

      it { expect(response).to have_http_status(:redirect) }

      it { expect(response).to redirect_to(user_session_path) }
    end

    context 'as a signed in user' do
      before do
        sign_in user
        get :summary, id: evidence
      end

      it 'returns the correct status code' 


      it 'renders the correct template' 

    end
  end

  describe 'POST #summary_save' do
    let(:resolver) { instance_double(ResolverService, complete: nil) }

    context 'as a signed out user' do
      before { post :summary_save, id: evidence }

      it { expect(response).to have_http_status(:redirect) }

      it { expect(response).to redirect_to(user_session_path) }
    end

    context 'as a signed in user' do
      before do
        allow(ResolverService).to receive(:new).with(evidence, user).and_return(resolver)
        sign_in user
        post :summary_save, id: evidence
      end

      it 'redirects to the correct page' 


      it 'returns the correct status code' 


      it { expect(evidence_check_flagging_service).to have_received(:process_flag) }
    end
  end

  describe 'GET #confirmation' do
    context 'as a signed out user' do
      before { post :summary_save, id: evidence }

      it { expect(response).to have_http_status(:redirect) }

      it { expect(response).to redirect_to(user_session_path) }
    end

    context 'as a signed in user' do
      before do
        sign_in user
        get :confirmation, id: evidence
      end

      it 'returns the correct status code' 


      it 'renders the correct template' 


      it 'assigns the evidence check as confirmation' 

    end
  end

  describe 'GET #return_letter' do
    context 'as a signed out user' do
      before { get :return_letter, id: evidence }

      it { expect(response).to have_http_status(:redirect) }

      it { expect(response).to redirect_to(user_session_path) }
    end

    context 'as a signed in user' do
      before do
        sign_in user
        get :return_letter, id: evidence
      end

      it { expect(response).to have_http_status(200) }

      it { expect(response).to render_template('return_letter') }
    end
  end

  describe 'POST #return_application' do
    context 'as a signed out user' do
      before { post :return_application, id: evidence }

      it { expect(response).to have_http_status(:redirect) }

      it { expect(response).to redirect_to(user_session_path) }
    end

    context 'as a signed in user' do
      before do
        sign_in user
        post :return_application, id: evidence
      end

      it 'returns the correct status code' 


      it 'calls the evidence_check_flag' 

    end
  end
end

