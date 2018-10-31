require 'rails_helper'
require_dependency 'js_locale_helper'
require 'mini_racer'

describe JsLocaleHelper do

  module StubLoadTranslations
    def set_translations(locale, translations)
      @loaded_translations ||= HashWithIndifferentAccess.new
      @loaded_translations[locale] = translations
    end

    def clear_cache!
      @loaded_translations = nil
      @loaded_merges = nil
    end
  end

  JsLocaleHelper.extend StubLoadTranslations

  after do
    I18n.locale = :en
    JsLocaleHelper.clear_cache!
  end

  describe "#output_locale" do

    it "doesn't change the cached translations hash" 


  end

  context "message format" do
    def message_format_filename(locale)
      Rails.root + "lib/javascripts/locale/#{locale}.js"
    end

    def setup_message_format(format)
      filename = message_format_filename('en')
      compiled = JsLocaleHelper.compile_message_format(filename, 'en', format)

      @ctx = MiniRacer::Context.new
      @ctx.eval('MessageFormat = {locale: {}};')
      @ctx.load(filename)
      @ctx.eval("var test = #{compiled}")
    end

    def localize(opts)
      @ctx.eval("test(#{opts.to_json})")
    end

    it 'handles plurals' 


    it 'handles double plurals' 


    it 'handles select' 


    it 'can strip out message formats' 


    it 'handles message format special keys' 


    it 'load pluralizations rules before precompile' 

  end

  it 'performs fallbacks to english if a translation is not available' 


  LocaleSiteSetting.values.each do |locale|
    it "generates valid date helpers for #{locale[:value]} locale" 


    it "finds moment.js locale file for #{locale[:value]}" 

  end

end

