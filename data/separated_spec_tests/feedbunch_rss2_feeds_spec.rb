require 'rails_helper'

describe FeedClient do
  before :each do
    @original_feed_title = 'Some feed title'
    @original_feed_url = 'http://some.feed.com/'
    @feed = FactoryBot.create :feed, title: @original_feed_title, url: @original_feed_url
  end

  context 'RSS 2.0 feed fetching' do

    before :each do
      @feed_title = 'xkcd.com'
      @feed_url = 'http://xkcd.com/'

      @entry1 = FactoryBot.build :entry
      @entry1.title = 'Silence'
      @entry1.url = 'http://xkcd.com/1199/'
      @entry1.summary = %{&lt;p&gt;All music is just performances of 4'33" in studios where another band happened to be playing at the time.&lt;/p&gt;}
      @entry1.published = 'Mon, 15 Apr 2013 04:00:00 -0000'
      @entry1.guid = 'http://xkcd.com/1199/'

      @entry2 = FactoryBot.build :entry
      @entry2.title = 'Geologist'
      @entry2.url = 'http://xkcd.com/1198/'
      @entry2.summary = %{&lt;p&gt;'It seems like it's still alive, Professor.' 'Yeah, a big one like this can keep running around for a few billion years after you remove the head.';&lt;/p&gt;}
      @entry2.published = 'Fri, 12 Apr 2013 04:00:00 -0000'
      @entry2.guid = 'http://xkcd.com/1198/'

      feed_xml = <<FEED_XML
<?xml version="1.0" encoding="utf-8"?>
<rss version="2.0">
  <channel>
    <title>#{@feed_title}</title>
    <link>#{@feed_url}</link>
    <description>xkcd.com: A webcomic of romance and math humor.</description>
    <language>en</language>
    <item>
      <title>#{@entry2.title}</title>
      <link>#{@entry2.url}</link>
      <description>#{@entry2.summary}</description>
      <pubDate>#{@entry2.published}</pubDate>
      <guid>#{@entry2.guid}</guid>
    </item>
    <item>
      <title>#{@entry1.title}</title>
      <link>#{@entry1.url}</link>
      <description>#{@entry1.summary}</description>
      <pubDate>#{@entry1.published}</pubDate>
      <guid>#{@entry1.guid}</guid>
    </item>
  </channel>
</rss>
FEED_XML

      allow(feed_xml).to receive(:headers).and_return({})
      allow(RestClient).to receive(:get).and_return feed_xml
    end

    it 'returns the feed if successful' 


    it 'fetches the right entries and saves them in the database' 


    it 'ignores entry if it is received again' 


    it 'saves entry if another one with the same guid but from a different feed is already in the database' 


    it 'retrieves the feed title and saves it in the database' 


    it 'does not update the feed title if it is not present in the feed' 


    it 'retrieves the feed URL and saves it in the database' 


    it 'does not update the feed URL if it is not present in the feed' 

  end

  context 'RSS 2.0 feed with enclosure' do
    before :each do
      @feed_title = 'The Stream'
      @feed_url = 'http://stream.aljazeera.com/'

      @entry1 = FactoryBot.build :entry
      @entry1.title = 'THE STREAM - #StreamUpdate: A look at the latest news from stories we are still following'
      @entry1.url = 'http://feeds.aljazeera.net/~r/podcasts/thestream/~5/fOcYtQPdqqg/864352181001_5230037280001_5229992741001.mp4'
      @entry1.summary = %{&lt;p&gt;This episode’s story:&lt;/p&gt;}
      @entry1.published = 'Thu, 01 Dec 2016 01:21:59 +0300'
      @entry1.guid = '5229992741001: THE STREAM - #StreamUpdate: A look at the latest news from stories we are still following'

      @entry2 = FactoryBot.build :entry
      @entry2.title = 'Castro’s global legacy'
      @entry2.url = 'http://feeds.aljazeera.net/~r/podcasts/thestream/~5/LXQq-6RPXpM/864352181001_5231404292001_5231384794001.mp4'
      @entry2.summary = %{&lt;p&gt;Follow The Stream and join Al Jazeera’s social media community;&lt;/p&gt;}
      @entry2.published = 'Fri, 02 Dec 2016 01:50:42 +0300'
      @entry2.guid = '5231384794001: Castro’s global legacy'

      feed_xml = <<FEED_XML
<?xml version="1.0" encoding="utf-8"?>
<rss xmlns:itunes="http://www.itunes.com/dtds/podcast-1.0.dtd" xmlns:feedburner="http://rssnamespace.org/feedburner/ext/1.0" version="2.0">
  <channel>
    <title>#{@feed_title}</title>
    <link>#{@feed_url}</link>
    <description>xkcd.com: A webcomic of romance and math humor.</description>
    <language>en</language>
    <item>
      <title>#{@entry2.title}</title>
      <enclosure url="#{@entry2.url}" length="720714544" type="video/mp4" />
      <description>#{@entry2.summary}</description>
      <pubDate>#{@entry2.published}</pubDate>
      <guid>#{@entry2.guid}</guid>
    </item>
    <item>
      <title>#{@entry1.title}</title>
      <enclosure url="#{@entry1.url}" length="720714544" type="video/mp4" />
      <description>#{@entry1.summary}</description>
      <pubDate>#{@entry1.published}</pubDate>
      <guid>#{@entry1.guid}</guid>
    </item>
  </channel>
</rss>
FEED_XML

      allow(feed_xml).to receive(:headers).and_return({})
      allow(RestClient).to receive(:get).and_return feed_xml
    end

    it 'fetches the right entries and saves them in the database' 

  end

  context 'RSS 2.0 feed autodiscovery' do

    before :each do
      @feed_title = 'xkcd.com'
      @feed_url = 'http://xkcd.com/'

      @entry1 = FactoryBot.build :entry
      @entry1.title = 'Silence'
      @entry1.url = 'http://xkcd.com/1199/'
      @entry1.summary = %{&lt;p&gt;All music is just performances of 4'33" in studios where another band happened to be playing at the time.&lt;/p&gt;}
      @entry1.published = 'Mon, 15 Apr 2013 04:00:00 -0000'
      @entry1.guid = 'http://xkcd.com/1199/'

      @entry2 = FactoryBot.build :entry
      @entry2.title = 'Geologist'
      @entry2.url = 'http://xkcd.com/1198/'
      @entry2.summary = %{&lt;p&gt;'It seems like it's still alive, Professor.' 'Yeah, a big one like this can keep running around for a few billion years after you remove the head.';&lt;/p&gt;}
      @entry2.published = 'Fri, 12 Apr 2013 04:00:00 -0000'
      @entry2.guid = 'http://xkcd.com/1198/'
    end

    it 'updates fetch_url of the feed with autodiscovery full URL' 


    it 'updates fetch_url of the feed with autodiscovery relative URL' 


    it 'uses http:// for autodiscovered protocol relative URL' 


    it 'uses https:// for autodiscovered protocol relative URL' 


    it 'fetches feed' 


    it 'detects that autodiscovered feed is already in the database' 


    it 'uses first feed available for autodiscovery' 


  end

end

