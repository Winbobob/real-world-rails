require 'rails_helper'

RSpec.describe Applications::Process::SavingsInvestmentsController, type: :controller do
  let(:user)          { create :user }
  let(:application) { build_stubbed(:application, office: user.office) }

  let(:savings_investments_form) { instance_double('Forms::Application::SavingsInvestment') }
  let(:personal_information_form) { instance_double('Forms::Application::Applicant') }
  let(:savings_pass_fail_service) { instance_double('SavingsPassFailService') }

  before do
    sign_in user
    allow(Application).to receive(:find).with(application.id.to_s).and_return(application)
    allow(Forms::Application::SavingsInvestment).to receive(:new).with(application.saving).and_return(savings_investments_form)
    allow(SavingsPassFailService).to receive(:new).with(application.saving).and_return(savings_pass_fail_service)
  end

  describe 'GET #savings_investments' do
    before do
      get :index, application_id: application.id
    end

    context 'when the application does exist' do
      it 'responds with 200' 


      it 'renders the correct template' 


      it 'assigns the correct form' 


      it 'assigns the application' 

    end
  end

  describe 'PUT #savings_investments_save' do
    let(:expected_params) { { min_threshold_exceeded: false } }

    before do
      allow(savings_investments_form).to receive(:update_attributes).with(expected_params)
      allow(savings_investments_form).to receive(:save).and_return(form_save)
      allow(savings_pass_fail_service).to receive(:calculate!).and_return(form_save)
      post :create, application_id: application.id, application: expected_params
    end

    context 'when the form can be saved' do
      let(:form_save) { true }

      it 'redirects to benefits' 

    end

    context 'when the form can not be saved' do
      let(:form_save) { false }

      it 'renders the correct template' 


      it 'assigns the correct form' 


      it 'assigns the application' 

    end
  end
end

