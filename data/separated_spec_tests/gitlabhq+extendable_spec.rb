require 'fast_spec_helper'

describe Gitlab::Ci::Config::Extendable do
  subject { described_class.new(hash) }

  describe '#each' do
    context 'when there is extendable entry in the hash' do
      let(:test) do
        { extends: 'something', only: %w[master] }
      end

      let(:hash) do
        { something: { script: 'ls' }, test: test }
      end

      it 'yields control' 

    end
  end

  describe '#to_hash' do
    context 'when hash does not contain extensions' do
      let(:hash) do
        {
          test: { script: 'test' },
          production: {
            script: 'deploy',
            only: { variables: %w[$SOMETHING] }
          }
        }
      end

      it 'does not modify the hash' 

    end

    context 'when hash has a single simple extension' do
      let(:hash) do
        {
          something: {
            script: 'deploy',
            only: { variables: %w[$SOMETHING] }
          },

          test: {
            extends: 'something',
            script: 'ls',
            only: { refs: %w[master] }
          }
        }
      end

      it 'extends a hash with a deep reverse merge' 

    end

    context 'when a hash uses recursive extensions' do
      let(:hash) do
        {
          test: {
            extends: 'something',
            script: 'ls',
            only: { refs: %w[master] }
          },

          build: {
            extends: 'something',
            stage: 'build'
          },

          deploy: {
            stage: 'deploy',
            extends: '.first'
          },

          something: {
            extends: '.first',
            script: 'exec',
            only: { variables: %w[$SOMETHING] }
          },

          '.first': {
            script: 'run',
            only: { kubernetes: 'active' }
          }
        }
      end

      it 'extends a hash with a deep reverse merge' 

    end

    context 'when nested circular dependecy has been detected' do
      let(:hash) do
        {
          test: {
            extends: 'something',
            script: 'ls',
            only: { refs: %w[master] }
          },

          something: {
            extends: '.first',
            script: 'deploy',
            only: { variables: %w[$SOMETHING] }
          },

          '.first': {
            extends: 'something',
            script: 'run',
            only: { kubernetes: 'active' }
          }
        }
      end

      it 'raises an error about circular dependency' 

    end

    context 'when circular dependecy to self has been detected' do
      let(:hash) do
        {
          test: {
            extends: 'test',
            script: 'ls',
            only: { refs: %w[master] }
          }
        }
      end

      it 'raises an error about circular dependency' 

    end

    context 'when invalid extends value is specified' do
      let(:hash) do
        { something: { extends: 1, script: 'ls' } }
      end

      it 'raises an error about invalid extension' 

    end

    context 'when extensible entry has non-hash inheritance defined' do
      let(:hash) do
        {
          test: {
            extends: 'something',
            script: 'ls',
            only: { refs: %w[master] }
          },

          something: 'some text'
        }
      end

      it 'raises an error about invalid base' 

    end
  end
end

