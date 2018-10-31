require 'rails_helper'
require 'i18n/backend/fallback_locale_list'

describe I18n::Backend::FallbackLocaleList do
  let(:list) { I18n::Backend::FallbackLocaleList.new }

  it "works when default_locale is English" 


  it "works when default_locale is not English" 


  context "when plugin registered fallback locale" do
    before do
      DiscoursePluginRegistry.register_locale("es_MX", fallbackLocale: "es")
      DiscoursePluginRegistry.register_locale("de_AT", fallbackLocale: "de")
    end

    after do
      DiscoursePluginRegistry.reset!
    end

    it "works when default_locale is English" 


    it "works when default_locale is not English" 

  end
end

