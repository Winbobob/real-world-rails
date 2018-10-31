require 'rails_helper'
require 'site_settings/yaml_loader'

describe SiteSettings::YamlLoader do

  class Receiver
    attr_reader :settings, :client_settings, :categories

    def load_yaml(file_arg)
      SiteSettings::YamlLoader.new(file_arg).load do |category, name, default, opts|
        setting(category, name, default, opts)
      end
    end

    def setting(category, name, default = nil, opts = {})
      @settings ||= []
      @client_settings ||= []
      @settings << name
      @categories ||= []
      @categories << category
      @categories.uniq!
      @client_settings << name if opts.has_key?(:client)
    end
  end

  let!(:receiver)   { Receiver.new }
  let(:simple)      { "#{Rails.root}/spec/fixtures/site_settings/simple.yml" }
  let(:client)      { "#{Rails.root}/spec/fixtures/site_settings/client.yml" }
  let(:enum)        { "#{Rails.root}/spec/fixtures/site_settings/enum.yml" }
  let(:enum_client) { "#{Rails.root}/spec/fixtures/site_settings/enum_client.yml" }
  let(:deprecated_env) { "#{Rails.root}/spec/fixtures/site_settings/deprecated_env.yml" }
  let(:deprecated_hidden) { "#{Rails.root}/spec/fixtures/site_settings/deprecated_hidden.yml" }
  let(:locale_default) { "#{Rails.root}/spec/fixtures/site_settings/locale_default.yml" }
  let(:nil_default) { "#{Rails.root}/spec/fixtures/site_settings/nil_default.yml" }

  it "loads simple settings" 


  it 'can take a File argument' 


  it "maintains order of categories" 


  it "can load client settings" 


  it "can load enum settings" 


  it "can load enum client settings" 


  it "raises deprecation when load settings based on environment" 


  it "raises deprecation when hidden property is based on environment" 


  it "raises invalid parameter when default value is not present" 


  it "can load settings with locale default" 

end

