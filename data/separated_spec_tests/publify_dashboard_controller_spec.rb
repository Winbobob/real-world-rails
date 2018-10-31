require 'rails_helper'

describe Admin::DashboardController, type: :controller do
  render_views

  before do
    stub_request(:get, 'http://www.google.com/search?output=rss&q=link:test.host&tbm=blg').
      to_return(status: 200, body: '', headers: {})
  end

  describe 'test admin profile' do
    before do
      @blog ||= create(:blog)
      @henri = create(:user, :as_admin)
      sign_in @henri
      get :index
    end

    it 'should render the index template' 


    it 'should have a link to the theme' 


    it 'should have a link to the sidebar' 


    it 'should have a link to a new article' 


    it 'should have a link to a new page' 


    it 'should have a link to article listing' 


    it "should have a link to user's article listing" 


    it 'should have a link to drafts' 


    it 'should have a link to pages' 


    it 'should have a link to total comments' 


    it 'should have a link to Spam' 


    it 'should have a link to Spam queue' 

  end

  describe 'test publisher profile' do
    before do
      @blog ||= create(:blog)
      @rene = FactoryGirl.create(:user, :as_publisher)
      sign_in @rene
      get :index
    end

    it 'should render the index template' 


    it 'should not have a link to the theme' 


    it 'should not have a link to the sidebar' 


    it 'should have a link to a new article' 


    it 'should have a link to a new page' 


    it 'should have a link to article listing' 


    it "should have a link to user's article listing" 


    it 'should have a link to total comments' 


    it 'should have a link to Spam' 


    it 'should have a link to Spam queue' 

  end

  describe 'test contributor profile' do
    before do
      @blog ||= create(:blog)
      @gerard = create(:user, :as_contributor)
      sign_in @gerard
      get :index
    end

    it 'should render the index template' 


    it 'should not have a link to the theme' 


    it 'should not have a link to the sidebar' 


    it 'should not have a link to a new article' 


    it 'should not have a link to a new article' 


    it 'should not have a link to article listing' 


    it "should not have a link to user's article listing" 


    it 'should not have a link to categories' 


    it 'should not have a link to total comments' 


    it 'should not have a link to Spam' 


    it 'should not have a link to Spam queue' 

  end
end

