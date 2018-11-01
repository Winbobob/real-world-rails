# encoding: utf-8

require 'rails_helper'
require 'slug'

describe Slug do

  describe '#for' do
    let(:default_slug) { 'topic' }

    let(:very_long_string) do
      '内容似乎不清晰，这是个完整的句子吗？内容似乎不清晰，这是个完整的句子吗？' * 10
    end

    it 'returns topic by default' 


    it 'accepts fallback' 


    it 'replaces the underscore' 


    it 'strips emoji string' 


    context 'ascii generator' do
      before { SiteSetting.slug_generation_method = 'ascii' }

      it 'generates the slug' 


      it 'generates default slug when nothing' 


      it "doesn't generate slugs that are just numbers" 


      it "fallbacks to empty string if it's too long" 

    end

    context 'encoded generator' do
      before { SiteSetting.slug_generation_method = 'encoded' }
      after { SiteSetting.slug_generation_method = 'ascii' }

      it 'generates the slug' 


      it 'generates default slug when nothing' 


      it "doesn't generate slugs that are just numbers" 


      it "handles the special characters" 


      it "kills the trailing dash" 

    end

    context 'none generator' do
      before { SiteSetting.slug_generation_method = 'none' }
      after { SiteSetting.slug_generation_method = 'ascii' }

      it 'generates the slug' 

    end
  end

  describe '#ascii_generator' do
    before { SiteSetting.slug_generation_method = 'ascii' }

    it 'replaces spaces with hyphens' 


    it 'changes accented characters' 


    it 'replaces symbols' 


    it 'handles a.b.c properly' 


    it 'handles double dots right' 


    it 'strips trailing punctuation' 


    it 'strips leading punctuation' 


    it 'handles our initial transliteration' 


    it "doesn't keep single quotes within word" 


    it 'generates null when nothing' 


    it "keeps number unchanged" 

  end

  describe '#encoded_generator' do
    before { SiteSetting.slug_generation_method = 'encoded' }
    after { SiteSetting.slug_generation_method = 'ascii' }

    it 'generates precentage encoded string' 


    it 'reject RFC 3986 reserved character and blank' 


    it 'generates null when nothing' 


    it "keeps number unchanged" 


    it 'downcase the string' 

  end

  describe '#none_generator' do
    before { SiteSetting.slug_generation_method = 'none' }
    after { SiteSetting.slug_generation_method = 'ascii' }

    it 'generates nothing' 

  end
end

