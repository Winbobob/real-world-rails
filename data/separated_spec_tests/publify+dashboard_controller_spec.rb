# frozen_string_literal: true

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

    it 'renders the index template' 


    it 'has a link to the theme' 


    it 'has a link to the sidebar' 


    it 'has a link to a new article' 


    it 'has a link to a new page' 


    it 'has a link to article listing' 


    it "has a link to user's article listing" 


    it 'has a link to drafts' 


    it 'has a link to pages' 


    it 'has a link to total comments' 


    it 'has a link to Spam' 


    it 'has a link to Spam queue' 

  end

  describe 'test publisher profile' do
    before do
      @blog ||= create(:blog)
      @rene = create(:user, :as_publisher)
      sign_in @rene
      get :index
    end

    it 'renders the index template' 


    it 'does not have a link to the theme' 


    it 'does not have a link to the sidebar' 


    it 'has a link to a new article' 


    it 'has a link to a new page' 


    it 'has a link to article listing' 


    it "has a link to user's article listing" 


    it 'has a link to total comments' 


    it 'has a link to Spam' 


    it 'has a link to Spam queue' 

  end

  describe 'test contributor profile' do
    before do
      @blog ||= create(:blog)
      @gerard = create(:user, :as_contributor)
      sign_in @gerard
      get :index
    end

    it 'renders the index template' 


    it 'does not have a link to the theme' 


    it 'does not have a link to the sidebar' 


    it 'does not have a link to a new article' 


    it 'does not have a link to a new article' 


    it 'does not have a link to article listing' 


    it "does not have a link to user's article listing" 


    it 'does not have a link to categories' 


    it 'does not have a link to total comments' 


    it 'does not have a link to Spam' 


    it 'does not have a link to Spam queue' 

  end
end

