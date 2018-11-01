require 'rails_helper'

describe DonationsController, type: :controller do
  describe 'GET #index' do
    it 'redirects to donations/new' 

  end

  describe 'GET #history as public' do
    it 'redirects to sign_in' 

  end

  describe 'GET #history as admin' do
    include_context 'signed in admin'
    let!(:donation) { create(:donation)}

    it 'is successful' 


    it 'returns excel list of donations' 

  end

  describe 'GET #new' do
    it 'is successful' 

  end
end

