require 'spec_helper'
require 'twitter_service'

describe 'TwitterService' do
    before :each do
      Settings.features.twitter.notifications.enabled = true
      stub_request(:post, /api\.twitter\.com/).to_return(:status => 200, :body => '{ "id": 243145735212777472, "text": "hello world" }')
      stub_request(:get, 'www.googleapis.com').to_return(:status => 200 )
    end

    let(:hangout) { FactoryBot.create(:event_instance, updated: '10:00 UTC', hangout_url: nil, yt_video_id: nil) }
    let(:hangout_participants) do
        {"0" => {"id" => "xxx.id.google.com^xxx", "hasMicrophone" => "true",
              "hasCamera" => "true", "hasAppEnabled" => "false",
              'isBroadcaster' => "false", "isInBroadcast" => "true",
              "displayIndex" => "0", "person" =>
                 {"id" => "xxx", "displayName" => "Foo Bar",
                  "image" => {"url" => ".../s96-c/photo.jpg"},
                  "fa" => "false"}, "locale" => "en", "fa" => "false"},
         "1" => {"id" => "xxx.id.google.com^xxx", "hasMicrophone" => "true",
              "hasCamera" => "true", "hasAppEnabled" => "false",
              "isBroadcaster" => "false", "isInBroadcast" => "true",
              "displayIndex" => "1", "person" =>
                 {"id" => "xxx", "displayName" => "Bar Foo",
                  "image" => {"url" => ".../s96-c/photo.jpg"},
                  "fa" => "false"}, "locale" => "en", "fa" => "false"},
         "2" => {"id" => "xxx.id.google.com^xxx", "hasMicrophone" => "true",
              "hasCamera" => "true", "hasAppEnabled" => "true",
              "isBroadcaster" => "true", "isInBroadcast" => "true",
               "displayIndex" => "2", "person" =>
                 {"id" => "xxx", "displayName" => "John Doe",
                  "image" => {"url" => ".../s96-c/photo.jpg"}, "fa" => "false"},
                  "locale" => "en", "fa" => "false"}}

    end

    context 'pair programming tweet' do
      before(:each) do
        hangout.category = 'PairProgramming'
        hangout.participants = hangout_participants
      end

      context 'with project' do
        it 'posts twitter notification with project title' 


        it 'tweets video link with project title' 


        it 'does not tweet video link if video is invalid' 

      end

      context 'without project' do
        before(:each) { hangout.project = nil }

        it 'posts twitter notification with hangout title' 


        it 'tweets video link with hangout title' 

      end
    end

    context 'scrum notification' do
      before(:each) do
        hangout.category = 'Scrum'
        hangout.participants = hangout_participants
      end

      it 'posts twitter notification' 


      it 'tweets video link' 

    end

    it 'does not tweet and raises error when category is unrecognized' 


    context "with tweet notification setting" do
      describe "enabled" do
        it "allows the tweet" 


      end
      describe "disabled" do
        it "does not allow the tweet" 

      end
    end

    it "creates a valid twitter client object" 


    it "configures the client object" 


    it 'sends a post request to the twitter api' 

end

