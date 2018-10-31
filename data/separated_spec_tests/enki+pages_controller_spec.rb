require File.dirname(__FILE__) + '/../../spec_helper'
require File.dirname(__FILE__) + '/../../factories'

describe Admin::PagesController do
  describe 'handling GET to index' do
    before(:each) do
      FactoryGirl.create_list(:page, 2)
      session[:logged_in] = true
      get :index
    end

    it "is successful" 


    it "renders index template" 


    it "finds pages for the view" 

  end

  describe 'handling GET to show' do
    before(:each) do
      @page = mock_model(Page)
      allow(Page).to receive(:find).and_return(@page)
      session[:logged_in] = true
      get :show, :id => 1
    end

    it "is successful" 


    it "renders show template" 


    it "finds page for the view" 

  end

  describe 'handling GET to new' do
    before(:each) do
      @page = mock_model(Page)
      allow(Page).to receive(:new).and_return(@page)
      session[:logged_in] = true
      get :new
    end

    it('is successful') { expect(response).to be_success}
    it('assigns page for the view') { assigns[:page] == @page }
  end

  describe 'handling PUT to update with valid attributes' do
    before(:each) do
      @page = mock_model(Page, :title => 'A page')
      allow(@page).to receive(:update_attributes).and_return(true)
      allow(Page).to receive(:find).and_return(@page)
    end

    def do_put
      session[:logged_in] = true
      put :update, :id => 1, :page => {
        'title' => 'My Post',
        'slug'  => 'my-post',
        'body'  => 'This is my post'
      }
    end

    it 'updates the page' 


    it 'it redirects to show' 

  end

  describe 'handling PUT to update with invalid attributes' do
    before(:each) do
      @page = mock_model(Page)
      allow(@page).to receive(:update_attributes).and_return(false)
      allow(Page).to receive(:find).and_return(@page)
    end

    def do_put
      session[:logged_in] = true
      put :update, :id => 1, :page => {
        'title' => nil,
        'slug'  => 'my-page',
        'body'  => 'This is my page'
      }
    end

    it 'renders show' 


    it 'is unprocessable' 

  end
end

describe Admin::PagesController, 'with an AJAX request to preview' do
  before(:each) do
    expect(Page).to receive(:build_for_preview).and_return(@page = mock_model(Page))
    session[:logged_in] = true
    xhr :post, :preview, :page => {
      :title        => 'My Page',
      :body         => 'body'
    }
  end

  it "assigns a new page for the view" 

end

