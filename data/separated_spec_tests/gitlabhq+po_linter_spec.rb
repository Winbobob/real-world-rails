require 'spec_helper'
require 'simple_po_parser'

# Disabling this cop to allow for multi-language examples in comments
# rubocop:disable Style/AsciiComments
describe Gitlab::I18n::PoLinter do
  let(:linter) { described_class.new(po_path) }
  let(:po_path) { 'spec/fixtures/valid.po' }

  def fake_translation(msgid:, translation:, plural_id: nil, plurals: [])
    data = { msgid: msgid, msgid_plural: plural_id }

    if plural_id
      [translation, *plurals].each_with_index do |plural, index|
        allow(FastGettext::Translation).to receive(:n_).with(msgid, plural_id, index).and_return(plural)
        data.merge!("msgstr[#{index}]" => plural)
      end
    else
      allow(FastGettext::Translation).to receive(:_).with(msgid).and_return(translation)
      data[:msgstr] = translation
    end

    Gitlab::I18n::TranslationEntry.new(
      data,
      plurals.size + 1
    )
  end

  describe '#errors' do
    it 'only calls validation once' 

  end

  describe '#validate_po' do
    subject(:errors) { linter.validate_po }

    context 'for a fuzzy message' do
      let(:po_path) { 'spec/fixtures/fuzzy.po' }

      it 'has an error' 

    end

    context 'for a translations with newlines' do
      let(:po_path) { 'spec/fixtures/newlines.po' }

      it 'has an error for a normal string' 


      it 'has an error when a translation is defined over multiple lines' 


      it 'raises an error when a plural translation is defined over multiple lines' 


      it 'raises an error when the plural id is defined over multiple lines' 

    end

    context 'with an invalid po' do
      let(:po_path) { 'spec/fixtures/invalid.po' }

      it 'returns the error' 


      it 'does not validate entries' 

    end

    context 'with missing metadata' do
      let(:po_path) { 'spec/fixtures/missing_metadata.po' }

      it 'returns the an error' 

    end

    context 'with a valid po' do
      it 'parses the file' 


      it 'validates the entries' 


      it 'has no errors' 

    end

    context 'with missing plurals' do
      let(:po_path) { 'spec/fixtures/missing_plurals.po' }

      it 'has errors' 

    end

    context 'with multiple plurals' do
      let(:po_path) { 'spec/fixtures/multiple_plurals.po' }

      it 'has errors' 

    end

    context 'with unescaped chars' do
      let(:po_path) { 'spec/fixtures/unescaped_chars.po' }

      it 'contains an error' 

    end
  end

  describe '#parse_po' do
    context 'with a valid po' do
      it 'fills in the entries' 


      it 'does not have errors' 

    end

    context 'with an invalid po' do
      let(:po_path) { 'spec/fixtures/invalid.po' }

      it 'contains an error' 


      it 'sets the entries to an empty array' 

    end
  end

  describe '#validate_entries' do
    it 'keeps track of errors for entries' 

  end

  describe '#validate_entry' do
    it 'validates the flags, variable usage, newlines, and unescaped chars' 

  end

  describe '#validate_number_of_plurals' do
    it 'validates when there are an incorrect number of translations' 

  end

  describe '#validate_variables' do
    before do
      allow(linter).to receive(:validate_variables_in_message).and_call_original
    end

    it 'validates both singular and plural in a pluralized string when the entry has a singular' 


    it 'only validates plural when there is no separate singular' 


    it 'validates the message variables' 


    it 'validates variable usage in message ids' 

  end

  describe '#validate_variables_in_message' do
    it 'detects when a variables are used incorrectly' 


    it 'does not allow combining 1 `%d` unnamed variable with named variables' 

  end

  describe '#validate_translation' do
    let(:entry) { fake_translation(msgid: 'Hello %{world}', translation: 'Bonjour %{world}') }

    it 'succeeds with valid variables' 


    it 'adds an error message when translating fails' 


    it 'adds an error message when translating fails when translating with context' 


    it "adds an error when trying to translate with incorrect variables when using unnamed variables" 


    it "adds an error when trying to translate with named variables when unnamed variables are expected" 


    it 'tests translation for all given forms' 

  end

  describe '#numbers_covering_all_plurals' do
    it 'can correctly find all required numbers to translate to Polish' 

  end

  describe '#fill_in_variables' do
    it 'builds an array for %d translations' 


    it 'builds an array for %s translations' 


    it 'builds a hash for named variables' 

  end
end
# rubocop:enable Style/AsciiComments

