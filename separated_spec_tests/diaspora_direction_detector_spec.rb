# coding: utf-8
# frozen_string_literal: true

# Copyright (c) 2010-2011, Diaspora Inc.  This file is
# licensed under the Affero General Public License version 3 or later.  See
# the COPYRIGHT file.

describe String do
  let(:english) { "Hello World" }
  let(:chinese) { "你好世界" }
  let(:arabic) { "مرحبا العالم" }
  let(:hebrew) { "שלום העולם" }
  let(:english_chinese) { "#{english} #{chinese}" }
  let(:english_arabic) { "#{english} #{chinese}" }
  let(:english_hebrew) { "#{english} #{chinese}" }
  let(:chinese_english) { "#{chinese} #{english}" }
  let(:chinese_arabic) { "#{chinese} #{arabic}" }
  let(:chinese_hebrew) { "#{chinese} #{hebrew}" }
  let(:arabic_english) { "#{arabic} #{english}" }
  let(:arabic_chinese) { "#{arabic} #{chinese}" }
  let(:arabic_hebrew) { "#{arabic} #{hebrew}" }
  let(:hebrew_english) { "#{hebrew} #{english}" }
  let(:hebrew_chinese) { "#{hebrew} #{chinese}" }
  let(:hebrew_arabic) { "#{hebrew} #{arabic}" }


  describe "#is_rtl?" do
    it 'returns true or false correctly' 


    it 'respects all words' 


    it 'ignores whitespaces' 


    it "ignores byte order marks" 

  end

  describe '#cleaned_is_rtl?' do
    it 'should clean the string' 

  end
end

