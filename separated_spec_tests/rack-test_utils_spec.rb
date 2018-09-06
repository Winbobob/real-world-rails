require 'spec_helper'

describe Rack::Test::Utils do
  include Rack::Test::Utils

  describe 'build_nested_query' do
    it 'converts empty strings to =' 


    it 'converts nil to an empty string' 


    it 'converts hashes with nil values' 


    it 'converts hashes' 


    it 'converts hashes with multiple keys' 


    it 'converts arrays with one element' 


    it 'converts arrays with multiple elements' 


    it "converts arrays with brackets '[]' in the name" 


    it 'converts nested hashes' 


    it 'converts arrays nested in a hash' 


    it 'converts arrays of hashes' 


    it 'supports hash keys with empty arrays' 

  end

  describe 'Rack::Test::Utils.build_multipart' do
    it 'builds multipart bodies' 


    it 'builds multipart bodies from array of files' 


    it 'builds nested multipart bodies' 


    it 'builds nested multipart bodies with an array of hashes' 


    it 'builds nested multipart bodies with arbitrarily nested array of hashes' 


    it 'does not break with params that look nested, but are not' 


    it 'allows for nested files' 


    it 'returns nil if no UploadedFiles were used' 


    it 'raises ArgumentErrors if params is not a Hash' 


    def multipart_file(name)
      File.join(File.dirname(__FILE__), '..', '..', 'fixtures', name.to_s)
    end
  end
end

