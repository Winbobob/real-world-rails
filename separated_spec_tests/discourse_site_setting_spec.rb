require "rails_helper"
require "i18n/duplicate_key_finder"

describe "site setting integrity checks" do
  let(:site_setting_file) { File.join(Rails.root, 'config', 'site_settings.yml') }
  let(:yaml) { YAML.load_file(site_setting_file) }

  %w(hidden client).each do |property|
    it "set #{property} value as true or not set" 

  end

  it "has no duplicate keys" 


  it "no locale default has different type than default or invalid key" 

end

