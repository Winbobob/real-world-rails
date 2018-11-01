require 'spec_helper_min'
require_relative '../simplecov_helper'
require_relative '../rspec_configuration'
require_relative '../../lib/carto/url_validator'

class Carto::UrlValidatorInstance
  include Carto::UrlValidator
end

describe 'UUIDHelper' do
  before(:each) do
    @url_validator = Carto::UrlValidatorInstance.new
  end

  it 'raises an error if the URL is not valid at all' 


  it 'raises an error if it points to a non-standard port' 


  it 'raises an error if the IP is blacklisted' 


  it 'raises an error if the IP belongs to a blacklisted range' 


  it 'does nothing if everything is ok' 


  it 'allows ftp' 

end

