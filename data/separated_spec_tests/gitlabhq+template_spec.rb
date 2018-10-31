require 'spec_helper'

describe Gitlab::Badge::Coverage::Template do
  let(:badge) { double(entity: 'coverage', status: 90.00) }
  let(:template) { described_class.new(badge) }

  describe '#key_text' do
    it 'is always says coverage' 

  end

  describe '#value_text' do
    context 'when coverage is known' do
      it 'returns coverage percentage' 

    end

    context 'when coverage is known to many digits' do
      before do
        allow(badge).to receive(:status).and_return(92.349)
      end

      it 'returns rounded coverage percentage' 

    end

    context 'when coverage is unknown' do
      before do
        allow(badge).to receive(:status).and_return(nil)
      end

      it 'returns string that says coverage is unknown' 

    end
  end

  describe '#key_width' do
    it 'has a fixed key width' 

  end

  describe '#value_width' do
    context 'when coverage is known' do
      it 'is narrower when coverage is known' 

    end

    context 'when coverage is unknown' do
      before do
        allow(badge).to receive(:status).and_return(nil)
      end

      it 'is wider when coverage is unknown to fit text' 

    end
  end

  describe '#key_color' do
    it 'always has the same color' 

  end

  describe '#value_color' do
    context 'when coverage is good' do
      before do
        allow(badge).to receive(:status).and_return(98)
      end

      it 'is green' 

    end

    context 'when coverage is acceptable' do
      before do
        allow(badge).to receive(:status).and_return(90)
      end

      it 'is green-orange' 

    end

    context 'when coverage is medium' do
      before do
        allow(badge).to receive(:status).and_return(75)
      end

      it 'is orange-yellow' 

    end

    context 'when coverage is low' do
      before do
        allow(badge).to receive(:status).and_return(50)
      end

      it 'is red' 

    end

    context 'when coverage is unknown' do
      before do
        allow(badge).to receive(:status).and_return(nil)
      end

      it 'is grey' 

    end
  end

  describe '#width' do
    context 'when coverage is known' do
      it 'returns the key width plus value width' 

    end

    context 'when coverage is unknown' do
      before do
        allow(badge).to receive(:status).and_return(nil)
      end

      it 'returns key width plus wider value width' 

    end
  end
end

