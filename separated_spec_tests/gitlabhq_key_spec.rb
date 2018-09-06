require 'spec_helper'

describe Gitlab::Ci::Config::Entry::Key do
  let(:entry) { described_class.new(config) }

  describe 'validations' do
    shared_examples 'key with slash' do
      it 'is invalid' 


      it 'reports errors with config value' 

    end

    shared_examples 'key with only dots' do
      it 'is invalid' 


      it 'reports errors with config value' 

    end

    context 'when entry config value is correct' do
      let(:config) { 'test' }

      describe '#value' do
        it 'returns key value' 

      end

      describe '#valid?' do
        it 'is valid' 

      end
    end

    context 'when entry value is not correct' do
      let(:config) { ['incorrect'] }

      describe '#errors' do
        it 'saves errors' 

      end
    end

    context 'when entry value contains slash' do
      let(:config) { 'key/with/some/slashes' }

      it_behaves_like 'key with slash'
    end

    context 'when entry value contains URI encoded slash (%2F)' do
      let(:config) { 'key%2Fwith%2Fsome%2Fslashes' }

      it_behaves_like 'key with slash'
    end

    context 'when entry value is a dot' do
      let(:config) { '.' }

      it_behaves_like 'key with only dots'
    end

    context 'when entry value is two dots' do
      let(:config) { '..' }

      it_behaves_like 'key with only dots'
    end

    context 'when entry value is a URI encoded dot (%2E)' do
      let(:config) { '%2e' }

      it_behaves_like 'key with only dots'
    end

    context 'when entry value is two URI encoded dots (%2E)' do
      let(:config) { '%2E%2e' }

      it_behaves_like 'key with only dots'
    end

    context 'when entry value is one dot and one URI encoded dot' do
      let(:config) { '.%2e' }

      it_behaves_like 'key with only dots'
    end
  end

  describe '.default' do
    it 'returns default key' 

  end
end

