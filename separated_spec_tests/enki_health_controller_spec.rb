require File.dirname(__FILE__) + '/../../spec_helper'

describe Admin::HealthController do
  describe 'handling GET to index' do
    before(:each) do
      session[:logged_in] = true
      get :index
    end

    it "is successful" 


    it "renders health template" 

  end

  describe 'handling POST to generate_exception' do
    describe 'when logged in' do
      it 'raises a RuntimeError' 

    end

    describe 'when not logged in' do
      it 'does not raise' 

    end
  end

  describe 'handling GET to generate_exception' do
    it '405s' 

  end
end

