# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe UserProfile::AboutMeController do

  describe 'GET edit' do

    it 'sets the title' 


    context 'without a logged in user' do

      it 'redirects to the home page' 


    end

    context 'with a logged in user' do

      let(:user) { FactoryGirl.create(:user) }

      it 'assigns the currently logged in user' 


      it 'is successful' 


      it 'renders the edit form' 


    end

  end

  describe 'PUT update' do

    it 'sets the title' 


    context 'without a logged in user' do

      it 'redirects to the sign in page' 


    end

    context 'with a banned user' do

      let(:banned_user) { FactoryGirl.create(:user, :ban_text => 'banned') }

      before :each do
        session[:user_id] = banned_user.id
      end

      it 'displays an error' 


      it 'redirects to edit' 


    end

    context 'with valid attributes' do

      let(:user) { FactoryGirl.create(:user) }

      before :each do
        session[:user_id] = user.id
      end

      it 'assigns the currently logged in user' 


      it 'updates the user about_me' 


      context 'if the user has a profile photo' do

        it 'sets a success message' 


        it 'redirects to the user page' 


      end

      context 'if the user does not have a profile photo' do

        it 'sets a message suggesting they add one' 


        it 'redirects to the set profile photo page' 


      end

    end

    context 'with invalid attributes' do

      let(:user) { FactoryGirl.create(:user, :about_me => 'My bio') }
      let(:invalid_text) { 'x' * 1000 }

      before :each do
        session[:user_id] = user.id
      end

      it 'assigns the currently logged in user' 


      it 'does not update the user about_me' 


      it 'renders the edit form' 


    end

    context 'with invalid parameters' do

      let(:user) { FactoryGirl.create(:user, :about_me => 'My bio') }

      before :each do
        session[:user_id] = user.id
      end

      it 'assigns the currently logged in user' 


      it 'does not update the user about_me' 


      it 'redirects to the user page' 


    end

    context 'with extra attributes' do

      let(:user) { FactoryGirl.create(:user) }

      before :each do
        session[:user_id] = user.id
      end

      it 'ignores non-whitelisted attributes' 


      it 'sets whitelisted attributes' 


    end

    context 'with spam attributes and a non-whitelisted user' do

      let(:user) do
        FactoryGirl.create(:user, :name => 'JWahewKjWhebCd',
                                  :confirmed_not_spam => false)
      end

      before :each do
        UserSpamScorer.spam_score_threshold = 1
        UserSpamScorer.score_mappings =
          { :about_me_includes_currency_symbol? => 20 }
        session[:user_id] = user.id
      end

      after(:each) { UserSpamScorer.reset }

      it 'sets an error message' 


      it 'redirects to the user page' 


      it 'does not update the user about_me' 


    end

    context 'with spam attributes and a whitelisted user' do

      let(:user) do
        FactoryGirl.create(:user, :name => 'JWahewKjWhebCd',
                                  :confirmed_not_spam => true)
      end

      before :each do
        UserSpamScorer.spam_score_threshold = 1
        UserSpamScorer.score_mappings =
          { :about_me_includes_currency_symbol? => 20 }
        session[:user_id] = user.id
      end

      after(:each) { UserSpamScorer.reset }

      it 'updates the user about_me' 


    end

    context 'with block_spam_about_me_text? returning true, spam content and a non-whitelisted user' do

      let(:user) { FactoryGirl.create(:user, :confirmed_not_spam => false) }

      before :each do
        UserSpamScorer.score_mappings = {}
        session[:user_id] = user.id
        allow(@controller).to receive(:block_spam_about_me_text?).and_return(true)
      end

      after(:each) { UserSpamScorer.reset }

      it 'sends an exception notification' 


      it 'sets an error message' 


      it 'redirects to the user page' 


      it 'does not update the user about_me' 


    end

    context 'with block_spam_about_me_text? returning false, spam content and a whitelisted user' do

      let(:user) do
        FactoryGirl.create(:user, :name => '12345', :confirmed_not_spam => true)
      end

      before :each do
        session[:user_id] = user.id
        allow(@controller).to receive(:block_spam_about_me_text?).and_return(false)
      end

      it 'updates the user about_me' 


    end

    context 'with block_spam_about_me_text? returning true, spam content and a whitelisted user' do

      let(:user) { FactoryGirl.create(:user, :confirmed_not_spam => true) }

      before :each do
        session[:user_id] = user.id
        allow(@controller).to receive(:block_spam_about_me_text?).and_return(true)
      end

      it 'updates the user about_me' 


    end


  end

end

