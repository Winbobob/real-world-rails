require 'rails_helper'

RSpec.describe Applications::Process::DetailsController, type: :controller do
  let(:user)          { create :user }
  let(:application) { build_stubbed(:application, office: user.office, detail: detail) }
  let(:detail) { build_stubbed(:detail) }

  let(:application_details_form) { instance_double('Forms::Application::Detail') }

  before do
    sign_in user
    allow(Application).to receive(:find).with(application.id.to_s).and_return(application)
    allow(Forms::Application::Detail).to receive(:new).with(application.detail).and_return(application_details_form)
  end

  describe 'GET #application_details' do
    before do
      get :index, application_id: application.id
    end

    context 'when the application does exist' do
      it 'responds with 200' 


      it 'renders the correct template' 


      it 'assigns the correct form' 


      it 'assigns user\'s jurisdictions' 

    end
  end

  describe 'POST #create' do
    let(:success) { true }
    let(:app_form) do
      instance_double('ApplicationFormRepository',
        success?: success,
        redirect_url: application_summary_path(application),
        process: application_details_form)
    end
    let(:expected_params) { { discretion_applied: 'false' } }

    before do
      allow(ApplicationFormRepository).to receive(:new).with(application, expected_params).and_return app_form

      post :create, application_id: application.id, application: expected_params
    end

    context 'when the ApplicationFormSave is success' do
      it 'redirects to given url' 

    end

    context 'when the form can not be saved' do
      let(:success) { false }

      it 'renders the correct template' 


      it 'assigns the correct form' 


      it 'assigns user\'s jurisdictions' 

    end
  end
end

