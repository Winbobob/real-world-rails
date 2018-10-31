require 'rails_helper'
require_dependency 'discourse_version_check'

describe Admin::DashboardController do
  before do
    AdminDashboardData.stubs(:fetch_cached_stats).returns(reports: [])
    Jobs::VersionCheck.any_instance.stubs(:execute).returns(true)
  end

  it "is a subclass of AdminController" 


  context 'while logged in as an admin' do
    let!(:admin) { log_in(:admin) }

    context '.index' do
      context 'version checking is enabled' do
        before do
          SiteSetting.version_checks = true
        end

        it 'returns discourse version info' 

      end

      context 'version checking is disabled' do
        before do
          SiteSetting.version_checks = false
        end

        it 'does not return discourse version info' 

      end
    end

    context '.problems' do
      context 'when there are no problems' do
        before do
          AdminDashboardData.stubs(:fetch_problems).returns([])
        end

        it 'returns an empty array' 

      end

      context 'when there are problems' do
        before do
          AdminDashboardData.stubs(:fetch_problems).returns(['Not enough awesome', 'Too much sass'])
        end

        it 'returns an array of strings' 

      end
    end
  end
end

