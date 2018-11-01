# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Users::ConfirmationsController do

  describe 'GET confirm' do

    context 'if the post redirect cannot be found' do

      it 'renders bad_token' 


    end

    context 'the post redirect circumstance is change_password' do

      before :each do
        @user = FactoryBot.create(:user, :email_confirmed => false)
        @post_redirect = PostRedirect.new(
          :user => @user,
          :circumstance => 'change_password'
        )
        @post_redirect[:uri] = edit_password_change_path(@post_redirect.token)
        @post_redirect.save

        get :confirm, { :email_token => @post_redirect.email_token }
      end

      it 'does not log the user in' 


      it 'logs out a user who does not own the post redirect' 


      it 'does not log out a user if they own the post redirect' 


      it 'does not confirm an unconfirmed user' 


      it 'redirects to the post redirect uri' 


    end

    context 'if the currently logged in user is an admin' do

      before :each do
        @admin = FactoryBot.create(:admin_user)
        @user = FactoryBot.create(:user, :email_confirmed => false)
        @post_redirect = PostRedirect.create(:uri => '/', :user => @user)

        session[:user_id] = @admin.id
        get :confirm, { :email_token => @post_redirect.email_token }
      end

      it 'does not confirm the post redirect user' 


      it 'stays logged in as the admin user' 


      it 'sets the user_circumstance to normal' 


      it 'redirects to the post redirect uri' 


    end

    context <<-EOF do
      if the currently logged in user is not an admin and owns the post
       redirect
    EOF

      before :each do
        @user = FactoryBot.create(:user, :email_confirmed => false)
        @post_redirect = PostRedirect.create(:uri => '/', :user => @user)

        session[:user_id] = @user.id
        get :confirm, { :email_token => @post_redirect.email_token }
      end

      it 'confirms the post redirect user' 


      it 'stays logged in as the user' 


      it 'sets the user_circumstance to normal' 


      it 'redirects to the post redirect uri' 


    end

    context <<-EOF do
      if the currently logged in user is not an admin and does not own the post
       redirect
    EOF
      before :each do
        @current_user = FactoryBot.create(:user)
        @user = FactoryBot.create(:user, :email_confirmed => false)
        @post_redirect = PostRedirect.create(:uri => '/', :user => @user)

        session[:user_id] = @current_user.id
        get :confirm, { :email_token => @post_redirect.email_token }
      end

      it 'confirms the post redirect user' 


      # FIXME: There's no reason this should be allowed
      it 'gets logged in as the post redirect user' 


      it 'sets the user_circumstance to normal' 


      it 'redirects to the post redirect uri' 


    end

    context 'if there is no logged in user' do

      before :each do
        @user = FactoryBot.create(:user, :email_confirmed => false)
        @post_redirect = PostRedirect.create(:uri => '/', :user => @user)

        get :confirm, { :email_token => @post_redirect.email_token }
      end

      it 'confirms the post redirect user' 


      it 'gets logged in as the post redirect user' 


      it 'sets the user_circumstance to normal' 


      it 'redirects to the post redirect uri' 


    end
  end
end

