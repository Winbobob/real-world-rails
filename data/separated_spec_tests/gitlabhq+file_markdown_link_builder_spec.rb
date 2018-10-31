# frozen_string_literal: true
require 'rails_helper'

describe Gitlab::FileMarkdownLinkBuilder do
  let(:custom_class) do
    Class.new do
      include Gitlab::FileMarkdownLinkBuilder
    end.new
  end

  before do
    allow(custom_class).to receive(:filename).and_return(filename)
  end

  describe 'markdown_link' do
    let(:url) { "/uploads/#{filename}"}

    before do
      allow(custom_class).to receive(:secure_url).and_return(url)
    end

    context 'when file name has the character ]' do
      let(:filename) { 'd]k.png' }

      it 'escapes the character' 

    end

    context 'when file is an image or video' do
      let(:filename) { 'dk.png' }

      it 'returns preview markdown link' 

    end

    context 'when file is not an image or video' do
      let(:filename) { 'dk.zip' }

      it 'returns markdown link' 

    end

    context 'when file name is blank' do
      let(:filename) { nil }

      it 'returns nil' 

    end
  end

  describe 'mardown_name' do
    context 'when file is an image or video' do
      let(:filename) { 'dk.png' }

      it 'retrieves the name without the extension' 

    end

    context 'when file is not an image or video' do
      let(:filename) { 'dk.zip' }

      it 'retrieves the name with the extesion' 

    end

    context 'when file name is blank' do
      let(:filename) { nil }

      it 'returns nil' 

    end
  end
end

