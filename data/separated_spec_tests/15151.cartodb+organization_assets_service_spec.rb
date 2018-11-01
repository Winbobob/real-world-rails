require 'spec_helper_min'

describe Carto::OrganizationAssetsService do
  describe('#location') do
    after(:each) do
      Carto::OrganizationAssetsService.instance.instance_variable_set(:@location, nil)
    end

    it 'uses bucket when available' 


    it 'uses location when available if bucket is not' 


    it 'uses default when neither bucket nor location are available' 

  end

  describe('#max_size_in_bytes') do
    after(:each) do
      Carto::OrganizationAssetsService.instance.instance_variable_set(:@max_size_in_bytes, nil)
    end

    it 'uses conf when available' 


    it 'uses default when conf is not available' 

  end
end

