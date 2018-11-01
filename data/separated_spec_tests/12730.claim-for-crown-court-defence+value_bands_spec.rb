require 'rails_helper'

module Claims

  describe ValueBands do

    describe '.band_id_for_claim' do
      context 'with VAT' do
        it 'returns band 10' 


        it 'returns band 20' 


        it 'returns band 30' 


        it 'returns band 40' 


        it 'raises if over maximum limit' 

      end

      context 'without VAT' do
        it 'returns band 10' 


        it 'returns band 20' 


        it 'returns band 30' 


        it 'returns band 40' 

      end
    end

    describe '.band_by_id' do
      it 'returns the ValueBandDefinition struct for the given id' 

    end

    describe '.bands' do
      it 'returns an array of bands in ascending order' 

    end

    describe '.band_ids' do
      it 'returns a list of band ids' 

    end

    describe '.collection_select' do
      it 'returns an array of Bands including a dummy on for all bands' 

    end

  end
end

