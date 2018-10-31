# -*- encoding : utf-8 -*-
require 'spec_helper'
require File.expand_path(File.dirname(__FILE__) + '/alaveteli_dsl')

describe "Signing in" do
  let(:user){ FactoryBot.create(:user) }

  def try_login(user, options = {})
    default_options = { :email => user.email,
                        :password => 'jonespassword' }
    options = default_options.merge(options)
    login_url = 'en/profile/sign_in'
    login_url += "?r=#{options[:redirect]}" if options[:redirect]
    visit login_url
    within '#signin_form' do
      fill_in "Your e-mail:", :with => options[:email]
      fill_in "Password:", :with => options[:password]
      click_button "Sign in"
    end
  end

  it "shows you an error if you get the password wrong" 


  it "shows you an error if you get the email wrong" 


  context 'when you give the right credentials' do

    it 'logs you in' 


    it "it redirects to the redirect path" 


    it 'does not redirect to another domain' 


    context 'if an account is not confirmed' do
      let(:user) { FactoryBot.create(:user, :email_confirmed => false) }

      it "sends a confirmation email_token, logs you in and redirects you" 


      context 'if an admin clicks the confirmation link' do
        let(:admin_user) { FactoryBot.create(:admin_user) }

        it "should keep you logged in if you click a confirmation link" 

      end
    end
  end
end

