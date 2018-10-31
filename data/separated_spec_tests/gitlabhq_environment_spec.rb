require 'spec_helper'

describe Gitlab::Ci::Config::Entry::Environment do
  let(:entry) { described_class.new(config) }

  before do
    entry.compose!
  end

  context 'when configuration is a string' do
    let(:config) { 'production' }

    describe '#string?' do
      it 'is string configuration' 

    end

    describe '#hash?' do
      it 'is not hash configuration' 

    end

    describe '#valid?' do
      it 'is valid' 

    end

    describe '#value' do
      it 'returns valid hash' 

    end

    describe '#name' do
      it 'returns environment name' 

    end

    describe '#url' do
      it 'returns environment url' 

    end
  end

  context 'when configuration is a hash' do
    let(:config) do
      { name: 'development', url: 'https://example.gitlab.com' }
    end

    describe '#string?' do
      it 'is not string configuration' 

    end

    describe '#hash?' do
      it 'is hash configuration' 

    end

    describe '#valid?' do
      it 'is valid' 

    end

    describe '#value' do
      it 'returns valid hash' 

    end

    describe '#name' do
      it 'returns environment name' 

    end

    describe '#url' do
      it 'returns environment url' 

    end
  end

  context 'when valid action is used' do
    let(:config) do
      { name: 'production',
        action: 'start' }
    end

    it 'is valid' 

  end

  context 'when invalid action is used' do
    let(:config) do
      { name: 'production',
        action: 'invalid' }
    end

    describe '#valid?' do
      it 'is not valid' 

    end

    describe '#errors' do
      it 'contains error about invalid action' 

    end
  end

  context 'when on_stop is used' do
    let(:config) do
      { name: 'production',
        on_stop: 'close_app' }
    end

    it 'is valid' 

  end

  context 'when invalid on_stop is used' do
    let(:config) do
      { name: 'production',
        on_stop: false }
    end

    describe '#valid?' do
      it 'is not valid' 

    end

    describe '#errors' do
      it 'contains error about invalid action' 

    end
  end

  context 'when variables are used for environment' do
    let(:config) do
      { name: 'review/$CI_COMMIT_REF_NAME',
        url: 'https://$CI_COMMIT_REF_NAME.review.gitlab.com' }
    end

    describe '#valid?' do
      it 'is valid' 

    end
  end

  context 'when configuration is invalid' do
    context 'when configuration is an array' do
      let(:config) { ['env'] }

      describe '#valid?' do
        it 'is not valid' 

      end

      describe '#errors' do
        it 'contains error about invalid type' 

      end
    end

    context 'when environment name is not present' do
      let(:config) { { url: 'https://example.gitlab.com' } }

      describe '#valid?' do
        it 'is not valid' 

      end

      describe '#errors?' do
        it 'contains error about missing environment name' 

      end
    end
  end
end

