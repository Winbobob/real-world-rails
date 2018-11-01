require_relative '../simplecov_helper'
require_relative '../rspec_configuration.rb'
require_relative '../../lib/carto/uuidhelper'

class Carto::UUIDHelperInstance
  include Carto::UUIDHelper
end

describe 'UUIDHelper' do

  before(:each) do
    @uuid_helper = Carto::UUIDHelperInstance.new
  end

  it 'validates a valid UUID' 


  it 'validates a random UUID' 


  it 'fails if content prepended' 


  it 'fails if content appended' 


  it 'fails if content prepended with newlines' 


  it 'fails if content appended with newlines' 


end

