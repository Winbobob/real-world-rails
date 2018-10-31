require 'rails_helper'

RSpec.describe Webui::SessionController do
  let(:user) { create(:confirmed_user, login: 'tom') }

  shared_examples 'login' do
    before do
      request.env['HTTP_REFERER'] = search_url # Needed for the redirect_to(root_url)
    end

    it 'logs in users with correct credentials' 


    it 'tells users about wrong credentials' 


    it 'tells users about wrong state' 


    it 'assigns the current user' 

  end

  describe 'POST #create' do
    context 'without referrer' do
      before do
        post :create, params: { username: user.login, password: 'buildservice' }
      end

      it 'redirects to root path' 

    end

    context 'with deprecated password' do
      let(:user) { create(:user_deprecated_password, state: :confirmed) }

      it_behaves_like 'login'
    end

    context 'with bcrypt password' do
      it_behaves_like 'login'
    end
  end
end

