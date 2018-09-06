require 'spec_helper'

feature "Admin Health Check", :feature do
  include StubENV

  before do
    stub_env('IN_MEMORY_APPLICATION_SETTINGS', 'false')
    sign_in(create(:admin))
  end

  describe '#show' do
    before do
      visit admin_health_check_path
    end

    it 'has a health check access token' 


    describe 'reload access token' do
      it 'changes the access token' 

    end
  end

  context 'when services are up' do
    before do
      stub_storage_settings({}) # Hide the broken storage
      visit admin_health_check_path
    end

    it 'shows healthy status' 

  end

  context 'when a service is down' do
    before do
      allow(HealthCheck::Utils).to receive(:process_checks).and_return('The server is on fire')
      visit admin_health_check_path
    end

    it 'shows unhealthy status' 

  end

  context 'with repository storage failures', :broken_storage do
    before do
      visit admin_health_check_path
    end

    it 'shows storage failure information' 


    it 'allows resetting storage failures' 

  end
end

