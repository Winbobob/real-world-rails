require 'spec_helper'

describe AccountSettingsController do
  render_views

  let(:user) { create(:user) }
  before { sign_in(user) }

  describe '#index' do
    before { get :index }

    it 'responds successfully with an HTTP 200 status code' 

  end

  describe '#generate' do
    subject { get :generate }

    it 'responds successfully with an HTTP 200 status code' 


    it 'changes api_token for current user' 

  end
end

