# coding: utf-8
require 'spec_helper'

describe Gitlab::Git::Conflict::File do
  let(:conflict) { { theirs: { path: 'foo', mode: 33188 }, ours: { path: 'foo', mode: 33188 } } }
  let(:invalid_content) { described_class.new(nil, nil, conflict, "a\xC4\xFC".force_encoding(Encoding::ASCII_8BIT)) }
  let(:valid_content) { described_class.new(nil, nil, conflict, "Espa\xC3\xB1a".force_encoding(Encoding::ASCII_8BIT)) }

  describe '#lines' do
    context 'when the content contains non-UTF-8 characters' do
      it 'raises UnsupportedEncoding' 

    end

    context 'when the content can be converted to UTF-8' do
      it 'sets lines to the lines' 


      it 'sets the type to text' 

    end
  end

  describe '#content' do
    context 'when the content contains non-UTF-8 characters' do
      it 'raises UnsupportedEncoding' 

    end

    context 'when the content can be converted to UTF-8' do
      it 'returns a valid UTF-8 string' 

    end
  end
end

