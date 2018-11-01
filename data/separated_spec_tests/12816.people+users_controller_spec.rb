require 'spec_helper'

describe UsersController do
  render_views

  describe '#index' do
    before do
      sign_in create(:user, first_name: 'Marian')
      create(:user, first_name: 'Tomek')
      create(:user, first_name: 'Ziuta', archived: true)
    end

    it 'responds successfully with an HTTP 200 status code' 


    it 'exposes users index view object' 


    it 'displays users on view' 

  end

  describe '#show' do
    let(:user) { create(:user, first_name: 'Dean', last_name: 'Winchester') }
    before do
      sign_in user
      get :show, id: user
    end

    it 'responds successfully with an HTTP 200 status code' 


    it 'displays user name on view' 

  end
end

