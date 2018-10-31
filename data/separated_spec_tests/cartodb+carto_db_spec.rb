require_relative '../simplecov_helper'
require 'rails'
require 'ostruct'
require_relative '../rspec_configuration'
require_relative '../../config/initializers/carto_db'

# Just "open" the modules so that we make sure they are defined,
#  but do not overwrite anything so that it doesn't affect other tests.
module CartoDB
  module Cartodb; end
end

describe 'CartoDB' do

  describe '#ip?' do
    it 'detects ips' 

  end

  describe 'extract_subdomain' do
    it 'extracts subdomain without subdomainless_urls' 


    it 'extracts subdomain with subdomainless_urls' 

  end
end

