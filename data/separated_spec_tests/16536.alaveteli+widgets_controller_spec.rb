# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe WidgetsController do

  include LinkToHelper

  describe 'GET show' do

    before do
      @info_request = FactoryBot.create(:info_request)
      allow(AlaveteliConfiguration).to receive(:enable_widgets).and_return(true)
    end

    it 'should render the widget template' 


    it 'should find the info request' 


    it 'should create a track thing for the request' 


    it 'should assign the request status' 


    it 'assigns the count of follows the request has' 


    it 'sets user_owns_request to true if the user owns the request' 


    it 'sets user_owns_request to false if the user does not own the request' 


    it 'should not send an x-frame-options header' 


    context 'for a non-logged-in user with a tracking cookie' do

      it 'will not find existing tracks' 


      it 'finds existing votes' 


      it 'will not find any existing votes if none exist' 


    end

    context 'for a non-logged-in user without a tracking cookie' do

      it 'will not find existing tracks' 


      it 'will not find any existing votes' 


    end

    context 'for a logged in user with tracks' do

      it 'finds the existing track thing' 


    end

    context 'for a logged in user without tracks' do

      it 'does not find existing track things' 


      it 'looks for an existing vote' 


      it 'will not find any existing votes if none exist' 


    end

    context 'when widgets are not enabled' do

      it 'raises ActiveRecord::RecordNotFound' 


    end

    context "when the request's prominence is not 'normal'" do

      it 'should return a 403' 


      it 'does not look for an existing vote' 


    end

  end

  describe 'GET new' do

    before do
      @info_request = FactoryBot.create(:info_request)
      allow(AlaveteliConfiguration).to receive(:enable_widgets).and_return(true)
    end

    it 'should render the create widget template' 


    it 'should find the info request' 


    context 'when widgets are not enabled' do

      it 'raises ActiveRecord::RecordNotFound' 


    end

    context "when the request's prominence is not 'normal'" do

      it 'should return a 403' 


    end

  end

end

def mock_cookie
  '0300fd3e1177127cebff'
end

