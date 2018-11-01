require 'turnip/placeholder'

describe Turnip::Placeholder do
  describe '.resolve' do
    before do
      described_class.add(:test) do
        match(/foo/)
        match(/\d/)
      end
    end

    it 'returns a regexp for the given placeholder' 


    it 'fall through to using the standard placeholder regexp' 

  end

  describe '.apply' do
    it 'recognize multiple placeholders and return block value' 

  end

  describe '#apply' do
    it 'extracts a captured expression and passes to the block' 


    it 'extracts any captured expressions and passes to the block' 


    it 'extracts captures by default placeholder and passes to the block' 

  end

  describe '#regexp' do
    context 'placeholder has a matcher' do
      let :placeholder do
        described_class.new(:test) do
          match(/foo/)
        end
      end

      it 'should match a given fragment' 


      it 'should not match an incorrect fragment' 

    end

    context 'placeholder has multiple matchers' do
      let :placeholder do
        described_class.new(:test) do
          match(/foo/)
          match(/\d/)
        end
      end

      it 'should match multiple fragments' 


      it 'should not multiple incorrect fragments' 

    end
  end
end

