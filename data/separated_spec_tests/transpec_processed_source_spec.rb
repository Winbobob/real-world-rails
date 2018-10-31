# coding: utf-8

require 'spec_helper'
require 'transpec/processed_source'

module Transpec
  describe ProcessedSource do
    describe '.parse_file' do
      include FileHelper
      include_context 'isolated environment'

      let(:spec_path) { 'spec/example_spec.rb' }

      before do
        create_file(spec_path, "puts 'foo'")
      end

      it 'parses the file and returns processed source' 

    end

    subject(:processed_source) { ProcessedSource.new(source) }

    describe '#ast' do
      let(:source) { "puts 'foo'" }

      it 'returns the root node of AST' 

    end

    describe '#path' do
      let(:source) { "puts 'foo'" }

      context 'when a file path is passed to .new' do
        subject(:processed_source) { ProcessedSource.new(source, '/path/to/file') }

        it 'returns the path' 

      end

      context 'when no file path is passed to .new' do
        it 'returns nil' 

      end
    end

    describe '#syntax_error' do
      context 'when the source is valid' do
        let(:source) { "puts 'foo'" }

        it 'returns nil' 

      end

      context 'when the source is invalid' do
        let(:source) { '<' }

        it 'returns syntax error' 

      end

      context 'when the source includes invalid byte sequence for the encoding' do
        it 'returns encoding error' 

      end
    end

    describe '#to_s' do
      it 'returns the original source' 

    end
  end
end

