require 'spec_helper'

describe Gitlab::ImportExport::HashUtil do
  let(:stringified_array) { [{ 'test' => 1 }] }
  let(:stringified_array_with_date) { [{ 'test_date' => '2016-04-06 06:17:44 +0200' }] }

  describe '.deep_symbolize_array!' do
    it 'symbolizes keys' 

  end

  describe '.deep_symbolize_array_with_date!' do
    it 'symbolizes keys' 


    it 'transforms date strings into Time objects' 

  end
end

