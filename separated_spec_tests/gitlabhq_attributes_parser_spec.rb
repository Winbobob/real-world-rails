require 'spec_helper'

describe Gitlab::Git::AttributesParser, seed_helper: true do
  let(:attributes_path) { File.join(SEED_STORAGE_PATH, 'with-git-attributes.git', 'info', 'attributes') }
  let(:data) { File.read(attributes_path) }

  subject { described_class.new(data) }

  describe '#attributes' do
    context 'using a path with attributes' do
      it 'returns the attributes as a Hash' 


      it 'returns a Hash containing multiple attributes' 


      it 'returns a Hash containing attributes for a file with multiple extensions' 


      it 'returns a Hash containing attributes for a file in a directory' 


      it 'returns a Hash containing attributes with query string parameters' 


      it 'returns a Hash containing the attributes for an absolute path' 


      it 'returns a Hash containing the attributes when a pattern is defined using an absolute path' 


      it 'returns an empty Hash for a defined path without attributes' 


      context 'when the "binary" option is set for a path' do
        it 'returns true for the "binary" option' 


        it 'returns false for the "diff" option' 

      end
    end

    context 'using a path without any attributes' do
      it 'returns an empty Hash' 

    end

    context 'when attributes data is nil' do
      let(:data) { nil }

      it 'returns an empty Hash' 

    end
  end

  describe '#patterns' do
    it 'parses a file with entries' 


    it 'parses an entry that uses a tab to separate the pattern and attributes' 


    it 'stores patterns in reverse order' 


    # It's a bit hard to test for something _not_ being processed. As such we'll
    # just test the number of entries.
    it 'ignores any comments and empty lines' 

  end

  describe '#parse_attributes' do
    it 'parses a boolean attribute' 


    it 'parses a negated boolean attribute' 


    it 'parses a key-value pair' 


    it 'parses multiple attributes' 


    it 'parses attributes with query string parameters' 

  end

  describe '#each_line' do
    it 'iterates over every line in the attributes file' 


    it 'does not yield when the attributes file has an unsupported encoding' 

  end
end

