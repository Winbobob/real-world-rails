# frozen_string_literal: true

require 'spec_helper'

describe "setting locale", type: :feature do
  stub_authorization!

  before do
    ActionView::Base.raise_on_missing_translations = false
    I18n.locale = I18n.default_locale
    I18n.backend.store_translations(:fr,
      date: {
        month_names: []
      },
      spree: {
        i18n: { this_file_language: "Français" },
        admin: {
          tab: { orders: "Ordres" }
        },
        listing_orders: "Ordres"
      })
    Spree::Backend::Config[:locale] = "fr"
  end

  after do
    I18n.locale = I18n.default_locale
    Spree::Backend::Config[:locale] = "en"
    ActionView::Base.raise_on_missing_translations = true
  end

  it "should be in french" 

end

