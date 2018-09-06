require 'rails_helper'

RSpec.describe FeeThreshold do
  context '#band' do
    context 'when nil is supplied' do
      it 'returns nil' 

    end

    it 'returns a amount' 


    context 'when fee < 1000' do
      it 'returns 3000' 


      context 'when the fee includes pence' do
        it 'returns 3000' 

      end
    end

    context 'the pence push the fee up a band' do
      it 'returns 4000' 

    end

    described_class::FEE_BANDS.each do |band|
      context "when amount is between #{band[:lower]} and #{band[:upper]}" do
        let(:fee) { band[:lower] + 5 }

        it "returns #{band[:amount]}" 

      end

      context 'when the fee is a float' do
        context 'and it adds 50 pence to the upper band' do
          let(:fee) { band[:upper].to_f + 0.50 }

          it "returns amount that is higher than #{band[:amount]}" 

        end
      end
    end

    context 'when fee > 7000' do
      context 'when the fee is just over 7000' do
        it 'returns 16000' 

      end

      context 'when the fee is in pence' do
        it 'returns 16000' 

      end
    end
  end
end

