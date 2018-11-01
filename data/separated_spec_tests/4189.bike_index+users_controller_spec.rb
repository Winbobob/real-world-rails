require 'spec_helper'

describe UsersController do
  describe 'new' do
    context 'already signed in' do
      it 'redirects and sets the flash' 

    end
    context 'not signed in' do
      it 'renders and calls set store_return_to' 

    end
  end

  describe 'create' do
    context 'legacy' do
      describe 'success' do
        it 'creates a non-confirmed record' 

        it 'creates a confirmed user, log in, and send welcome if user has org invite' 

      end

      describe 'failure' do
        let(:user_attributes) do
          user = FactoryGirl.attributes_for(:user)
          user[:password_confirmation] = 'bazoo'
          user
        end
        it 'does not create a user or send a welcome email' 

        it 'renders new' 

      end
    end

    describe 'confirm' do
      describe 'user exists' do
        it 'tells the user to log in when already confirmed' 


        describe 'user not yet confirmed' do
          before :each do
            @user = FactoryGirl.create(:user)
            expect(User).to receive(:find).and_return(@user)
          end

          it 'logins and redirect when confirmation succeeds' 


          it 'shows a view when confirmation fails' 

        end
      end

      it 'shows an appropriate message when the user is nil' 

    end
    context 'revised' do
      let(:user_attrs) do
        {
          name: 'foo',
          email: 'foo1@bar.com',
          password: 'coolpasswprd$$$$$',
          terms_of_service: '0',
          is_emailable: '0'
        }
      end

      context 'create attrs' do
        it 'renders' 

      end
    end
  end

  describe 'password_reset' do
    describe 'if the token is present and valid' do
      it 'logs in and redirects' 

    end

    it 'renders get request' 


    it 'does not log in if the token is present and valid' 


    context 'confirmed user' do
      it 'enqueues a password reset email job' 

    end

    context 'confirmed user secondary email' do
      it 'enqueues a password reset email job' 

    end

    context 'unconfirmed user' do
      it 'enqueues a password reset email job' 

    end
  end

  describe 'show' do
    it "404s if the user doesn't exist" 


    it "redirects to user home url if the user exists but doesn't want to show their page" 


    it 'shows the page if the user exists and wants to show their page' 

  end

  describe 'accept_vendor_terms' do
    it 'renders' 

  end

  describe 'accept_terms' do
    it 'renders' 

  end

  describe 'edit' do
    include_context :logged_in_as_user 
    context 'no page given' do
      it 'renders root' 

    end
    context 'application_revised layout' do
      %w(root password sharing).each do |template|
        context template do
          it 'renders the template' 

        end
      end
    end
  end

  describe 'update' do
    context 'nil username' do
      it "doesn't update username" 

    end

    it "doesn't update user if current password not present" 


    it "doesn't update user if password doesn't match" 


    it 'Updates user if there is a reset_pass token' 


    it "Doesn't updates user if reset_pass token doesn't match" 


    it "Doesn't update user if reset_pass token is more than an hour old" 


    it 'resets users auth if password changed, updates current session' 


    it 'updates the terms of service' 


    it 'updates the vendor terms of service and emailable' 


    it 'enqueues job (it enqueues job whenever update is successful)' 

  end
  describe 'unsubscribe' do
    context 'subscribed user' do
      let(:user) { FactoryGirl.create(:user, is_emailable: true) }
      it 'updates is_emailable' 

    end
    context 'user not present' do
      it 'does not error, shows same flash success (to prevent email enumeration)' 

    end
    context 'user already unsubscribed' do
      let(:user) { FactoryGirl.create(:confirmed_user, is_emailable: false) }
      it 'does nothing' 

    end
  end
end

