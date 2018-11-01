require File.dirname(__FILE__) + '/../spec_helper'

describe PagesController do
  describe 'handling GET for a single post' do
    before(:each) do
      @page = mock_model(Page)
      allow(Page).to receive(:find_by_slug).and_return(@page)
    end

    def do_get
      get :show, :id => 'a-page'
    end

    it "should be successful" 


    it "should render show template" 


    it 'should find the page requested' 


    it 'should assign the page found for the view' 

  end

  describe 'handling GET with invalid page' do
    it 'raises a RecordNotFound error' 

  end
end

