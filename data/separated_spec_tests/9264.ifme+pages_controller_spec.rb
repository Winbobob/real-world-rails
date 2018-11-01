# frozen_string_literal: true

describe PagesController, type: :controller do
  describe 'GET #home' do
    it 'respond to request' 


    context 'logged in' do
      let(:user) { create(:user) }
      include_context :logged_in_user

      it 'if has no stories' 


      it 'if have stories' 

    end

    context 'not logged in' do
      it 'has blurbs and posts' 

    end
  end

  describe 'GET #contribute' do
    it 'respond to request' 


    it 'read external JSON file' 

  end

  describe 'GET #partners' do
    it 'respond to request' 


    it 'read external JSON file' 

  end

  describe 'GET #about' do
    it 'respond to request' 

  end

  describe 'GET #faq' do
    it 'respond to request' 

  end

  describe 'GET #privacy' do
    it 'respond to request' 

  end

  describe 'POST #toggle_locale' do
    context 'When user is signed in' do
      let(:user) { build(:user) }
      include_context :logged_in_user

      it 'has a 200 status when the locale changes' 


      it 'has a 400 status when the locale is the same' 

    end

    context 'When not signed in' do
      it 'has a 200 status' 

    end
  end

  describe 'GET #resources' do
    it 'respond to request' 

  end
end

