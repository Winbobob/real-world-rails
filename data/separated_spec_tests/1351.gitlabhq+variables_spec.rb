require 'spec_helper'

describe Gitlab::Ci::Config::Entry::Variables do
  let(:entry) { described_class.new(config) }

  describe 'validations' do
    context 'when entry config value is correct' do
      let(:config) do
        { 'VARIABLE_1' => 'value 1', 'VARIABLE_2' => 'value 2' }
      end

      describe '#value' do
        it 'returns hash with key value strings' 


        context 'with numeric keys and values in the config' do
          let(:config) { { 10 => 20 } }

          it 'converts numeric key and numeric value into strings' 

        end
      end

      describe '#errors' do
        it 'does not append errors' 

      end

      describe '#valid?' do
        it 'is valid' 

      end
    end

    context 'when entry value is not correct' do
      let(:config) { [:VAR, 'test'] }

      describe '#errors' do
        it 'saves errors' 

      end

      describe '#valid?' do
        it 'is not valid' 

      end
    end
  end
end

