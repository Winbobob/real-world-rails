# frozen_string_literal: true

require 'rails_helper'

describe LanguageDetector do
  describe 'prepare_text' do
    it 'returns unmodified string without special cases' 


    it 'collapses spacing in strings' 


    it 'strips usernames from strings before detection' 


    it 'strips URLs from strings before detection' 


    it 'strips #hashtags from strings before detection' 

  end

  describe 'detect' do
    let(:account_without_user_locale) { Fabricate(:user, locale: nil).account }
    let(:account_remote) { Fabricate(:account, domain: 'joinmastodon.org') }

    it 'detects english language for basic strings' 


    it 'detects spanish language' 


    describe 'when language can\'t be detected' do
      it 'uses nil when sent an empty document' 


      describe 'because of a URL' do
        it 'uses nil when sent just a URL' 

      end

      describe 'with an account' do
        it 'uses the account locale when present' 


        it 'uses nil when account is present but has no locale' 

      end

      describe 'with an `en` default locale' do
        it 'uses nil for undetectable string' 

      end

      describe 'remote user' do
        it 'nil for foreign user when language is not present' 

      end

      describe 'with a non-`en` default locale' do
        around(:each) do |example|
          before = I18n.default_locale
          I18n.default_locale = :ja
          example.run
          I18n.default_locale = before
        end

        it 'uses nil for undetectable string' 

      end
    end
  end
end

