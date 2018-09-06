# encoding: utf-8
require_relative '../../../spec/rspec_configuration'
require_relative '../../../spec/spec_helper'
require_relative '../lib/hires_geocoder_factory'
require_relative '../lib/geocoder_config'

describe CartoDB::HiresGeocoderFactory do

  after(:all) do
    # reset config
    CartoDB::GeocoderConfig.instance.set(nil)
  end

  before(:each) do
    @log = mock
    @log.stubs(:append)
    @log.stubs(:append_and_store)
    @geocoding_model = FactoryGirl.create(:geocoding, kind: 'high-resolution', formatter: '{street}')
  end

  describe '#get' do
    it 'returns a HiresGeocoder instance if the input file has less than N rows' 


    it 'returns a HiresBatchGeocoder instance if the input file is above N rows' 


    it 'returns a batch geocoder if config has force_batch set to true' 


  end

end

