require 'rails_helper'

RSpec.describe Applications::Process::SummaryController, type: :controller do
  let(:user)          { create :user }
  let(:application) { build_stubbed(:application, office: user.office) }
  let(:income_form) { instance_double('Forms::Application::Income') }
  let(:income_calculation_runner) { instance_double(IncomeCalculationRunner, run: nil) }

  before do
    sign_in user
    allow(Application).to receive(:find).with(application.id.to_s).and_return(application)
    allow(Forms::Application::Income).to receive(:new).with(application).and_return(income_form)
    allow(IncomeCalculationRunner).to receive(:new).with(application).and_return(income_calculation_runner)
  end

  describe 'GET #summary' do
    before do
      get :index, application_id: application.id
    end

    context 'when the application does exist' do
      it 'responds with 200' 


      it 'renders the correct template' 


      it 'assigns application' 


      it 'assigns applicant' 


      it 'assigns details' 


      it 'assigns savings' 


      it 'assigns benefits' 


      it 'assigns income' 

    end
  end

  describe 'POST #summary_save' do
    let(:current_time) { Time.zone.now }
    let(:user) { create :user }
    let(:application) { create :application_full_remission, office: user.office }
    let(:resolver) { instance_double(ResolverService, complete: nil) }

    context 'success' do
      before do
        allow(ResolverService).to receive(:new).with(application, user).and_return(resolver)

        Timecop.freeze(current_time) do
          sign_in user
          post :create, application_id: application.id
        end
      end

      it 'returns the correct status code' 


      it 'redirects to the confirmation page' 


      it 'completes the application using the ResolverService' 

    end

    context 'exception' do
      let(:exception) { ActiveRecord::RecordInvalid.new(application) }

      before do
        allow(ResolverService).to receive(:new).and_raise(exception)
      end

      def post_summary_save
        Timecop.freeze(current_time) do
          sign_in user
          post :create, application_id: application.id
        end
      end

      it 'catch exception and return error' 


      it 'redirect to previous page' 


      it 'catch exception and notify sentry' 

    end

    describe 'only new aplications are processed' do
      before do
        sign_in user
        allow(ResolverService).to receive(:new)
      end

      context 'waiting_for_evidence_state' do
        let(:application) { build_stubbed(:application, :waiting_for_evidence_state, office: user.office) }

        it do
          post :create, application_id: application.id
          expect(ResolverService).not_to have_received(:new).with(application, user)
        end
      end

      context 'waiting_for_part_payment_state' do
        let(:application) { build_stubbed(:application, :waiting_for_part_payment_state, office: user.office) }

        it do
          post :create, application_id: application.id
          expect(ResolverService).not_to have_received(:new).with(application, user)
        end
      end

      context 'processed_state' do
        let(:application) { build_stubbed(:application, :waiting_for_part_payment_state, office: user.office) }

        it do
          post :create, application_id: application.id
          expect(ResolverService).not_to have_received(:new).with(application, user)
        end
      end
    end
  end

end

