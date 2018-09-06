require 'rails_helper'

describe FeedClient do
  before :each do
    published = Time.zone.parse('2000-01-01')
    allow_any_instance_of(ActiveSupport::TimeZone).to receive(:now).and_return published

    @feed = FactoryBot.create :feed, title: 'Some feed title', url: 'http://some.feed.com'

    @feed_title = 'CRISEI'
    @feed_url = 'http://crisei.blogalia.com/'

    @entry1 = FactoryBot.build :entry
    @entry1.title = 'SIR GAWAIN: GALLARDO Y CALAVERA'
    @entry1.url = 'http://crisei.blogalia.com//historias/74112'
    @entry1.summary = '<p>Hijo de reina hada, aunque el detalle pase por alto en la saga, sobrino del rey Arturo y hermanastro a su pesar del traidor Mordred, escocés de isla pero latino de corazón, el jovial Sir Gawain es el personaje que, sin ser familia directa de Valiente, se convierte en la serie en lo más parecido a un padre, primero, a un hermano mayor, más tarde, y en ocasiones incluso a un atolondrado hermano pequeño.</p>'
    @entry1.published = published
    @entry1.guid = 'http://crisei.blogalia.com//historias/74112'

    @entry2 = FactoryBot.build :entry
    @entry2.title = 'PRÍNCIPE VALIENTE: NUEVA EDICIÓN GIGANTE Y EN COLOR'
    @entry2.url = 'http://crisei.blogalia.com//historias/74115'
    @entry2.summary = '<p>Nueva edición restaurada, y a color, de Príncipe Valiente. A partir de la restauración en blanco y negro de Manuel Caldas y con los colores originales reconstruidos, pero no a partir de los viejos periódicos escaneados.</p>'
    @entry1.published = published
    @entry2.guid = 'http://crisei.blogalia.com//historias/74115'
  end

  context 'ISO-8859-1 encoded feed fetching' do

    before :each do
      feed_file = File.join __dir__, '..', '..', '..', 'attachments', 'iso-8859-1-feed.xml'
      feed_xml = File.read feed_file
      allow(feed_xml).to receive(:headers).and_return({content_type: 'text/html; charset=iso-8859-1'})
      allow(RestClient).to receive(:get).and_return feed_xml
    end

    it 'returns the feed if successful' 


    it 'fetches the right entries and saves them in the database' 


    it 'ignores entry if it is received again' 


    it 'saves entry if another one with the same guid but from a different feed is already in the database' 


    it 'retrieves the feed title and saves it in the database' 


    it 'retrieves the feed URL and saves it in the database' 

  end

  context 'RSS 2.0 feed autodiscovery' do

    it 'updates fetch_url of the feed with autodiscovery full URL' 


    it 'updates fetch_url of the feed with autodiscovery relative URL' 


    it 'uses http:// for autodiscovered protocol relative URL' 


    it 'uses https:// for autodiscovered protocol relative URL' 


    it 'fetches feed' 


    it 'detects that autodiscovered feed is already in the database' 


    it 'uses first feed available for autodiscovery' 


  end

end

