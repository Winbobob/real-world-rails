require "spec_helper"

describe Echo::ClientMiddleware::Echo10GranuleMiddleware do
  let(:middleware) { Echo::ClientMiddleware::Echo10GranuleMiddleware.new }

  context 'when given a single parsed ECHO 10 granule' do
    let(:env) do
      {
        body: {'Granule' => {}}
      }
    end

    it "updates the parsed body to be a list containing one granule object" 

  end

  context 'when given multiple parsed ECHO 10 granules' do
    let(:env) do
      {
        body: {'results' =>
          {'result' => [{'Granule' => {}}, {'Granule' => {}}]}
        }
      }
    end

    it "updates the parsed body to contain a list of granule objects" 

  end

  context 'when given a single parsed result in list format' do
    let(:env) do
      {
        body: {'results' =>
          {'result' => {'Granule' => {}}}
        }
      }
    end

    it "updates the parsed body to be a list containing one granule object" 

  end

  context 'when given an empty list of parsed results' do
    let(:env) do
      {
        body: {'results' => nil}
      }
    end

    it "updates the parsed body to contain an empty list" 

  end

  context 'browse parsing' do
    let(:env) do
      {
        body: {'Granule' => granule}
      }
    end

    context 'given a granule with no browse URLs' do
      let(:granule) { {} }

      it "produces a parsed granule with an empty array of browse URLs" 

    end

    context 'given a granule with one browse URL' do
      let(:browse_url) { 'http://example.com/example.jpg' }
      let(:granule) do
        {'AssociatedBrowseImageUrls' => {'ProviderBrowseUrl' => {'URL' => browse_url}}}
      end

      it "produces a parsed granule with an array containing one browse URL" 

    end

    context 'given a granule with multiple browse URLs' do
      let(:browse1_url) { 'http://example.com/example1.jpg' }
      let(:browse2_url) { 'http://example.com/example2.jpg' }
      let(:granule) do
        {'AssociatedBrowseImageUrls' => {'ProviderBrowseUrl' => [{'URL' => browse1_url}, {'URL' => browse2_url}]}}
      end

      it "produces a parsed granule with an array containing multiple browse URLs" 

    end
  end


  it 'operates on CMR URLS' 


  it 'does not operate on requests with no granule body' 


end

