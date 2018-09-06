require 'rails_helper'
require 'theme_settings_parser'

describe ThemeSettingsParser do
  after(:all) do
    ThemeField.destroy_all
  end

  def types
    ThemeSetting.types
  end

  class Loader
    def initialize
      @settings ||= []
      load_settings
    end

    def load_settings
      yaml = File.read("#{Rails.root}/spec/fixtures/theme_settings/valid_settings.yaml")
      field = ThemeField.create!(theme_id: 1, target_id: 3, name: "yaml", value: yaml)

      ThemeSettingsParser.new(field).load do |name, default, type, opts|
        @settings << setting(name, default, type, opts)
      end
    end

    def setting(name, default, type, opts = {})
      { name: name, default: default, type: type, opts: opts }
    end

    def find_by_name(name)
      @settings.find { |setting| setting[:name] == name }
    end
  end

  let(:loader) { Loader.new }

  it "guesses types correctly" 


  context "description locale" do
    it "favors I18n.locale" 


    it "uses SiteSetting.default_locale if I18n.locale isn't supported" 


    it "finds the first supported locale and uses it as a last resort" 


    it "doesn't set locale if no supported locale is provided" 

  end

  context "enum setting" do
    it "should never have less than 1 choices" 

  end
end

