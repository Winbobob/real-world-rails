require 'spec_helper'

describe Fabrication::Generator::DataMapper, depends_on: :data_mapper do
  describe '.supports?' do
    subject { Fabrication::Generator::DataMapper }

    it 'returns true for datamapper objects' 


    it 'returns false for non-datamapper objects objects' 

  end
end

