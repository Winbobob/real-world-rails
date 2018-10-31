require 'spec_helper'

describe I18nHelper do

  describe "#facebook_locale_code" do

    let(:all_locales) {
      [
        {name: "English US", ident: "en", language: "en", region: "US"},
        {name: "Finnish", ident: "fi", language: "fi", region: "FI"},
        {name: "Spanish", ident: "es", language: "es", region: nil},
      ]
    }

    def expect_fb_locale(current_locale)
      expect(I18nHelper.facebook_locale_code(all_locales, current_locale))
    end

    context "success" do

      it "returns locale code in format that Facebook expects" 


    end

    context "failure" do

      it "returns nil if locale can not be found" 


      it "returns nil if locale does not have both language and region set" 

    end

  end

  describe "#select_locale" do

    let(:all_locales) {
      [
        {name: "English" , ident: "en" , language: "en" , region: "US" , fallback: nil },
        {name: "Spanish" , ident: "es" , language: "es" , region: "CL" , fallback: "es-ES" },
        {name: "Spanish" , ident: "es-ES" , language: "es" , region: "ES" , fallback: nil },
        {name: "French" , ident: "fr" , language: "fr" , region: "FR" , fallback: nil }
      ]
    }

    def expect_locale(opts)
      expect(I18nHelper.select_locale(opts))
    end

    it "uses user locale if available" 


    it "otherwise uses user locale fallback if available" 


    it "otherwise uses param locale if available" 


    it "otherwise uses param locale fallback if available" 


    it "otherwise uses community default" 


  end
end

