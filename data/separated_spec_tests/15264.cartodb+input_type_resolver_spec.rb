# encoding: utf-8

require_relative '../../lib/internal-geocoder/input_type_resolver.rb'
require_relative '../../../../spec/rspec_configuration.rb'

class String
  # We just need this instead of adding the whole rails thing
  def present?
    self && !empty?
  end
end

describe CartoDB::InternalGeocoder::InputTypeResolver do

  before(:each) do
    @internal_geocoder = mock
    @input_type_resolver = CartoDB::InternalGeocoder::InputTypeResolver.new(@internal_geocoder)
  end

  describe '#type' do

    it 'should return an array characterizing the inputs for <namedplace, country_name, region_name, point>' 


  end

  describe '#kind' do
    it 'should return the type of the internal geocoding: namedplace' 

  end

  describe '#geometry_type' do
    it 'should return the type of the geometry to be geocoded: polygon' 

  end

  describe '#country_input_type' do
    it 'should return column if a column was passed' 


    it 'should return column if no column was passed' 

  end

  describe '#region_input_type' do
    it 'should return :column if a column is present' 


    it 'should return :text if regions are present' 


    it 'should return nil if no column or text are present' 

  end

end

