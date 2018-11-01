require 'fast_spec_helper'

describe Gitlab::Ci::Config::Extendable::Entry do
  describe '.new' do
    context 'when entry key is not included in the context hash' do
      it 'raises error' 

    end
  end

  describe '#value' do
    it 'reads a hash value from the context' 

  end

  describe '#extensible?' do
    context 'when entry has inheritance defined' do
      it 'is extensible' 

    end

    context 'when entry does not have inheritance specified' do
      it 'is not extensible' 

    end

    context 'when entry value is not a hash' do
      it 'is not extensible' 

    end
  end

  describe '#extends_key' do
    context 'when entry is extensible' do
      it 'returns symbolized extends key value' 

    end

    context 'when entry is not extensible' do
      it 'returns nil' 

    end
  end

  describe '#ancestors' do
    let(:parent) do
      described_class.new(:test, test: { extends: 'something' })
    end

    let(:child) do
      described_class.new(:job, { job: { script: 'something' } }, parent)
    end

    it 'returns ancestors keys' 

  end

  describe '#base_hash!' do
    subject { described_class.new(:test, hash) }

    context 'when base hash is not extensible' do
      let(:hash) do
        {
          template: { script: 'rspec' },
          test: { extends: 'template' }
        }
      end

      it 'returns unchanged base hash' 

    end

    context 'when base hash is extensible too' do
      let(:hash) do
        {
          first: { script: 'rspec' },
          second: { extends: 'first' },
          test: { extends: 'second' }
        }
      end

      it 'extends the base hash first' 


      it 'mutates original context' 

    end
  end

  describe '#extend!' do
    subject { described_class.new(:test, hash) }

    context 'when extending a non-hash value' do
      let(:hash) do
        {
          first: 'my value',
          test: { extends: 'first' }
        }
      end

      it 'raises an error' 

    end

    context 'when extending unknown key' do
      let(:hash) do
        { test: { extends: 'something' } }
      end

      it 'raises an error' 

    end

    context 'when extending a hash correctly' do
      let(:hash) do
        {
          first: { script: 'my value' },
          second: { extends: 'first' },
          test: { extends: 'second' }
        }
      end

      let(:result) do
        {
          first: { script: 'my value' },
          second: { extends: 'first', script: 'my value' },
          test: { extends: 'second', script: 'my value' }
        }
      end

      it 'returns extended part of the hash' 


      it 'mutates original context' 

    end

    context 'when hash is not extensible' do
      let(:hash) do
        {
          first: { script: 'my value' },
          second: { extends: 'first' },
          test: { value: 'something' }
        }
      end

      it 'returns original key value' 


      it 'does not mutate orignal context' 

    end

    context 'when circular depenency gets detected' do
      let(:hash) do
        { test: { extends: 'test' } }
      end

      it 'raises an error' 

    end

    context 'when nesting level is too deep' do
      before do
        stub_const("#{described_class}::MAX_NESTING_LEVELS", 0)
      end

      let(:hash) do
        {
          first: { script: 'my value' },
          second: { extends: 'first' },
          test: { extends: 'second' }
        }
      end

      it 'raises an error' 

    end
  end
end

