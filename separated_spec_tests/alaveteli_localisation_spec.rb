# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "when generating urls" do

  before do
    @home_link_regex = /href=".*\/en\//
  end

  it "should generate URLs that include the locale when using one that includes an underscore" 


  it "returns a 404 error if passed the locale with a hyphen instead of an underscore" 


  it "should fall back to the language if the territory is unknown" 


  it 'falls back to the default if the requested locale is unavailable' 


  it "should generate URLs without a locale prepended when there's only one locale set" 


  context 'when handling public body requests' do

    before do
      AlaveteliLocalization.set_locales('es en', 'en')
      body = FactoryGirl.create(:public_body, :short_name => 'english_short')
      AlaveteliLocalization.with_locale('es') do
        body.short_name = 'spanish_short'
        body.save!
      end
    end

    it 'should redirect requests for a public body in a locale to the canonical name in that locale' 


    it 'should remember a filter view when redirecting a public body request to the canonical name' 

  end

  describe 'when there is more than one locale' do

    before do
      AlaveteliLocalization.set_locales('es en', 'en')
    end

    it "should generate URLs with a locale prepended when there's more than one locale set" 


    describe 'when using the default locale' do

      before do
        @default_lang_home_link = /href=".*\/en\//
        @old_include_default_locale_in_urls = AlaveteliConfiguration::include_default_locale_in_urls
      end

      after do
        AlaveteliLocalization.set_default_locale_urls(@old_include_default_locale_in_urls)
      end

      describe 'when the config value INCLUDE_DEFAULT_LOCALE_IN_URLS is false' do

        before do
          allow(AlaveteliConfiguration).to receive(:include_default_locale_in_urls).and_return false
          AlaveteliLocalization.set_default_locale_urls(false)
        end

        it 'should generate URLs without a locale prepended' 


        describe "when the default url contains an underscore" do

          it "generates URLs without a locale prepended" 


        end

        it 'should render the front page in the default language when no locale param
                    is present and the session locale is not the default' do
          get('/', {}, {:locale => 'es'})
          expect(response.body).to match  /class="current-locale">English/
        end
      end

      describe 'when the config value INCLUDE_DEFAULT_LOCALE_IN_URLS is true' do

        before do
          allow(AlaveteliConfiguration).to receive(:include_default_locale_in_urls).and_return true
          AlaveteliLocalization.set_default_locale_urls(true)
        end

        it 'should generate URLs with a locale prepended' 


      end

    end

  end

end

