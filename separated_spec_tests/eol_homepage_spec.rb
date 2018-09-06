require "spec_helper"

include ActionController::Caching::Fragments

describe 'Home page' do

  before :all do
    load_foundation_cache
    Capybara.reset_sessions!
    visit('/') # cache the response the homepage gives before changes
    @homepage_with_foundation = source #source in contrast with body returns html BEFORE any javascript
    @homepage_url = current_url
  end

  after :all do
    truncate_all_tables
  end

  it "should provide consistent canonical URL for home page" 


  it "should not have rel prev or next link tags" 


  it 'should say EOL somewhere' 


  it 'should include the search box, for names and tags (defaulting to names)' 


  it 'should include a login link and join link, when not logged in' 


  it 'should include logout link and not login link, when logged in'

  it 'should have a language picker with all approved languages' 


  it "should have 'Help', 'What is EOL?', 'EOL News' links" 


  describe 'check Donate link' do
    before (:all) do
      @temp = [
        Rails.configuration.use_secure_acceptance,
        Rails.configuration.donate_header_url,
        Rails.configuration.donate_footer_url
      ]
    end

    after do
      Rails.configuration.use_secure_acceptance,
        Rails.configuration.donate_header_url, \
        Rails.configuration.donate_footer_url = @temp
    end

    context 'when donate URL is configured' do

      before do
        Rails.configuration.use_secure_acceptance = true
        Rails.configuration.donate_header_url = \
          Rails.configuration.donate_footer_url = 'http://example.com'
      end

      it "should have 'Donate' link " 


    end

    context 'when donate URL is NOT configured' do

      before do
        Rails.configuration.use_secure_acceptance = false
        Rails.configuration.donate_header_url = \
          Rails.configuration.donate_footer_url = nil
      end

      it "should not have 'Donate' link" 


    end

  end

  it "should links to social media sites" 


  it 'should link to translated forms of gateway articles, not just English versions' 


  it 'should not show deleted comments in community activity' 


  it 'should show the March of Life'

  it 'should show a statistical summary of what is currently in EOL'

  it 'should show recent updates'

end

