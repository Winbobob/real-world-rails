require 'rails_helper'
require_dependency 'site_setting_extension'
require_dependency 'site_settings/local_process_provider'

describe SiteSettingExtension do

  describe '#types' do
    context "verify enum sequence" do
      before do
        @types = SiteSetting.types
      end

      it "'string' should be at 1st position" 


      it "'value_list' should be at 12th position" 

    end
  end

  let :provider_local do
    SiteSettings::LocalProcessProvider.new
  end

  def new_settings(provider)
    Class.new do
      extend SiteSettingExtension
      self.provider = provider
    end
  end

  let :settings do
    new_settings(provider_local)
  end

  let :settings2 do
    new_settings(provider_local)
  end

  describe "refresh!" do

    it "will reset to default if provider vanishes" 


    it "will set to new value if provider changes" 


    it "publishes changes cross sites" 


  end

  describe "multisite" do
    it "has no db cross talk" 

  end

  describe "int setting" do
    before do
      settings.setting(:test_setting, 77)
      settings.refresh!
    end

    it "should have a key in all_settings" 


    it "should have the correct desc" 


    it "should have the correct default" 


    context "when overidden" do
      after :each do
        settings.remove_override!(:test_setting)
      end

      it "should have the correct override" 


      it "should coerce correct string to int" 


      it "should coerce incorrect string to 0" 


      it "should not set default when reset" 


      it "can be overridden with set" 


      it "should publish changes to clients" 

    end
  end

  describe "remove_override" do
    before do
      settings.setting(:test_override, "test")
      settings.refresh!
    end
    it "correctly nukes overrides" 

  end

  describe "string setting" do
    before do
      settings.setting(:test_str, "str")
      settings.refresh!
    end

    it "should have the correct default" 


    context "when overridden" do
      after :each do
        settings.remove_override!(:test_str)
      end

      it "should coerce int to string" 


      it "can be overridden with set" 

    end
  end

  describe "string setting with regex" do
    it "Supports custom validation errors" 

  end

  describe "bool setting" do
    before do
      settings.setting(:test_hello?, false)
      settings.refresh!
    end

    it "should have the correct default" 


    context "when overridden" do
      after do
        settings.remove_override!(:test_hello?)
      end

      it "should have the correct override" 


      it "should coerce true strings to true" 


      it "should coerce all other strings to false" 


      it "should not set default when reset" 


      it "can be overridden with set" 

    end
  end

  describe 'int enum' do
    class TestIntEnumClass
      def self.valid_value?(v)
        true
      end
      def self.values
        [1, 2, 3]
      end
    end

    it 'should coerce correctly' 


  end

  describe 'enum setting' do

    class TestEnumClass
      def self.valid_value?(v)
        self.values.include?(v)
      end
      def self.values
        ['en']
      end
      def self.translate_names?
        false
      end
    end

    let :test_enum_class do
      TestEnumClass
    end

    before do
      settings.setting(:test_enum, 'en', enum: test_enum_class)
      settings.refresh!
    end

    it 'should have the correct default' 


    it 'should not hose all_settings' 


    it 'should report error when being set other values' 


    context 'when overridden' do
      after :each do
        settings.remove_override!(:validated_setting)
      end

      it 'stores valid values' 


      it 'rejects invalid values' 

    end
  end

  describe 'a setting with a category' do
    before do
      settings.setting(:test_setting, 88, category: :tests)
      settings.refresh!
    end

    it "should return the category in all_settings" 


    context "when overidden" do
      after :each do
        settings.remove_override!(:test_setting)
      end

      it "should have the correct override" 


      it "should still have the correct category" 

    end
  end

  describe "setting with a validator" do
    before do
      settings.setting(:validated_setting, "info@example.com", type: 'email')
      settings.refresh!
    end

    after :each do
      settings.remove_override!(:validated_setting)
    end

    it "stores valid values" 


    it "rejects invalid values" 


    it "allows blank values" 

  end

  describe "set for an invalid setting name" do
    it "raises an error" 

  end

  describe ".set_and_log" do
    it "raises an error when set for an invalid setting name" 

  end

  describe "filter domain name" do
    before do
      settings.setting(:white_listed_spam_host_domains, "www.example.com")
      settings.refresh!
    end

    it "filters domain" 


    it "returns invalid domain as is, without throwing exception" 

  end

  describe "hidden" do
    before do
      settings.setting(:superman_identity, 'Clark Kent', hidden: true)
      settings.refresh!
    end

    it "is in the `hidden_settings` collection" 


    it "can be retrieved" 


    it "is not present in all_settings by default" 


    it "is present in all_settings when we ask for hidden" 

  end

  describe "shadowed_by_global" do
    context "without global setting" do
      before do
        settings.setting(:trout_api_key, 'evil', shadowed_by_global: true)
        settings.refresh!
      end

      it "should not add the key to the shadowed_settings collection" 


      it "can return the default value" 


      it "can overwrite the default" 

    end

    context "with blank global setting" do
      before do
        GlobalSetting.stubs(:nada).returns('')
        settings.setting(:nada, 'nothing', shadowed_by_global: true)
        settings.refresh!
      end

      it "should return default cause nothing is set" 


    end

    context "with a false override" do
      before do
        GlobalSetting.stubs(:bool).returns(false)
        settings.setting(:bool, true, shadowed_by_global: true)
        settings.refresh!
      end

      it "should return default cause nothing is set" 


      it "should not trigger any message bus work if you try to set it" 

    end

    context "with global setting" do
      before do
        GlobalSetting.stubs(:trout_api_key).returns('purringcat')
        settings.setting(:trout_api_key, 'evil', shadowed_by_global: true)
        settings.refresh!
      end

      it "should return the global setting instead of default" 


      it "should return the global setting after a refresh" 


      it "should add the key to the hidden_settings collection" 


      it "should add the key to the shadowed_settings collection" 

    end
  end

  describe 'locale default overrides are respected' do
    before do
      settings.setting(:test_override, 'default', locale_default: { zh_CN: 'cn' })
      settings.refresh!
    end

    after do
      settings.remove_override!(:test_override)
    end

    it 'ensures the default cache expired after overriding the default_locale' 


    it 'returns the saved setting even locale default exists' 

  end

  describe '.requires_refresh?' do
    it 'always refresh default_locale always require refresh' 

  end

  describe '.default_locale' do
    it 'is always loaded' 

  end

  describe '.default_locale=' do
    it 'can be changed' 


    it 'refresh!' 


    it 'expires the cache' 


    it 'refreshes the client' 

  end

  describe "get_hostname" do

    it "properly extracts the hostname" 


  end

end

