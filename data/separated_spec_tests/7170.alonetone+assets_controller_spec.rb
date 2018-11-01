require "rails_helper"

RSpec.describe AssetsController, type: :request do
  fixtures :assets, :users
  include ActiveJob::TestHelper

  before(:each) do
    DatabaseCleaner.start
    clear_enqueued_jobs
    clear_performed_jobs
  end

  append_after(:each) do
    DatabaseCleaner.clean
  end

  context "#latest" do
    it "should render the home page" 


    it "should render the home page (white)" 

  end

  context '#new' do
    before do
      create_user_session(users(:brand_new_user))
    end

    it 'should not allow new users w/ >= 25 tracks to upload' 

  end

  context "show" do
    it "should render without errors" 


    it "should render without errors (white)" 

  end

  context "#show.mp3" do
    GOOD_USER_AGENTS = [
      "Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en) AppleWebKit/XX (KHTML, like Gecko) Safari/YY",
      "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8) Gecko/20060319 Firefox/2.0",
      "iTunes/x.x.x",
      "Mozilla/4.0 (compatible; MSIE 7.0b; Windows NT 6.0)",
      "msie",
      'webkit'
    ].freeze

    BAD_USER_AGENTS = [
      "Mp3Bot/0.1 (http://mp3realm.org/mp3bot/)",
      "",
      "Googlebot/2.1 (+http://www.google.com/bot.html)",
      "you're momma's so bot...",
      "Baiduspider+(+http://www.baidu.jp/spider/)",
      "baidu/Nutch-1.0 "
    ].freeze

    it 'should have a landing page' 


    it 'should consider an empty user agent to be a spider and not register a listen' 


    it 'should consider any user agent with BOT in its string a bot and not register a listen' 


    it 'should accept a mp3 extension and redirect to the amazon url' 


    GOOD_USER_AGENTS.each do |agent|
      it "should register a listen for #{agent}" 

    end

    BAD_USER_AGENTS.each do |agent|
      it "should not register a listen for #{agent}" 
    it "should NOT register more than one listen from one ip/track in short amount of time" 


    it "should register more than one listen from one IP when legitimate" 


    it 'should record the referer' 


    it 'should allow the refferer to be manually overridden by params' 


    it 'should say "direct hit" when no referer' 

  end

  context '#create' do
    before do
      create_user_session(users(:brand_new_user))
    end

    it 'should prevent uploads from new users with >= 25 tracks' 

  end

  context '#create' do
    before do
      create_user_session(users(:arthur))
    end

    it 'should successfully upload an mp3' 


    it 'should accept an uploaded mp3 from chrome with audio/mp3 content type' 


    it "should email followers and generate waveform via queue" 


    it 'should successfully upload 2 mp3s' 


    it "should successfully extract mp3s from a zip" 


    it "should allow an mp3 upload from an url" 


    it "should allow a zip upload from an url" 

  end
end

