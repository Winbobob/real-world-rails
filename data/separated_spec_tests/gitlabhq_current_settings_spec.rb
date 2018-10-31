require 'spec_helper'

describe Gitlab::CurrentSettings do
  include StubENV

  before do
    stub_env('IN_MEMORY_APPLICATION_SETTINGS', 'false')
  end

  describe '#current_application_settings' do
    it 'allows keys to be called directly' 


    context 'with DB available' do
      before do
        # For some reason, `allow(described_class).to receive(:connect_to_db?).and_return(true)` causes issues
        # during the initialization phase of the test suite, so instead let's mock the internals of it
        allow(ActiveRecord::Base.connection).to receive(:active?).and_return(true)
        allow(ActiveRecord::Base.connection).to receive(:table_exists?).and_call_original
        allow(ActiveRecord::Base.connection).to receive(:table_exists?).with('application_settings').and_return(true)
      end

      it 'attempts to use cached values first' 


      it 'falls back to DB if Redis returns an empty value' 


      it 'falls back to DB if Redis fails' 


      it 'creates default ApplicationSettings if none are present' 


      context 'with migrations pending' do
        before do
          expect(ActiveRecord::Migrator).to receive(:needs_migration?).and_return(true)
        end

        it 'returns an in-memory ApplicationSetting object' 


        it 'uses the existing database settings and falls back to defaults' 

      end
    end

    context 'with DB unavailable' do
      before do
        # For some reason, `allow(described_class).to receive(:connect_to_db?).and_return(false)` causes issues
        # during the initialization phase of the test suite, so instead let's mock the internals of it
        allow(ActiveRecord::Base.connection).to receive(:active?).and_return(false)
      end

      it 'returns an in-memory ApplicationSetting object' 

    end

    context 'when ENV["IN_MEMORY_APPLICATION_SETTINGS"] is true' do
      before do
        stub_env('IN_MEMORY_APPLICATION_SETTINGS', 'true')
      end

      it 'returns an in-memory ApplicationSetting object' 

    end
  end
end

