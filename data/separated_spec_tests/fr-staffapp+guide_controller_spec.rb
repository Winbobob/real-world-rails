require 'rails_helper'

RSpec.describe GuideController, type: :controller do
  describe 'as a signed out user' do

    before { get :index }

    it 'returns a direct status' 


    it 'redirects to login page' 

  end

  describe 'as a signed in user' do

    before do
      sign_in create :user
      get :index
    end

    describe 'GET #index' do
      it 'returns http success' 


      it 'renders the correct view' 

    end
  end
end

