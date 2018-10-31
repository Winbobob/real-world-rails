require 'rails_helper'
require_dependency 'site_settings/defaults_provider'

describe SiteSettings::DefaultsProvider do
  let(:provider_local) do
    SiteSettings::LocalProcessProvider.new
  end

  before do
    MessageBus.off
  end

  after do
    MessageBus.on
  end

  def new_settings(provider)
    Class.new do
      extend SiteSettingExtension
      self.listen_for_changes = false
      self.provider = provider
    end
  end

  let(:settings) do
    new_settings(provider_local)
  end

  describe '.db_all' do
    it 'can collect values from db' 

  end

  describe 'expose default cache according to locale' do
    before do
      settings.setting(:test_override, 'default', locale_default: { zh_CN: 'cn' })
      settings.setting(:test_boolean_override, true, locale_default: { zh_CN: false })
      settings.setting(:test_default, 'test', regex: '^\S+$')
      settings.refresh!
    end

    describe '.all' do
      it 'returns all values according to locale' 

    end

    describe '.get' do
      it 'returns the default value to a site setting' 


      it 'accepts a string as the parameters' 


      it 'returns the locale_default value if it exists' 


      it 'returns the correct locale_default for boolean site settings' 

    end

    describe '.set_regardless_of_locale' do
      let(:val) { 'env_overriden' }

      it 'sets the default value to a site setting regardless the locale' 


      it 'handles the string' 


      it 'converts the data type' 


      it 'raises when the setting does not exists' 


      it 'raises when the value is not valid' 

    end
  end

  describe '.load_setting' do
    it 'adds a setting to the cache correctly' 

  end

  describe '.has_setting?' do
    before do
      settings.setting(:r, 1)
      settings.setting(:question?, 1)
    end

    it "returns true when it's present in the cache" 


    it '"responds when the arg is string' 


    it 'default_locale always exists' 


    it 'returns false when the key is not exist' 


    it 'checks name with question mark' 

  end

end

