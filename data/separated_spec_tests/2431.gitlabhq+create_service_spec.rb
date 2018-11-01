# frozen_string_literal: true

require 'spec_helper'

describe Clusters::Applications::CreateService do
  include TestRequestHelpers

  let(:cluster) { create(:cluster, :project, :provided_by_gcp) }
  let(:user) { create(:user) }
  let(:params) { { application: 'helm' } }
  let(:service) { described_class.new(cluster, user, params) }

  describe '#execute' do
    before do
      allow(ClusterInstallAppWorker).to receive(:perform_async)
    end

    subject { service.execute(test_request) }

    it 'creates an application' 


    it 'schedules an install via worker' 


    context 'jupyter application' do
      let(:params) do
        {
          application: 'jupyter',
          hostname: 'example.com'
        }
      end

      before do
        allow_any_instance_of(Clusters::Applications::ScheduleInstallationService).to receive(:execute)
      end

      it 'creates the application' 


      it 'sets the hostname' 


      it 'sets the oauth_application' 

    end

    context 'invalid application' do
      let(:params) { { application: 'non-existent' } }

      it 'raises an error' 

    end
  end
end

