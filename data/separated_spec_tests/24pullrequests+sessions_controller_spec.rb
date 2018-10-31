require 'rails_helper'

describe SessionsController, type: :controller do
  describe 'GET new' do
    before do
      get :new
    end

    it { is_expected.to redirect_to('/auth/github') }
  end

  describe 'POST create' do
    before do
      create :user, uid: 'uid', nickname: 'jane-doe', location: 'georgia'
    end

    it "updates the user's particulars" 

  end

  describe 'GET destroy' do
    before do
      session[:user_id] = 1
      get :destroy
    end

    it { is_expected.to_not set_session[:user_id] }
    it { is_expected.to redirect_to(root_path) }
  end

  describe 'GET failure' do
    origin_url = 'http://24pullrequests.com'

    before do
      get :failure, params: { origin: origin_url }
    end

    it { is_expected.to redirect_to(origin_url) }
  end
end

def session_spec_user_hash
  { 'provider'    => 'github',
    'uid'         => 'uid',
    'info'        => {
      'nickname' => 'jane-doe'
    },
    'extra' => {
      'raw_info' => {
        'location' => 'london'
      }
    },
    'credentials' => { 'token' => 'some-token' } }
end

