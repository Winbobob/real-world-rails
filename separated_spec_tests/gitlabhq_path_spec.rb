require 'spec_helper'

describe Gitlab::Ci::Build::Artifacts::Path do
  describe '#valid?' do
    context 'when path contains a zero character' do
      it 'is not valid' 

    end

    context 'when path is not utf8 string' do
      it 'is not valid' 

    end

    context 'when path is valid' do
      it 'is valid' 

    end
  end

  describe '#directory?' do
    context 'when path ends with a directory indicator' do
      it 'is a directory' 

    end

    context 'when path does not end with a directory indicator' do
      it 'is not a directory' 

    end
  end

  describe '#name' do
    it 'returns a base name' 

  end

  describe '#nodes' do
    it 'returns number of path nodes' 

  end

  describe '#to_s' do
    context 'when path is valid' do
      it 'returns a string representation of a path' 

    end

    context 'when path is invalid' do
      it 'raises an error' 

    end
  end
end

