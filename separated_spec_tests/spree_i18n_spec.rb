require 'rspec/expectations'
require 'spree/i18n'
require 'spree/testing_support/i18n'

describe 'i18n' do
  before do
    I18n.backend.store_translations(:en,
                                                                          spree: {
                                                                            foo: 'bar',
                                                                            bar: {
                                                                              foo: 'bar within bar scope',
                                                                              invalid: nil,
                                                                              legacy_translation: 'back in the day...'
                                                                            },
                                                                            invalid: nil,
                                                                            legacy_translation: 'back in the day...'
                                                                          })
  end

  it 'translates within the spree scope' 


  it 'translates within the spree scope using a path' 


  it 'raise error without any context when using a path' 


  it 'prepends a string scope' 


  it 'prepends to an array scope' 


  it 'returns two translations' 


  it 'returns reasonable string for missing translations' 


  context 'missed + unused translations' do
    def key_with_locale(key)
      "#{key} (#{I18n.locale})"
    end

    before do
      Spree.used_translations = []
    end

    context 'missed translations' do
      def assert_missing_translation(key)
        key = key_with_locale(key)
        message = Spree.missing_translation_messages.detect { |m| m == key }
        expect(message).not_to(be_nil, "expected '#{key}' to be missing, but it wasn't.")
      end

      it 'logs missing translations' 


      it 'does not log present translations' 


      it 'does not break when asked for multiple translations' 

    end

    context 'unused translations' do
      def assert_unused_translation(key)
        key = key_with_locale(key)
        message = Spree.unused_translation_messages.detect { |m| m == key }
        expect(message).not_to(be_nil, "expected '#{key}' to be unused, but it was used.")
      end

      def assert_used_translation(key)
        key = key_with_locale(key)
        message = Spree.unused_translation_messages.detect { |m| m == key }
        expect(message).to(be_nil, "expected '#{key}' to be used, but it wasn't.")
      end

      it "logs translations that aren't used" 


      it 'does not log used translations' 

    end
  end
end

