require "spec_helper"

describe InaturalistProjectInfo do

  before(:all) do
    @inat_collection_url = Rails.configuration.inat_collection_url
    @empty_response = "[]"
    @bad_response = "This is not JSON"
  end

  before(:each) do
    Rails.configuration.inat_collection_url = "http://foo.bar"
    $TESTING_INATURALIST_PROJECTS = true
    InaturalistProjectInfo.unlock_caching
    InaturalistProjectInfo.clear_cache
  end

  after(:each) do
    $TESTING_INATURALIST_PROJECTS = false
    Rails.configuration.inat_collection_url = @inat_collection_url
  end

  it 'should get info on a project from the cache' 


  it 'should get info on a project from iNat if not cached' 


  it 'should NOT get info on a project if we have already created the cache' 


  it 'should log a warning and return nil if something goes wrong getting iNat info' 


  it 'should NOT want to cache if already cached' 


  it 'should NOT want to cache if locked' 


  it 'should want to cache if nothing is cached' 


  it '#cache_all should get all pages from iNat' do # Note, this is not a great test. :\
    Net::HTTP.should_receive(:get).and_return(@empty_response)
    InaturalistProjectInfo.cache_all
  end

  it '#cache_all should lock caching' 


  it '#cache_all should unlock caching' 


  it '#cache_all should unlock caching even if it fails' 


end

