require 'spec_helper'

describe Echo::Client do
  let(:connection) { Object.new }
  let(:req) { double(headers: {}) }
  let(:echo_rest_client) { Echo::EchoRestClient.new('http://example.com', '1234') }
  let(:echo_catalog_rest_client) { Echo::EchoCatalogRestClient.new('http://example.com', '1234') }
  let(:cmr_client) { Echo::CmrClient.new('http://example.com', '1234') }
  let(:extended_client) { Class.new(Echo::BaseClient) { def request; super; end } }

  before { allow(cmr_client).to receive(:connection).and_return(connection) }

  context 'collection search' do
    let(:collection_search_url) { "/search/collections.json" }

    context 'using free text' do
      it 'performs searches using partial matches' 


      it 'partially matches any word in the free text query' 


      it 'collapses whitespace in the free text query' 


      it 'escape catalog-rest reserved characters in the free text query' 

    end
  end

  context 'collection details' do
    let(:collection_url) { "/search/concepts/C14758250-LPDAAC_ECS.umm_json_v1_9" }
    let(:resp) { Faraday::Response.new }
    let(:body) { Object.new }
    let(:granule_url) { "http://example.com/search/granules.json" }

    it 'with valid collection ID' 


    # No longer applicable. The granule_url is set in the collection presenter.
    xit "sets the granule_url" do
      expect(connection).to receive(:get).with(collection_url, {}).and_return(resp)
      expect(resp).to receive(:body).and_return([body]).at_least(:once)
      expect(body).to receive(:granule_url=).with(granule_url)
      expect(body).to receive(:granule_url).and_return(granule_url)

      response = cmr_client.get_collection('C14758250-LPDAAC_ECS')
      expect(response.body[0].granule_url).to_not be_nil
    end
  end

  context 'granule search' do
    let(:granule_search_url) { "/search/granules.json" }
    let(:granule_search_base) { "/search/granules" }

    it 'returns data in the requested format' 


    it 'returns data in json format by default' 


    it 'filters granules by a supplied ECHO collection id' 


    it 'filters granules by browse only flag' 

  end

  context 'collection facets' do
    let(:collection_facets_url) { "/search/collections.json" }

    it 'returns collection facets in json format' 


    it 'returns collection facets with a filter' 

  end

  context 'headers' do
    let(:basic_client) do
      # New class with a public request method
      Class.new(Echo::BaseClient) do
        def request(*args)
          super(*args)
        end
      end.new(nil, nil)
    end

    let(:dummy_url) { '/dummy' }
    before { allow(basic_client).to receive(:connection).and_return(connection) }

    it 'defaults Content-Type to application/json for POST requests' 


    it 'does not default Content-Type for GET requests' 


  end

end

