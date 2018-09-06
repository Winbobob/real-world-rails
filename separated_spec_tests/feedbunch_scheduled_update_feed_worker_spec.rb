require 'rails_helper'

describe ScheduledUpdateFeedWorker do

  before :each do
    @feed = FactoryBot.create :feed
  end

  it 'updates feed when the job runs' 


  it 'recalculates unread entries count in feed' 


  it 'does not schedule next update if the feed has been deleted' 


  it 'does not schedule next update if the feed has been marked as unavailable' 


  it 'does not update feed if it has been deleted' 


  context 'adaptative schedule' do

    it 'updates the last_fetched timestamp of the feed when successful' 


    it 'decrements a 10% the fetch interval if new entries are fetched' 


    it 'increments a 10% the fetch interval if no new entries are fetched' 


    it 'does not set a fetch interval smaller than the configured minimum' 


    it 'does not set a fetch interval greater than the configured maximum' 


  end

  context 'feed fetch_url is failing' do

    before :each do
      # Stub Time.zone.now so that it returns a fixed date
      @time_now = Time.zone.parse '2000-01-01 01:00:00'
      allow_any_instance_of(ActiveSupport::TimeZone).to receive(:now).and_return @time_now
    end

    context 'failing for the first time' do

      before :each do
        @feed.update failing_since: nil
        allow(RestClient).to receive(:get).and_raise RestClient::RequestTimeout.new
      end

      it 'marks feed as failing' 


      it 'does not try to perform autodiscovery' 


      it 'does not change fetch_url' 

    end

    context 'failing for less than the configured interval' do

      before :each do
        @autodiscovery_after = Feedbunch::Application.config.autodiscovery_after
        # Feed has been failing for 1 minute less than the configured autodiscovery_after interval
        @failing_since = Time.zone.now + 1.minute - @autodiscovery_after
        @feed.update failing_since: @failing_since
      end

      it 'keeps feed marked as failing' 


      it 'does not try to perfom autodiscovery' 


      it 'does not change fetch_url' 

    end

    context 'failing for longer than the configured interval' do

      before :each do
        @autodiscovery_after = Feedbunch::Application.config.autodiscovery_after
        # Feed has been failing for 1 hour longer than the configured autodiscovery_after interval
        @failing_since = Time.zone.now - 1.hour - @autodiscovery_after
        @feed.update failing_since: @failing_since
      end

      it 'attempts autodiscovery' 


      context 'autodiscovery successful' do

        before :each do
          @new_fetch_url = 'http://new.fetch.url.com/'
          @new_feed_title = 'new feed title'

          @entry = FactoryBot.build :entry
          @entry.title = 'Silence'
          @entry.url = 'http://xkcd.com/1199/'
          @entry.summary = %{All music is just performances of 4'33" in studios where another band happened to be playing at the time.}
          @entry.published = 'Mon, 15 Apr 2013 04:00:00 -0000'
          @entry.guid = 'http://xkcd.com/1199/'

          @webpage_html = <<WEBPAGE_HTML
<!DOCTYPE html>
<html>
<head>
  <link rel="feed" href="#{@new_fetch_url}">
</head>
<body>
  webpage body
</body>
</html>
WEBPAGE_HTML
          allow(@webpage_html).to receive(:headers).and_return({})

          @feed_xml = <<FEED_XML
<?xml version="1.0" encoding="utf-8"?>
<feed xmlns="http://www.w3.org/2005/Atom" xml:lang="en">
  <title>#{@new_feed_title}</title>
  <link href="#{@feed.url}" rel="alternate" />
  <id>http://xkcd.com/</id>
  <updated>2013-04-15T00:00:00Z</updated>
  <entry>
    <title>#{@entry.title}</title>
    <link href="#{@entry.url}" rel="alternate" />
    <updated>#{@entry.published}</updated>
    <id>#{@entry.guid}</id>
    <summary type="html">#{@entry.summary}</summary>
  </entry>
</feed>
FEED_XML
          allow(@feed_xml).to receive(:headers).and_return({})

          # The feed fetch_url is no longer valid. The feed url is still valid, and the new fetch_url can be obtained
          # from the HTML via autodiscovery.
          allow(RestClient).to receive :get do |url|
            if url == @feed.fetch_url
              raise RestClient::RequestTimeout.new
            elsif url == @feed.url
              @webpage_html
            elsif url == @new_fetch_url
              @feed_xml
            else
              raise StandardError.new
            end
          end
        end

        it 'replaces fetch_url with autodiscovered one' 


        it 'fetches feed from new fetch URL' 


        it 'marks feed as not failing' 

      end

      context 'autodiscovery failed' do

        before :each do
          @webpage_html = <<WEBPAGE_HTML
<!DOCTYPE html>
<html>
<head>
  <link rel="feed" href="#{@feed.fetch_url}">
</head>
<body>
  webpage body
</body>
</html>
WEBPAGE_HTML
          allow(@webpage_html).to receive(:headers).and_return({})

          # The feed fetch_url is no longer valid. The feed url is still valid, but attempting to audiscover just
          # returns the failing fetch_url again
          allow(RestClient).to receive :get do |url|
            if url == @feed.fetch_url
              raise RestClient::RequestTimeout.new
            elsif url == @feed.url
              @webpage_html
            else
              raise StandardError.new
            end
          end
        end

        it 'keeps feed marked as failing' 


        it 'does not change fetch_url attribute' 


        it 'does not fetch new entries' 

      end
    end
  end

  context 'error handling' do

    it 'increments the fetch interval if the feed server returns an HTTP error status' 


    it 'increments the fetch interval if the request times out' 


    it 'increments the fetch interval if the feed server FQDN cannot be resolved' 


    it 'increments the fetch interval if the feed server connection times out' 


    it 'increments the fetch interval if the server refuses the connection' 


    it 'increments the fetch interval if the server is unreachable' 


    it 'increments the fetch interval if the server resets the connection' 


    it 'increments the fetch interval if the feed server response is empty' 


    it 'increments the fetch interval if there is a problem trying to do a feed autodiscovery' 


    it 'increments the fetch interval if there is a problem trying to fetch a valid feed xml' 


    it 'increments the fetch interval if the response should be zipped but it is not' 


    it 'increments the fetch interval if the response is incorrectly zipped' 


    it 'increments the fetch interval if a bad HTTP response is received' 


  end

  context 'failing feed' do

    it 'sets failing_since to the current date&time the first time an update fails' 


    it 'sets failing_since to nil when an update runs successfully' 


    it 'does not change failing_since the second and sucesive times an update fails successively' 


    it 'marks feed as unavailable when it has been failing longer than the configured maximum' 


    it 'does not schedule next update for a feed that has been failing longer than the configured maximum' 


    it 'does not mark feed as unavailable when it has been failing a week but the next update is successful' 


    it 'does not mark feed as unavailable when it updates successfully' 

  end

  context 'delete old entries' do

    before :each do
      @entries = []
      time_oldest_entry = Time.zone.parse '2000-01-01'
       # Feed has 498 entries
      (1..498).each do |i|
        entry = FactoryBot.build :entry, feed_id: @feed.id, published: time_oldest_entry + i.days
        @feed.entries << entry
        @entries << entry
      end

      @time_now = Time.zone.parse '2050-01-01'
      allow_any_instance_of(ActiveSupport::TimeZone).to receive(:now).and_return @time_now
    end

    it 'does not delete entries if they are under the limit' 


    it 'deletes entries above the entries per feed limit, keeping the newer ones' 


    it 'deletes entries above the per feed limit, keeping newer ones and ignoring already deleted entries' 

  end

end

