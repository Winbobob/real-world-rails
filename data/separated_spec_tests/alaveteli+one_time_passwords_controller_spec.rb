# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe OneTimePasswordsController do

  before :each do
    allow(AlaveteliConfiguration).
      to receive(:enable_two_factor_auth).and_return(true)
  end

  describe 'GET show' do

    it 'redirects to the sign-in page without a signed in user' 


    it 'assigns the signed in user' 


    it 'renders the show template' 


    context 'when 2factor auth is not enabled' do

      it 'raises ActiveRecord::RecordNotFound' 


    end

  end

  describe 'POST #create' do

    it 'redirects to the sign-in page without a signed in user' 


    it 'assigns the signed in user' 


    it 'enables OTP for the user' 


    it 'does not disable OTP for the user' 


    it 'sets a successful notification message' 


    it 'redirects back to #show on success' 


    it 'renders #show on failure' 


    it 'sets a failure notification message' 


    context 'when 2factor auth is not enabled' do

      it 'raises ActiveRecord::RecordNotFound' 


    end

  end

  describe 'PUT #update' do

    it 'redirects to the sign-in page without a signed in user' 


    it 'assigns the signed in user' 


    it 'regenerates the otp_code' 


    it 'sets a successful notification message' 


    it 'redirects back to #show on success' 


    it 'renders #show on failure' 


    it 'warns the user on failure' 


    context 'when 2factor auth is not enabled' do

      it 'raises ActiveRecord::RecordNotFound' 


    end

  end

  describe 'DELETE #destroy' do

    it 'redirects to the sign-in page without a signed in user' 


    it 'assigns the signed in user' 


    it 'disables OTP for the user' 


    it 'sets a successful notification message' 


    it 'redirects back to #show on success' 


    it 'sets a failure notification message' 


    it 'renders #show on failure' 


    context 'when two factor auth is not enabled' do

      it 'raises ActiveRecord::RecordNotFound' 


    end

  end

end

