require 'spec_helper'

describe Spree::LocalizedNumber do
  context '.parse' do
    before do
      I18n.enforce_available_locales = false
      I18n.locale = I18n.default_locale
      I18n.backend.store_translations(:de, number: { currency: { format: { delimiter: '.', separator: ',' } } })
    end

    after do
      I18n.locale = I18n.default_locale
      I18n.enforce_available_locales = true
    end

    context 'with decimal point' do
      it 'captures the proper amount for a formatted price' 

    end

    context 'with decimal comma' do
      it 'captures the proper amount for a formatted price' 

    end

    context 'with a numeric price' do
      it 'uses the price as is' 

    end

    context 'string argument' do
      it 'is not modified' 

    end

    context 'with empty string' do
      it 'returns 0' 

    end
  end
end

