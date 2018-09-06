require File.expand_path("../../../spec_helper", __FILE__)

describe 'PlaceDenormalizer' do

  before(:all) do
    enable_elastic_indexing( Identification )
    @place = make_place_with_geom
    @observation = Observation.make!(latitude: @place.latitude,
      longitude: @place.longitude)
  end

  after(:all) { disable_elastic_indexing( Identification ) }

  it 'should denormalize properly' 


  it 'should truncate the table' 


end

