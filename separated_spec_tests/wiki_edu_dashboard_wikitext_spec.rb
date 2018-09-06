# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/lib/wikitext"

describe Wikitext do
  let(:subject) { described_class }

  describe '.markdown_to_mediawiki' do
    it 'should return a wikitext formatted version of the markdown input' 

  end

  describe '.replace_code_with_nowiki' do
    it 'should convert code formatting syntax from html to wikitext' 


    it 'should not return nil if there are no code snippet' 

  end

  describe '.replace_at_sign_with_template' do
    it 'should reformat email addresses' 

  end

  describe '.substitute_bad_links' do
    it 'should find links and munge them into readable non-urls' 

  end

  describe '.titles_to_wikilinks' do
    it 'converts an array of titles into wikilink format' 

  end
end

