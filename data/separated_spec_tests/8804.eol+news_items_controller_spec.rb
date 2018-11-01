require "spec_helper"

describe NewsItemsController do

  # NOTE - if you're getting failures on this one, check the time. If it's close the end of a day at the end of the
  # month, you will get failures because of the way we're creating the date. We should probably change that.  TODO.
  # :|
  before(:all) do
    unless @admin = User.find_by_username('admins_controller_specs')
      load_foundation_cache
      @admin = User.gen(:username => 'admins_controllers_specs', :password => "password", :admin => true)
    end
    @news_item_1 = NewsItem.gen(:page_name => "test_translated_news_item_1", :active => true, :user => @admin, :display_date => Time.now - 2.hours)
    @translated_news_item_1 = TranslatedNewsItem.gen(:news_item_id => @news_item_1.id, :title => "Test Translated News1",
                                      :language => Language.english, :body => "Test Translated News Item Body1", :active_translation => true)
    @news_item_2 = NewsItem.gen(:page_name => "test_translated_news_item_2", :active => true, :user => @admin, :display_date => Time.now - 1.hour)
    @translated_news_item_2 = TranslatedNewsItem.gen(:news_item_id => @news_item_2.id, :title => "Test Translated News2",
                                      :language => Language.english, :body => "Test Translated News Item Body2", :active_translation => true)
  end

  describe 'GET index' do
    it "should instantiate page_title and translated news items in descending order of display_date" 

  end

  describe 'GET show' do
    it "should redirect to news item page" 

  end

end

