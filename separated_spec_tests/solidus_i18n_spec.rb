# frozen_string_literal: true

require 'spec_helper'
require 'spree/i18n'

RSpec.describe "i18n" do
  before do
    # This reload avoids an issue with I18n.available_locales being cached
    I18n.reload!

    I18n.backend.store_translations(:en,
    {
      spree: {
        i18n: {
          this_file_language: "English"
        },
        foo: "bar",
        bar: {
          foo: "bar within bar scope",
          invalid: nil,
          legacy_translation: "back in the day..."
        },
        invalid: nil,
        legacy_translation: "back in the day..."
      }
    })
  end
  after do
    I18n.reload!
  end

  it "translates within the spree scope" 


  it "prepends a string scope" 


  it "prepends to an array scope" 


  it "returns two translations" 


  it "returns reasonable string for missing translations" 


  it "should have a Spree::I18N_GENERIC_PLURAL constant" 


  describe "i18n_available_locales" do
    it "should only return :en" 


    context 'with unprefixed translations in another locale' do
      before do
        I18n.backend.store_translations(:fr, { cheese: "fromage" })
      end

      it "should only return :en" 

    end

    context 'with spree-prefixed translations in another locale' do
      before do
        I18n.backend.store_translations(:fr, spree: { cheese: "fromage" })
      end

      it "should return :en and :fr" 

    end

    context 'with specific desired key' do
      before do
        I18n.backend.store_translations(:fr, spree: { i18n: { this_file_language: "Français" } })
      end

      it "should return :en and :fr" 

    end
  end
end

