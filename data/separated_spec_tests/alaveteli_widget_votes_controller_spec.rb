# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe WidgetVotesController do

  include LinkToHelper

  describe 'POST #create' do
    let(:info_request){ FactoryGirl.create(:info_request) }

    before do
      allow(AlaveteliConfiguration).to receive(:enable_widgets).and_return(true)
    end

    it 'should find the info request' 


    it 'should redirect to the track path for the info request' 


    context 'for a non-logged-in user without a tracking cookie' do

      it 'sets a tracking cookie' 


      it 'creates a widget vote' 


    end

    context 'for a non-logged-in user with a tracking cookie' do

      it 'retains the existing tracking cookie' 


      it 'creates a widget vote' 


    end

    context 'when widgets are not enabled' do

      it 'raises ActiveRecord::RecordNotFound' 


    end

    context "when the request's prominence is not 'normal'" do

      it 'should return a 403' 


    end

    context 'when the request is embargoed' do

      it 'should raise an ActiveRecord::RecordNotFound error' 

    end
  end

end

def mock_cookie
  '0300fd3e1177127cebff'
end

