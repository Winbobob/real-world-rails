require 'spec_helper'

describe WebMock::Util::QueryMapper do
  subject { described_class }

  context '#query_to_values' do
    it 'should raise on invalid notation' 


    it 'should parse hash queries' 


    it 'should parse one nil value queries' 


    it 'should parse array queries' 


    it 'should parse string queries' 


    it 'should parse nested queries' 


    it "should parse nested repeated correctly" 


    it "should parse nested non-repeated correctly" 


    it 'should not attempt to mutate its query argument' 


    it "should parse hash query with key starting with non word character" 

  end

  context '#to_query' do
    it 'should transform nil value' 

    it 'should transform string value' 

    it 'should transform hash value' 

    it 'should transform hash value with keys that are symbols' 

    it 'should transform array value' 

    it 'should transform boolean values' 

  end

  context '#values_to_query' do
    it 'converts values to a query string' 


    it 'converts values with missing keys to a query string' 


    it 'converts values with nil keys to a query string' 

  end

  it 'converts array values, vice versa' 


  it 'converts hash values, vice versa' 


  it 'converts complex nested hashes, vice versa' 


  it 'converts complex nested array of hashes, vice versa' 

end

