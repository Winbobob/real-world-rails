require 'spec_helper'

describe Reports::MyWorkController do
  render_views

  let(:user) { FactoryGirl.create(:user) }
  let(:year) { 2013 }
  let(:month) { 3 }

  context 'for non-signed in users' do
    it 'redirects to login' 

  end

  context 'for signed-in users' do

    before do
      test_sign_in user
    end

    describe 'GET "year"' do
      it 'assigns the correct instance variables' 


      it 'renders the :table template' 

    end

    describe 'GET "month"' do
      it 'assigns the correct instance variables' 


      it 'generates the correct buckets' 


      it 'renders the :table template' 

    end

  end

end

