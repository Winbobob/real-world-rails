require 'rails_helper'
require_dependency 'site_settings/defaults_provider'

describe SiteSettings::DefaultsProvider do
  let(:provider_local) do
    SiteSettings::LocalProcessProvider.new
  end

  def new_settings(provider)
    Class.new do
      extend SiteSettingExtension
      self.provider = provider
    end
  end

  let(:settings) do
    new_settings(provider_local)
  end

  describe 'inserts default_locale into refresh' do
    it 'when initialize' 

  end

  describe '.db_all' do
    it 'collects values from db except default locale' 


    it 'can collect values from db' 

  end

  describe 'expose default cache according to locale' do
    before do
      settings.setting(:test_override, 'default', locale_default: { zh_CN: 'cn' })
      settings.setting(:test_default, 'test', regex: '^\S+$')
      settings.refresh!
    end

    describe '.all' do
      it 'returns all values according to the current locale' 

    end

    describe '.get' do
      it 'returns the default value to a site setting' 


      it 'accepts a string as the parameters' 


      it 'returns the default value according to current locale' 

    end

    describe '.set_regardless_of_locale' do
      let(:val) { 'env_overriden' }

      it 'sets the default value to a site setting regardless the locale' 


      it 'handles the string' 


      it 'converts the data type' 


      it 'raises when the setting does not exists' 


      it 'raises when the value is not valid' 

    end

    describe '.each' do
      it 'yields the pair of site settings' 

    end
  end

  describe '.site_locale' do
    it 'returns the current site locale' 


    context 'when locale is set in the db' do
      let(:db_val) { 'zr' }
      let(:global_val) { 'gr' }

      before do
        settings.provider.save(SiteSettings::DefaultsProvider::DEFAULT_LOCALE_KEY,
                               db_val,
                               SiteSetting.types[:string])
        settings.defaults.refresh_site_locale!
      end

      it 'should load from database' 


      it 'prioritizes GlobalSetting than value from db' 


      it 'ignores blank GlobalSetting' 

    end

  end

  describe '.site_locale=' do
    it 'should store site locale in a distributed cache' 


    it 'changes and store the current site locale' 


    it 'changes and store the current site locale' 


    it "don't change when it's shadowed" 


    it 'refresh_site_locale! when called' 


    it 'refreshes the client when changed' 


    it "doesn't refresh the client when changed" 

  end

  describe '.locale_setting_hash' do
    it 'returns the hash for client display' 

  end

  describe '.load_setting' do
    it 'adds a setting to the cache' 


    it 'takes care of locale default' 

  end

  describe '.refresh_site_locale!' do
    it 'loads the change to locale' 


    it 'loads from GlobalSettings' 


    it 'prioritized GlobalSettings than db' 

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

