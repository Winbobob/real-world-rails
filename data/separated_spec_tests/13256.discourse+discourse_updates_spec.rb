require 'rails_helper'
require_dependency 'discourse_updates'

describe DiscourseUpdates do

  def stub_data(latest, missing, critical, updated_at)
    DiscourseUpdates.stubs(:latest_version).returns(latest)
    DiscourseUpdates.stubs(:missing_versions_count).returns(missing)
    DiscourseUpdates.stubs(:critical_updates_available?).returns(critical)
    DiscourseUpdates.stubs(:updated_at).returns(updated_at)
  end

  before do
    Jobs::VersionCheck.any_instance.stubs(:execute).returns(true)
  end

  subject { DiscourseUpdates.check_version }

  context 'version check was done at the current installed version' do
    before do
      DiscourseUpdates.stubs(:last_installed_version).returns(Discourse::VERSION::STRING)
    end

    context 'a good version check request happened recently' do
      context 'and server is up-to-date' do
        before { stub_data(Discourse::VERSION::STRING, 0, false, 12.hours.ago) }

        it 'returns all the version fields' 


        it 'returns the timestamp of the last version check' 

      end

      context 'and server is not up-to-date' do
        before { stub_data('0.9.0', 2, false, 12.hours.ago) }

        it 'returns all the version fields' 


        it 'returns the timestamp of the last version check' 

      end
    end

    context 'a version check has never been performed' do
      before { stub_data(nil, nil, false, nil) }

      it 'returns the installed version' 


      it 'indicates that version check has not been performed' 


      it 'does not return latest version info' 


      it 'queues a version check' 

    end

    # These cases should never happen anymore, but keep the specs to be sure
    # they're handled in a sane way.
    context 'old version check data' do
      shared_examples "queue version check and report that version is ok" do
        it 'queues a version check' 


        it 'reports 0 missing versions' 


        it 'reports that a version check will be run soon' 

      end

      context 'installed is latest' do
        before { stub_data(Discourse::VERSION::STRING, 1, false, 8.hours.ago) }
        include_examples "queue version check and report that version is ok"
      end

      context 'installed does not match latest version, but missing_versions_count is 0' do
        before { stub_data('0.10.10.123', 0, false, 8.hours.ago) }
        include_examples "queue version check and report that version is ok"
      end
    end
  end

  context 'version check was done at a different installed version' do
    before do
      DiscourseUpdates.stubs(:last_installed_version).returns('0.9.1')
    end

    shared_examples "when last_installed_version is old" do
      it 'queues a version check' 


      it 'reports 0 missing versions' 


      it 'reports that a version check will be run soon' 

    end

    context 'missing_versions_count is 0' do
      before { stub_data('0.9.7', 0, false, 8.hours.ago) }
      include_examples "when last_installed_version is old"
    end

    context 'missing_versions_count is not 0' do
      before { stub_data('0.9.7', 1, false, 8.hours.ago) }
      include_examples "when last_installed_version is old"
    end
  end
end

