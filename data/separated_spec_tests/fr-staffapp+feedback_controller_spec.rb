require 'rails_helper'

RSpec.describe FeedbackController, type: :controller do
  let(:office) { create(:office) }
  let(:user)          { create :user, office: office }
  let(:admin)         { create :admin_user, office: office }

  context 'as a signed out user' do
    describe 'GET #new' do
      before { get :new }
      it 'returns http redirect' 


      it 'redirects to the sign in page' 

    end

    describe 'GET #index' do
      before { get :index }
      it 'returns http redirect' 


      it 'redirects to the sign in page' 

    end
  end

  context 'as a signed in user' do
    before { sign_in user }

    describe 'GET #index' do
      it 'raises Pundit error' 

    end

    describe 'GET #new' do
      before { get :new }
      it 'returns http success' 


      it 'renders the correct template' 

    end

    describe 'POST #create' do
      let(:feedback_attributes) { attributes_for(:feedback, user: user, office: office) }

      it 'returns http success' 


      it 'creates a new feedback entry' 

    end
  end

  context 'as a signed in admin' do
    before { sign_in admin }
    let(:feedback) { build(:feedback, ideas: 'None') }

    describe 'GET #index' do
      before { get :index }
      it 'returns http success' 


      it 'renders the correct template' 


      context 'when there is feedback from a deleted user' do
        let(:user) { create :deleted_user, office: create(:office) }
        before { create(:feedback, ideas: 'None', user: user, office: user.office) }

        it 'renders the correct template' 

      end
    end

    describe 'GET #new' do
      it 'raises Pundit error' 


    end

    describe 'POST #create' do
      let(:feedback_attributes) { attributes_for(:feedback, user: admin, office: office) }

      it 'raises Pundit error' 


    end
  end
end

