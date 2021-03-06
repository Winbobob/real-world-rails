require 'rails_helper'

RSpec.describe Applications::Process::BenefitsController, type: :controller do
  let(:user)          { create :user }
  let(:application) { build_stubbed(:application, office: user.office) }
  let(:benefit_form) { instance_double('Forms::Application::Benefit') }
  let(:dwp_monitor) { instance_double('DwpMonitor') }
  let(:dwp_state) { 'online' }

  before do
    sign_in user
    allow(Application).to receive(:find).with(application.id.to_s).and_return(application)
    allow(Forms::Application::Benefit).to receive(:new).with(application).and_return(benefit_form)
    allow(dwp_monitor).to receive(:state).and_return(dwp_state)
    allow(DwpMonitor).to receive(:new).and_return(dwp_monitor)
  end

  describe 'GET #benefits' do
    let(:saving) { double }

    before do
      allow(application).to receive(:saving).and_return(saving)
      allow(saving).to receive(:passed?).and_return(savings_valid)

      get :index, application_id: application.id
    end

    context 'when application failed savings and investments' do
      let(:savings_valid) { false }

      it 'redirects to the summary' 

    end

    context 'when savings and investments passed' do
      let(:savings_valid) { true }

      it 'returns 200 response' 


      it 'renders the correct template' 


      it 'assigns the benefits form' 


      describe '@status' do
        subject { assigns(:state) }

        context 'when the dwp is up' do
          it { is_expected.to eql(dwp_state) }
        end

        context 'when the dwp is down' do
          let(:dwp_state) { 'offline' }

          it { is_expected.to eql(dwp_state) }
        end
      end
    end
  end

  describe 'PUT #benefits_save' do
    let(:expected_params) { { benefits: false } }
    let(:benefit_form) { instance_double(Forms::Application::Benefit, benefits: user_says_on_benefits) }
    let(:user_says_on_benefits) { false }
    let(:can_override) { false }
    let(:benefit_check_runner) { instance_double(BenefitCheckRunner, run: nil, can_override?: can_override) }

    before do
      allow(benefit_form).to receive(:update_attributes).with(expected_params)
      allow(benefit_form).to receive(:save).and_return(form_save)
      allow(BenefitCheckRunner).to receive(:new).with(application).and_return(benefit_check_runner)

      post :create, application_id: application.id, application: expected_params
    end

    context 'when the form can be saved' do
      let(:form_save) { true }

      context 'when the applicant says they are on benefits' do
        let(:user_says_on_benefits) { true }

        it 'runs the benefit check on the application' 


        context 'when the result can be overridden' do
          let(:can_override) { true }

          it 'redirects to the benefits override page' 

        end

        context 'when the result can not be overridden' do
          it 'redirects to the summary override page' 

        end
      end

      context 'when the applicant says they are not on benefits' do
        let(:user_says_on_benefits) { false }

        it 'does not run benefit check on the application' 


        it 'redirects to the income page' 


        context "it's refund" do
          let(:detail) { build_stubbed(:detail, refund: true) }

          it "still goes to income page" 

        end
      end
    end

    context 'when the form can\'t be saved' do
      let(:form_save) { false }

      it 'renders the correct template' 


      it 'assigns the benefits form' 

    end
  end
end

