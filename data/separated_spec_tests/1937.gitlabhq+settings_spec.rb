require 'spec_helper'
require 'rainbow/ext/string'

describe 'seed production settings' do
  let(:settings_file) { Rails.root.join('db/fixtures/production/010_settings.rb') }
  let(:settings) { Gitlab::CurrentSettings.current_application_settings }

  before do
    # It's important to set this variable so that we don't save a memoized
    # (supposed to be) in-memory record in `Gitlab::CurrentSettings.in_memory_application_settings`
    stub_env('IN_MEMORY_APPLICATION_SETTINGS', 'false')
  end

  context 'GITLAB_SHARED_RUNNERS_REGISTRATION_TOKEN is set in the environment' do
    before do
      stub_env('GITLAB_SHARED_RUNNERS_REGISTRATION_TOKEN', '013456789')
    end

    it 'writes the token to the database' 

  end

  context 'GITLAB_PROMETHEUS_METRICS_ENABLED is set in the environment' do
    context 'GITLAB_PROMETHEUS_METRICS_ENABLED is true' do
      before do
        stub_env('GITLAB_PROMETHEUS_METRICS_ENABLED', 'true')
      end

      it 'prometheus_metrics_enabled is set to true ' 

    end

    context 'GITLAB_PROMETHEUS_METRICS_ENABLED is false' do
      before do
        stub_env('GITLAB_PROMETHEUS_METRICS_ENABLED', 'false')
      end

      it 'prometheus_metrics_enabled is set to false' 

    end

    context 'GITLAB_PROMETHEUS_METRICS_ENABLED is default' do
      before do
        stub_env('GITLAB_PROMETHEUS_METRICS_ENABLED', '')
      end

      it 'prometheus_metrics_enabled is set to true' 

    end
  end
end

