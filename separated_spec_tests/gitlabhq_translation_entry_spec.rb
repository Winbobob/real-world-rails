require 'spec_helper'

describe Gitlab::I18n::TranslationEntry do
  describe '#singular_translation' do
    it 'returns the normal `msgstr` for translations without plural' 


    it 'returns the first string for entries with plurals' 

  end

  describe '#all_translations' do
    it 'returns all translations for singular translations' 


    it 'returns all translations when including plural translations' 

  end

  describe '#plural_translations' do
    it 'returns all translations if there is only one plural' 


    it 'returns all translations except for the first one if there are multiple' 

  end

  describe '#has_singular_translation?' do
    it 'has a singular when the translation is not pluralized' 


    it 'has a singular when plural and singular are separately defined' 


    it 'does not have a separate singular if the plural string only has one translation' 

  end

  describe '#msgid_contains_newlines' do
    it 'is true when the msgid is an array' 

  end

  describe '#plural_id_contains_newlines' do
    it 'is true when the msgid is an array' 

  end

  describe '#translations_contain_newlines' do
    it 'is true when the msgid is an array' 

  end

  describe '#contains_unescaped_chars' do
    let(:data) { { msgid: '' } }
    let(:entry) { described_class.new(data, 2) }
    it 'is true when the msgid is an array' 


    it 'is false when the `%` char is escaped' 


    it 'is false when using an unnamed variable' 


    it 'is false when using a named variable' 


    it 'is true when an unnamed variable is not closed' 


    it 'is true when the string starts with a `%`' 

  end

  describe '#msgid_contains_unescaped_chars' do
    it 'is true when the msgid contains a `%`' 

  end

  describe '#plural_id_contains_unescaped_chars' do
    it 'is true when the plural msgid contains a `%`' 

  end

  describe '#translations_contain_unescaped_chars' do
    it 'is true when the translation contains a `%`' 

  end
end

