require File.dirname(__FILE__) + '/../../spec_helper'

describe Admins::TranslatedNewsItemsController do

  before(:all) do
    unless @admin = User.find_by_username('admins_controller_specs')
      load_foundation_cache
      @admin = User.gen(:username => 'admins_controllers_specs', :password => "password", :admin => true)
    end
    @non_admin = User.find_by_admin(false)
    @news_item = NewsItem.gen(:page_name => "test_translated_news_item", :active => true, :user => @admin)
  end

  describe 'GET new' do
    before :all do
      @new_translated_news_item_params = { :news_item_id => @news_item.id }
    end
    it 'should only allow access to EOL administrators' 

    it 'should instantiate page_title, page_subheader and languages' 

    it 'should instantiate translated news item' 

  end

  describe 'POST create' do
    before :all do
      @new_translated_news_item_params = { :news_item_id => @news_item.id,
        :translated_news_item => { :title => "Test Translated News", :body => "Test Translated News Item Body",
                                   :language_id => Language.english.id, :active_translation => true } }
    end
    before(:each) do
      TranslatedNewsItem.delete_all(:news_item_id => @news_item.id)
    end
    it 'should only allow access to EOL administrators' 

    it 'should create a translated news item' 

  end

  describe 'GET edit' do
    before :all do
      TranslatedNewsItem.delete_all(:news_item_id => @news_item.id)
      @translated_news_item_to_edit = TranslatedNewsItem.gen(:news_item_id => @news_item.id,
                                                             :title => "Test Translated News",
                                                             :language => Language.english,
                                                             :body => "Test Translated News Item Body",
                                                             :active_translation => true)
      @edit_translated_news_item_params = { :news_item_id => @news_item.id, :id => @translated_news_item_to_edit.id }
    end
    it 'should only allow access to EOL administrators' 

    it 'should instantiate page_title, page_subheader and page_name' 

    it 'should edit a translated news item' 

  end

  describe 'PUT update' do
    before :all do
      TranslatedNewsItem.delete_all(:news_item_id => @news_item.id)
      @translated_news_item_to_update = TranslatedNewsItem.gen(:news_item_id => @news_item.id, :title => "Test Translated News",
                                        :language => Language.english, :body => "Test Translated News Item Body", :active_translation => true)
      @update_translated_news_item_params = { :news_item_id => @news_item.id, :id => @translated_news_item_to_update.id,
        :translated_news_item => { :title => "Update Test Translated News", :body => "Update Test Translated News Item Body",
                                   :language_id => Language.english.id, :active_translation => true } }
    end
    it 'should only allow access to EOL administrators' 

    it 'should update a translated news item' 

  end

  describe 'DELETE destroy' do
    before :all do
      TranslatedNewsItem.delete_all(:news_item_id => @news_item.id)
    end
    it 'should only allow access to EOL administrators' 

    it 'should delete a translated news item' 

  end

end

