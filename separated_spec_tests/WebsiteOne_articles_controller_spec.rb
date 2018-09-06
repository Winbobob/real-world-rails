require 'spec_helper'

describe ArticlesController do

  let (:valid_params) { { article: { 'title' => 'title',
                                     'content' => 'Content',
                                     'tag_list' => 'Ruby on Rails' } } }

  describe 'GET index' do
    before(:each) do
      @articles = (1..7).collect { double('Article', tag_list: 'Javascript' ) }
      @ruby_rails_articles = @articles[0..3]
      @ruby_rails_articles.each { |a| a.stub(:tag_list).and_return('Ruby, Rails') }
    end

    it 'should render the index template for all possible paths' 


    it 'should assign all articles to @articles' 


    it 'should be able to filter by tags' 

  end

  describe 'GET show' do
    before(:each) do
      @author = double('User')
      @article = double('Article', friendly_id: 'friend', user: @author)
      Article.stub_chain("friendly.find").and_return(@article)
    end

    it 'should render the show template' 


    it 'should search the database using the friendly id' 


    it 'should assign the requested article to @article' 


    it 'should assign the requested article author to @author' 

  end

  describe 'GET new' do
    before(:each) { controller.stub(:authenticate_user!).and_return(true) }

    it 'should require authentication' 


    it 'should render the new template' 


    it 'should assign a new article to @article' 


    it 'should be initialize the article with default tags if present' 

  end

  describe 'GET edit' do
    before(:each) do
      controller.stub(:authenticate_user!).and_return(true)
      @article = double('Article', friendly_id: 'friend')
      Article.stub_chain('friendly.find').and_return(@article)
    end

    it 'should require authentication' 


    it 'should search for the article using friendly ids' 


    it 'should assign the article to be edited to @article' 

  end

  describe 'POST create' do
    before(:each) do
      controller.stub(:authenticate_user!).and_return(true)
      @article = build(:article, title: 'my title', slug: 'friend')
      @user = double('User', id: 1)
      allow(controller).to receive(:current_user).and_return(@user)
      allow(@article).to receive(:create_activity)
      @user.stub_chain('articles.build').and_return(@article)
    end

    it 'should require authentication' 


    it 'should create the article through the current user' 


    it 'should be successful for requests with valid params' 


    it 'should receive :create_activity with :create' 


    it 'should render the new template with error messages if unsuccessful' 

  end

  describe 'POST update' do
    before(:each) do
      controller.stub(:authenticate_user!).and_return(true)
      @article = double('Article', title: 'my title', friendly_id: 'friend')
      @article.stub(:update_attributes).and_return(true)
      Article.stub_chain('friendly.find').and_return(@article)
      allow(@article).to receive(:create_activity)
    end

    let (:valid_update_params) { valid_params.merge(id: @article.friendly_id) }

    it 'should require authentication' 


    it 'should receive :create_activity with :update' 


    it 'should redirect the user back to the show page with a flash message on success' 


    it 'should render the edit template with error messages on failure' 

  end

  describe 'POST/PATCH preview' do
    before(:each) do
      @params = { article: { title: 'Patch title', content: 'Some content', tag_list: 'Ruby'}}
      controller.stub(:authenticate_user!).and_return(true)
    end

    it 'should require authentication' 


    it 'should render the preview template' 


    it 'should assign a new article with the given parameters' 


    it 'should assign default parameters to the preview article' 

  end
end

