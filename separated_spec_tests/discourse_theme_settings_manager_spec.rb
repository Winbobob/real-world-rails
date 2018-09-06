require 'rails_helper'
require 'theme_settings_manager'

describe ThemeSettingsManager do

  let(:theme_settings) do
    theme = Theme.create!(name: "awesome theme", user_id: -1)
    yaml = File.read("#{Rails.root}/spec/fixtures/theme_settings/valid_settings.yaml")
    theme.set_field(target: :settings, name: "yaml", value: yaml)
    theme.save!
    theme.settings
  end

  def find_by_name(name)
    theme_settings.find { |setting| setting.name == name }
  end

  context "Enum" do
    it "only accepts values from its choices" 

  end

  context "Bool" do
    it "is either true or false" 

  end

  context "Integer" do
    it "is always an integer" 


    it "can have min or max value" 

  end

  context "Float" do
    it "is always a float" 


    it "can have min or max value" 

  end

  context "String" do
    it "can have min or max length" 

  end
end

