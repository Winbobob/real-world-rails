require 'spec_helper'

describe Users::TermsController do
  let(:user) { create(:user) }
  let(:term) { create(:term) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'redirects when no terms exist' 


    it 'shows terms when they exist' 

  end

  describe 'POST #accept' do
    it 'saves that the user accepted the terms' 


    it 'redirects to a path when specified' 


    it 'redirects to the referer when no redirect specified' 


    context 'redirecting to another domain' do
      it 'is prevented when passing a redirect param' 


      it 'is prevented when redirecting to the referer' 

    end
  end

  describe 'POST #decline' do
    it 'stores that the user declined the terms' 


    it 'signs out the user' 

  end
end

