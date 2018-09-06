require 'rails_helper'

describe FeedClient do
  before :each do
    @feed = FactoryBot.create :feed, title: 'Some feed title', url: 'http://some.feed.com'

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

  it 'downloads the feed XML and raises an error if response is empty' 


  context 'generic feed autodiscovery' do

    it 'updates fetch_url of the feed with autodiscovery full URL' 


    it 'updates fetch_url of the feed with autodiscovery relative URL' 


    it 'uses http:// for autodiscovered protocol relative URL' 


    it 'uses https:// for autodiscovered protocol relative URL' 


    it 'autodiscovers from internationalized URL' 


    it 'fetches feed' 


    it 'detects that autodiscovered feed is already in the database' 


    it 'autodiscovers already existing feed from internationalized URL' 


    it 'uses first feed available for autodiscovery' 

    
  end

  context 'error handling' do

    it 'raises error if trying to fetch from an unreachable URL' 


    it 'raises error if trying to fetch from a webpage that does not have feed autodiscovery enabled' 


    it 'raises error if trying to fetch from a webpage and being told not to perform autodiscovery' 


    it 'raises error if trying to perform feed autodiscovery on a malformed webpage' 


    it 'does not enter an infinite loop during autodiscovery if the feed linked is not actually a feed' 


    it 'processes entries skipping those that have errors' 

  end

  context 'corrects errors in charset reported by HTTP header' do

    before :each do
      @feed_xml = <<FEED_XML
<?xml version="1.0" encoding="utf-8"?>
<feed xmlns="http://www.w3.org/2005/Atom" xml:lang="en">
  <title>#{@feed_title}</title>
  <link href="#{@feed_url}" rel="alternate" />
  <id>http://xkcd.com/</id>
  <updated>2013-04-15T00:00:00Z</updated>
  <entry>
    <title>#{@entry2.title}</title>
    <link href="#{@entry2.url}" rel="alternate" />
    <updated>#{@entry2.published}</updated>
    <id>#{@entry2.guid}</id>
    <summary type="html">#{@entry2.summary}</summary>
  </entry>
  <entry>
    <title>#{@entry1.title}</title>
    <link href="#{@entry1.url}" rel="alternate" />
    <updated>#{@entry1.published}</updated>
    <id>#{@entry1.guid}</id>
    <summary type="html">#{@entry1.summary}</summary>
  </entry>
</feed>
FEED_XML

      allow(RestClient).to receive(:get).and_return @feed_xml
    end

    it 'corrects charset surrounded by single quotes' 


    it 'corrects charset surrounded by double quotes' 


    it 'corrects charset with semicolon at the end' 


    it 'uses utf-8 by default if an unknown charset is reported by HTTP header' 


    it 'uses encoding from XML if encoding cannot be determined from HTTP headers' 

  end
end

