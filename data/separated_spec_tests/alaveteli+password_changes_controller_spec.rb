# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PasswordChangesController do

  describe 'GET new' do

    it 'assigns the pretoken if supplied' 


    it 'assigns nil to the pretoken if not supplied' 


    it 'assigns nil to the pretoken if blank' 


    it 'does not pre-fill the email field without a signed in user' 


    it 'pre-fills the email field for a signed in user' 


    it 'disables the email field for a signed in user' 


    it 'renders the template' 


  end

  describe 'POST create' do

    context 'when a user is signed in' do

      it 'ignores an email submitted in the post params' 


      it 'does not require an email to be submitted' 

    end

    context 'when no user is signed in and no email is submitted' do

      it 're-renders the form' 


    end

    context 'when receiving an email address of an existing user' do

      it 'assigns the user' 


      it 'finds the user if the email case is different' 


      it 'creates a post redirect' 


      context 'when a pretoken is supplied' do

        it 'adds the pretoken to the post redirect uri' 


        it 'does not add a blank pretoken to the post redirect uri' 


      end

      it 'sends a confirmation email' 


      it 'does not send a confirmation email for an unknown email' 


      it 'renders the confirmation message' 


      it 'renders the confirmation message for an unknown email' 


      it 'warns the user of an invalid email format' 


      it 're-renders the form with an invalid email format' 


    end

  end

  describe 'GET edit' do

    let(:user) { FactoryBot.create(:user) }
    let(:post_redirect) do
      PostRedirect.create(:user => user, :uri => frontpage_url)
    end

    it 'assigns the pretoken if supplied' 


    it 'assigns nil to the pretoken if not supplied' 


    it 'assigns nil to the pretoken if blank' 


    it 'assigns the user' 


    context 'no user is specified' do

      let(:post_redirect) { PostRedirect.new(user: nil) }

      it 'redirects to new for the user to enter their email' 


      it 'redirects to new with a pretoken for the user to enter their email' 


    end

    context 'invalid token' do

      it 'redirects to new to force an email confirmation' 


    end

  end

  describe 'PUT update' do

    let(:user) { FactoryBot.create(:user) }
    let(:post_redirect) do
      PostRedirect.create(:user => user, :uri => frontpage_path)
    end

    before(:each) do
      @valid_password_params =
        { :password => 'secret123456',
          :password_confirmation => 'secret123456' }
      @invalid_password_params =
        { :password => 'secret',
          :password_confirmation => 'password' }
    end

    it 'changes the password on success' 


    it 'notifies the user the password change has been successful' 


    it 'assigns the user from a post redirect' 


    it 'logs in the user on success' 


    it 'retains the old password on failure' 


    it 're-renders the form on failure' 


    context 'no user is specified' do

      let(:post_redirect) { PostRedirect.new(:user => nil) }

      it 'redirects to #new when a user cannot be found' 


    end

    context 'invalid token' do

      it 'redirects to new to force an email confirmation' 


    end

    context 'when a pretoken is supplied' do

      it 'redirects to the post redirect uri' 


      it 'does not redirect to another domain' 


      it 'redirects to the user profile with a blank pretoken' 


    end

    context 'when there is no pretoken' do

      it 'redirects to the user profile on success' 


    end

    context 'when the user has two factor authentication enabled' do

      let(:user) { FactoryBot.create(:user, :enable_otp) }

      before(:each) do
        allow(AlaveteliConfiguration).
          to receive(:enable_two_factor_auth).and_return(true)
      end

      it 'changes the password with a correct otp_code' 


      it 'redirects to the two factor page to show the new OTP' 


      it 'redirects to the two factor page even if there is a pretoken redirect' 


      it 'reminds the user that they have a new OTP' 


      it 'does not change the password with an incorrect otp_code' 


      it 'does not change the password without an otp_code' 


    end

  end

end

