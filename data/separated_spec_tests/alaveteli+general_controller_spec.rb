# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require 'fakeweb'

describe GeneralController do

  describe 'GET version' do

    it 'renders json stats about the install' 


  end

end

describe GeneralController, "when trying to show the blog" do
  before (:each) do
    FakeWeb.clean_registry
  end
  after (:each) do
    FakeWeb.clean_registry
  end

  it "should fail silently if the blog is returning an error" 

end

describe GeneralController, 'when getting the blog feed' do

  before do
    allow(AlaveteliConfiguration).to receive(:blog_feed).and_return("http://blog.example.com")
    # Don't call out to external url during tests
    allow(controller).to receive(:quietly_try_to_open).and_return('')
  end

  it 'should add a lang param correctly to a url with no querystring' 


  it 'should add a lang param correctly to a url with an existing querystring' 


  it 'should parse an item from an example feed' 


  context 'if no feed is configured' do

    before do
      allow(AlaveteliConfiguration).to receive(:blog_feed).and_return('')
    end

    it 'should raise an ActiveRecord::RecordNotFound error' 

  end

  context 'when the blog has entries' do

    render_views

    it 'should escape any javascript from the entries' 


  end

end

describe GeneralController, "when showing the frontpage" do

  render_views

  before do
    public_body = mock_model(PublicBody, :name => "Example Public Body",
                             :url_name => 'example_public_body')
    info_request = mock_model(InfoRequest, :public_body => public_body,
                              :title => 'Example Request',
                              :url_title => 'example_request')
    info_request_event = mock_model(InfoRequestEvent, :created_at => Time.zone.now,
                                    :info_request => info_request,
                                    :described_at => Time.zone.now,
                                    :search_text_main => 'example text')
    xapian_result = double('xapian result', :results => [{:model => info_request_event}])
    allow(controller).to receive(:perform_search).and_return(xapian_result)
  end

  it "should render the front page successfully" 


  it "should render the front page with default language" 


  it "should render the front page with default language" 


  it 'should generate a feed URL for successful requests' 



  it "should render the front page with default language and ignore the browser setting" 


  it "should render the front page with browser-selected language when there's no default set" 


  it "doesn't raise an error when there's no user matching the one in the session" 


  describe 'when using locales' do

    it "should use our test PO files rather than the application one" 


  end

  describe 'when handling logged-in users' do

    before do
      @user = FactoryBot.create(:user)
      session[:user_id] = @user.id
    end

    it 'should set a time to live on a non "remember me" session' 


    it 'should not set a time to live on a "remember me" session' 


    it 'should end a logged-in session whose ttl has expired' 


    it "should render the front page successfully with post_redirect if post_params is not set" 


  end

  describe 'when handling pro users' do
    before do
      @user = FactoryBot.create(:pro_user)
      session[:user_id] = @user.id
      allow(controller).to receive(:feature_enabled?).with(:alaveteli_pro).and_return(true)
    end

    it 'should redirect pro users to the pro dashboard' 

  end

end


describe GeneralController, 'when using xapian search' do

  render_views

  # rebuild xapian index after fixtures loaded
  before(:each) do
    load_raw_emails_data
    get_fixtures_xapian_index
  end

  it "should redirect from search query URL to pretty URL" 


  it "should find info request when searching for '\"fancy dog\"'" 


  it "should find public body and incoming message when searching for 'geraldine quango'" 


  it "should filter results based on end of URL being 'all'" 


  it "should filter results based on end of URL being 'users'" 


  it 'should highlight words for a user-only request' 


  it 'should show spelling corrections for a user-only request' 


  it "should filter results based on end of URL being 'requests'" 


  it "should filter results based on end of URL being 'bodies'" 


  it 'should prioritise direct matches of public body names' 


  it 'should show "Browse all" link if there are no results for a search restricted to bodies' 


  it "should show help when searching for nothing" 


  it "should not show unconfirmed users" 


  it "should show newly-confirmed users" 


  it "should show tracking links for requests-only searches" 


  it 'should not show high page offsets as these are extremely slow to generate' 


  it 'should pass xapian error messages to flash and redirect to a blank search page' 


  context "when passed a non-HTML request" do

    it "responds with a 404" 


    it "treats invalid formats as html" 


    it "does not call the search" 


  end
end

