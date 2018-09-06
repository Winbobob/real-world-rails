# -*- encoding : utf-8 -*-
require 'spec_helper'

describe AlaveteliLocalization do

  describe '.set_locales' do

    before do
      AlaveteliLocalization.set_locales('en_GB es', 'en_GB')
    end

    context 'when dealing with FastGettext' do

      it 'sets FastGettext.locale' 


      it 'sets FastGettext.locale correctly if given a hypheanted locale' 


      it 'sets FastGettext.default_locale' 


      it 'sets FastGettext.default_available_locales' 


    end

    context 'when dealing with I18n' do

      context 'when enforce_available_locales is true' do

        before do
          I18n.config.enforce_available_locales = true
        end

        it 'allows a new locale to be set as the default' 


      end

      it 'sets I18n.locale' 


      it 'sets I18n.default_locale' 


      it 'sets I18n.available_locales' 


    end

    it 'sets the locales for the custom routing filter' 


    it 'handles being passed a symbol as available_locales' 


    it 'handles being passed hyphenated strings as available_locales' 


  end

  describe '.set_session_locale' do

    it 'sets the current locale' 


    it 'does not affect the default locale' 


    it 'uses the first non blank argument' 


    it 'uses the current default if the supplied value is not in available_locales' 


    it 'uses the current default if only blank arguments are supplied' 


    it 'accepts a symbol or a string' 


  end

  describe '.with_locale' do

    it 'yields control to i18n' 


    it 'returns the same result as if we had called I18n.with_locale directly' 


  end

  describe '.locale' do

    it 'returns the current locale' 


    it 'returns the locale in the underscore format' 


  end

  describe '.default_locale' do

    it 'returns the current locale' 


    it 'returns the locale in the underscore format' 


  end

  describe '.default_locale?' do

    it 'returns true if the supplied locale is the default' 


    it 'returns false if the supplied locale is not the default' 


    it 'accepts symbol formatted locales' 


    it 'returns false if the supplied locale is nil' 


  end

  describe '.available_locales' do

    it 'returns an array of available locales' 


  end

  describe '.html_lang' do

    it 'returns the current locale' 


    it 'returns the hyphenated format' 


  end

end

