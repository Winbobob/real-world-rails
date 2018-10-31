require 'spec_helper'

describe Gitlab::Ci::Config::Loader do
  let(:loader) { described_class.new(yml) }

  context 'when yaml syntax is correct' do
    let(:yml) { 'image: ruby:2.2' }

    describe '#valid?' do
      it 'returns true' 

    end

    describe '#load!' do
      it 'returns a valid hash' 

    end
  end

  context 'when yaml syntax is incorrect' do
    let(:yml) { '// incorrect' }

    describe '#valid?' do
      it 'returns false' 

    end

    describe '#load!' do
      it 'raises error' 

    end
  end

  context 'when there is an unknown alias' do
    let(:yml) { 'steps: *bad_alias' }

    describe '#initialize' do
      it 'raises FormatError' 

    end
  end

  context 'when yaml config is empty' do
    let(:yml) { '' }

    describe '#valid?' do
      it 'returns false' 

    end
  end
end

