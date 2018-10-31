require 'spec_helper'

describe Gitlab::CurrentSettings do
  before do
    stub_env('IN_MEMORY_APPLICATION_SETTINGS', 'false')
  end

  shared_context 'with settings in cache' do
    before do
      create(:application_setting)
      described_class.current_application_settings # warm the cache
    end
  end

  describe '#current_application_settings', :use_clean_rails_memory_store_caching do
    it 'allows keys to be called directly' 


    context 'when ENV["IN_MEMORY_APPLICATION_SETTINGS"] is true' do
      before do
        stub_env('IN_MEMORY_APPLICATION_SETTINGS', 'true')
      end

      it 'returns an in-memory ApplicationSetting object' 

    end

    context 'with DB unavailable' do
      context 'and settings in cache' do
        include_context 'with settings in cache'

        it 'fetches the settings from cache without issuing any query' 

      end

      context 'and no settings in cache' do
        before do
          # For some reason, `allow(described_class).to receive(:connect_to_db?).and_return(false)` causes issues
          # during the initialization phase of the test suite, so instead let's mock the internals of it
          allow(ActiveRecord::Base.connection).to receive(:active?).and_return(false)
          expect(ApplicationSetting).not_to receive(:current)
        end

        it 'returns an in-memory ApplicationSetting object' 


        it 'does not issue any query' 

      end
    end

    context 'with DB available' do
      # This method returns the ::ApplicationSetting.defaults hash
      # but with respect of custom attribute accessors of ApplicationSetting model
      def settings_from_defaults
        ar_wrapped_defaults = ::ApplicationSetting.build_from_defaults.attributes
        ar_wrapped_defaults.slice(*::ApplicationSetting.defaults.keys)
      end

      context 'and settings in cache' do
        include_context 'with settings in cache'

        it 'fetches the settings from cache' 

      end

      context 'and no settings in cache' do
        before do
          allow(ActiveRecord::Base.connection).to receive(:active?).and_return(true)
          allow(ActiveRecord::Base.connection).to receive(:cached_table_exists?).with('application_settings').and_return(true)
        end

        it 'creates default ApplicationSettings if none are present' 


        context 'with migrations pending' do
          before do
            expect(ActiveRecord::Migrator).to receive(:needs_migration?).and_return(true)
          end

          it 'returns an in-memory ApplicationSetting object' 


          it 'uses the existing database settings and falls back to defaults' 

        end

        context 'when ApplicationSettings.current is present' do
          it 'returns the existing application settings' 

        end

        context 'when the application_settings table does not exists' do
          it 'returns an in-memory ApplicationSetting object' 

        end

        context 'when the application_settings table is not fully migrated' do
          it 'returns an in-memory ApplicationSetting object' 

        end
      end
    end
  end
end

