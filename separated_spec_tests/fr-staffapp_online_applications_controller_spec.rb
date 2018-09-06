require 'rails_helper'

RSpec.describe OnlineApplicationsController, type: :controller do
  let(:user) { create :user }
  let(:online_application) { build_stubbed(:online_application) }
  let(:jurisdiction) { build_stubbed(:jurisdiction) }
  let(:form) { double }

  before do
    allow(OnlineApplication).to receive(:find).with(online_application.id.to_s).and_return(online_application)
    allow(OnlineApplication).to receive(:find).with('non-existent').and_raise(ActiveRecord::RecordNotFound)
    allow(Forms::OnlineApplication).to receive(:new).with(online_application).and_return(form)
    sign_in user
  end

  describe 'GET #edit' do
    let(:params) { { jurisdiction_id: user.jurisdiction_id } }
    before do
      allow(form).to receive(:enable_default_jurisdiction).with(user)
      allow(form).to receive(:jurisdiction_id).and_return(user.jurisdiction_id)
      get :edit, id: id
    end

    context 'when no online application is found with the id' do
      let(:id) { 'non-existent' }

      it 'redirects to the homepage' 

    end

    context 'when an online application is found with the id' do
      let(:id) { online_application.id }

      it 'renders the edit template' 


      it 'assigns the edit form' 


      it 'assigns the online_application' 


      it 'assigns the user\'s office jurisdictions' 


      it 'sets the jurisdiction of the new object' 


      context 'when the user does not have a default jurisdiction' do
        let(:user) { create :user, jurisdiction_id: nil }

        it 'sets the jurisdiction of the new object' 

      end
    end
  end

  describe 'PUT #update' do
    let(:params) { {} }
    let(:form_save) { false }

    before do
      allow(form).to receive(:update_attributes).with(params)
      allow(form).to receive(:save).and_return(form_save)

      put :update, id: id, online_application: params
    end

    context 'when no online application is found with the id' do
      let(:id) { 'non-existent' }

      it 'redirects to the homepage' 

    end

    context 'when an online application is found with the id' do
      let(:params) { { fee: '100', jurisdiction_id: jurisdiction.id.to_s } }
      let(:id) { online_application.id }

      context 'when the form can be saved' do
        let(:form_save) { true }

        it 'redirects to the summary page' 

      end

      context 'when the form can not be saved' do
        it 'renders the edit template' 


        it 'assigns the form' 


        it 'assigns the online_application' 


        it 'assigns the user\'s office jurisdictions' 

      end
    end
  end

  describe 'GET #show' do
    let(:overview) { double }

    before do
      allow(Views::Overview::Applicant).to receive(:new).with(online_application).and_return(overview)
      allow(Views::Overview::Application).to receive(:new).with(online_application).and_return(overview)
      allow(Views::Overview::Details).to receive(:new).with(online_application).and_return(overview)

      get :show, id: id
    end

    context 'when no online application is found with the id' do
      let(:id) { 'non-existent' }

      it 'redirects to the homepage' 

    end

    context 'when an online application is found with the id' do
      let(:id) { online_application.id }

      it 'renders the show template' 


      describe 'assigns the view models' do
        it { expect(assigns(:applicant)).to eql(overview) }
        it { expect(assigns(:application_view)).to eql(overview) }
        it { expect(assigns(:details)).to eql(overview) }
      end
    end
  end

  describe 'POST #complete' do
    let(:application) { build_stubbed(:application) }
    let(:application_builder) { instance_double(ApplicationBuilder, build_from: application) }
    let(:application_calculation) { instance_double(ApplicationCalculation, run: nil) }
    let(:resolver_service) { instance_double(ResolverService, complete: nil) }
    let(:pass_fail_service) { instance_double(SavingsPassFailService, calculate!: nil) }

    before do
      allow(ApplicationBuilder).to receive(:new).with(user).and_return(application_builder)
      allow(application).to receive(:save)
      allow(ApplicationCalculation).to receive(:new).with(application).and_return(application_calculation)
      allow(ResolverService).to receive(:new).with(application, user).and_return(resolver_service)
      allow(SavingsPassFailService).to receive(:new).with(application.saving).and_return(pass_fail_service)

      post :complete, id: id
    end

    context 'when no online application is found with the id' do
      let(:id) { 'non-existent' }

      it 'redirects to the homepage' 

    end

    context 'when an online application is found with the id' do
      let(:id) { online_application.id }

      it 'builds the application' 


      it 'runs the benefit / income calculation' 


      it 'runs the resolver service' 


      it 'runs the pass fail service' 


      it 'redirects to the application confirmation page' 

    end
  end

  context 'after an application is completed' do
    let(:online_application) { create :online_application, :completed, :with_reference, convert_to_application: true }

    describe 'when accessing the personal_details view' do
      before { get :edit, id: online_application.id }

      subject { response }

      it { is_expected.to have_http_status(:redirect) }

      it { is_expected.to redirect_to(application_confirmation_path(online_application.linked_application)) }

      it 'is expected to set the flash message' 

    end
  end
end

