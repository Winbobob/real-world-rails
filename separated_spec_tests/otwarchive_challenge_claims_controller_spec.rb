# frozen_string_literal: true
require 'spec_helper'

RSpec.describe ChallengeClaimsController, type: :controller do
  include LoginMacros
  include RedirectExpectationHelper
  let(:user) { create(:user) }
  let(:signup) { create(:challenge_signup) }
  let(:collection) { signup.collection }
  let(:claim) { create(:challenge_claim, collection: collection) }

  describe 'index' do
    it 'assigns claims and gives a notice if the collection is closed and the user is not the maintainer' 


    it 'will not allow you to see someone elses claims' 

  end

  describe 'show' do
    it 'redirects logged in user to the prompt' 


    xit 'needs a collection' do
      fake_login_known_user(user)
      get :show
      it_redirects_to_with_error(root_path, \
                                 "What challenge did you want to work with?")
    end
  end

  describe 'create' do
    it 'sets a notice and redirects' 


    it 'on an exception gives an error and redirects' 

  end

  describe 'destory' do
    context 'with a claim' do
      it 'on an exception gives an error and redirects' 

    end
  end
end

