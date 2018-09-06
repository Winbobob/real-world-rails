# encoding: utf-8
require "spec_helper"

def create_user username, password
  user = User.gen username: username, password: password
  user.password = password
  user.save!
  user
end

describe 'Users' do

  before(:all) do
    load_foundation_cache
    Capybara.reset_sessions!
    username = 'userprofilespec'
    password = 'beforeall'
    @user     = create_user(username, password)
    @watch_collection = @user.watch_collection
    @anon_user = User.gen(password: 'password')
  end

  after(:each) do
    @user.update_column(:language_id, Language.english.id)
    visit('/logout')
    I18n.locale = :en
  end

  it 'should generate api key' 


  it 'should change preferred language' 


  # TODO - we appear to be missing this checkbox.  ...Meaning, really: it's not there. I don't know if this is
  # desired or not.
  # it 'should toggle the checkbox to show news in preferred language' do
  #   login_as @user
  #   visit edit_user_path(@user)
  #   body.should_not have_selector("input[id=user_news_in_preferred_language][checked]")
  #   puts "what page are we on?"
  #   check "user_news_in_preferred_language"
  #   click_button "Save profile information"
  #   visit edit_user_path(@user)
  #   body.should have_selector("input[id=user_news_in_preferred_language][checked]")
  #   uncheck "user_news_in_preferred_language"
  #   click_button "Save profile information"
  #   visit edit_user_path(@user)
  #   body.should have_selector(".account .checkbox") do |tags|
  #     tags.should_not have_selector("input[id=user_news_in_preferred_language][checked]")
  #   end
  # end

  describe 'collections' do
    before(:each) do
      visit(user_collections_path(@user))
    end
    it 'should show their watch collection' 

  end

  describe 'my info' do
    before(:each) do
      visit(user_path(@user))
    end
    it "should have a 'My info' section"  do
      body.should have_selector("h3", text: "My info")
      body.should have_selector(".info") do |tags|
        tags.should have_selector('dd', text: @user.full_name)
        tags.should have_selector('dd', text: @user.username)
      end
      #TODO - add more tests for 'My info' section
    end
    it "should not see Curator qualifications section if user is not curator" 

    it "should not see curation activities in the Activity section if user is not curator" 

    it "should see curation activities in the Activity section only if user is curator" 

  end

  describe 'my activity' do
    it "should have a form with dropdown filter element" 

    it "should get data from a form and display accordingly" 

  end

  describe 'newsfeed' do
    it 'should show a newsfeed'
    it 'should allow comments to be added' 

    it 'should auto submit comment, posted before login, after user then logs in with Facebook'
    # TODO: Tried to do this but Web mock wasn't stubbing request and redirects weren't being followed!?
  end

  it 'should not show a newsfeed, info, activity, collections, communities, content partners of a deactivated user' 

  
end

