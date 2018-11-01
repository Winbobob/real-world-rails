require 'rails_helper'
require_dependency 'jobs/regular/process_post'

describe Jobs::PollFeed do
  let(:poller) { Jobs::PollFeed.new }

  context "execute" do
    let(:url) { "http://eviltrout.com" }
    let(:embed_by_username) { "eviltrout" }

    before do
      $redis.del("feed-polled-recently")
    end

    it "requires feed_polling_enabled?" 


    it "requires feed_polling_url" 


    it "delegates to poll_feed" 


    it "won't poll if it has polled recently" 

  end

  describe '#poll_feed' do
    let(:embed_by_username) { 'eviltrout' }
    let(:embed_username_key_from_feed) { 'discourse:username' }
    let!(:default_user) { Fabricate(:evil_trout) }
    let!(:feed_author) { Fabricate(:user, username: 'xrav3nz', email: 'hi@bye.com') }

    shared_examples 'topic creation based on the the feed' do
      describe 'author username parsing' do
        context 'when neither embed_by_username nor embed_username_key_from_feed is set' do
          before do
            SiteSetting.embed_by_username = ""
            SiteSetting.embed_username_key_from_feed = ""
          end

          it 'does not import topics' 

        end

        context 'when embed_by_username is set' do
          before do
            SiteSetting.embed_by_username = embed_by_username
            SiteSetting.embed_username_key_from_feed = ""
          end

          it 'creates the new topics under embed_by_username' 

        end

        context 'when embed_username_key_from_feed is set' do
          before do
            SiteSetting.embed_username_key_from_feed = embed_username_key_from_feed
          end

          it 'creates the new topics under the username found' 


          it "updates the post if it had been polled" 

        end
      end

      it 'parses creates a new post correctly' 

    end

    context 'when parsing RSS feed' do
      before do
        SiteSetting.feed_polling_enabled = true
        SiteSetting.feed_polling_url = 'https://blog.discourse.org/feed/'
        SiteSetting.embed_by_username = embed_by_username

        stub_request(:head, SiteSetting.feed_polling_url)
        stub_request(:get, SiteSetting.feed_polling_url).to_return(
          body: file_from_fixtures('feed.rss', 'feed').read,
          headers: { "Content-Type" => "application/rss+xml" }
        )
      end

      include_examples 'topic creation based on the the feed'
    end

    context 'when parsing ATOM feed' do
      before do
        SiteSetting.feed_polling_enabled = true
        SiteSetting.feed_polling_url = 'https://blog.discourse.org/feed/atom/'
        SiteSetting.embed_by_username = embed_by_username

        stub_request(:head, SiteSetting.feed_polling_url)
        stub_request(:get, SiteSetting.feed_polling_url).to_return(
          body: file_from_fixtures('feed.atom', 'feed').read,
          headers: { "Content-Type" => "application/atom+xml" }
        )
      end

      include_examples 'topic creation based on the the feed'
    end

    it "aborts when it can't fetch the feed" 


    context 'encodings' do
      before do
        SiteSetting.feed_polling_enabled = true
        SiteSetting.feed_polling_url = 'https://blog.discourse.org/feed/atom/'
        SiteSetting.embed_by_username = 'eviltrout'

        stub_request(:head, SiteSetting.feed_polling_url)
      end

      it 'works with encodings other than UTF-8' 


      it 'respects the charset in the Content-Type header' 


      it 'works when the charset in the Content-Type header is unknown' 

    end
  end
end

