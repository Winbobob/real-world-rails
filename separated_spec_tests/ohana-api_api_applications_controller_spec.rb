require 'rails_helper'

describe ApiApplicationsController do
  before :each do
    @user = FactoryBot.create(:user)
    sign_in @user
  end
  # This should return the minimal set of attributes required to create a valid
  # ApiApplication. As you add validations to ApiApplication, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    { name: 'test app',
      main_url: 'http://codeforamerica.org',
      callback_url: 'https://github.com/codeforamerica' }
  end

  let(:invalid_attributes) do
    { name: '',
      main_url: 'localhost:8080',
      callback_url: 'localhost:8080' }
  end

  describe 'GET index' do
    it 'assigns all api_applications as @api_applications' 

  end

  describe 'GET new' do
    it 'assigns a new api_application as @api_application' 

  end

  describe 'GET edit' do
    it 'assigns the requested api_application as @api_application' 

  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new ApiApplication' 


      it 'assigns a newly created api_application as @api_application' 


      it 'redirects to the created api_application' 


      it 'generates an access token' 

    end

    describe 'with invalid params' do
      it 'assigns a new but unsaved api_application as @api_application' 


      it "re-renders the 'new' template" 

    end
  end

  describe 'PUT update' do
    describe 'with valid params' do
      it 'updates the requested api_application' 


      it 'assigns the requested api_application as @api_application' 


      it 'redirects to the api_application' 

    end

    describe 'with invalid params' do
      it 'assigns the api_application as @api_application' 


      it "re-renders the 'edit' template" 

    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested api_application' 


    it 'redirects to the api_applications list' 

  end
end

