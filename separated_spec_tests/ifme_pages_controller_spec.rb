RSpec.describe PagesController, type: :controller do
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

  describe 'GET #blog' do
    it 'respond to request' 


    it 'has posts' 

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

  describe 'GET #toggle_locale' do
    context 'When user is signed in' do
      let(:user) { create(:user) }
      include_context :logged_in_user

      it 'returns signed_in_reload object' 


      it 'returns signed_in_no_reload object' 

    end

    context 'When not signed in' do
      it 'returns signed_out object' 

    end
  end

  describe 'GET #resources' do
    it 'respond to request' 


    it 'read external JSON file' 

  end
end

