# frozen_string_literal: true

require 'spec_helper'

describe Gitlab::BlobHelper do
  include FakeBlobHelpers

  let(:project) { create(:project) }
  let(:blob) { fake_blob(path: 'file.txt') }
  let(:large_blob) { fake_blob(path: 'test.pdf', size: 2.megabytes, binary: true) }

  describe '#extname' do
    it 'returns the extension' 

  end

  describe '#known_extension?' do
    it 'returns true' 

  end

  describe '#viewable' do
    it 'returns true' 


    it 'returns false' 

  end

  describe '#large?' do
    it 'returns false' 


    it 'returns true' 

  end

  describe '#binary?' do
    it 'returns true' 


    it 'returns false' 

  end

  describe '#text?' do
    it 'returns true' 


    it 'returns false' 

  end

  describe '#image?' do
    it 'returns false' 

  end

  describe '#mime_type' do
    it 'returns text/plain' 


    it 'returns application/pdf' 

  end

  describe '#binary_mime_type?' do
    it 'returns false' 

  end

  describe '#lines' do
    it 'returns the payload in an Array' 

  end

  describe '#content_type' do
    it 'returns text/plain' 


    it 'returns text/plain' 

  end

  describe '#encoded_newlines_re' do
    it 'returns a regular expression' 

  end

  describe '#ruby_encoding' do
    it 'returns UTF-8' 

  end

  describe '#encoding' do
    it 'returns UTF-8' 

  end

  describe '#empty?' do
    it 'returns false' 

  end
end

