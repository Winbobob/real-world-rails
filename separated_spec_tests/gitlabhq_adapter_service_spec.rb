require 'spec_helper'

describe Prometheus::AdapterService do
  let(:project) { create(:project) }
  subject { described_class.new(project) }

  describe '#prometheus_adapter' do
    let(:cluster) { create(:cluster, :provided_by_user, environment_scope: '*', projects: [project]) }

    context 'prometheus service can execute queries' do
      let(:prometheus_service) { double(:prometheus_service, can_query?: true) }

      before do
        allow(project).to receive(:find_or_initialize_service).with('prometheus').and_return prometheus_service
      end

      it 'return prometheus service as prometheus adapter' 

    end

    context "prometheus service can't execute queries" do
      let(:prometheus_service) { double(:prometheus_service, can_query?: false) }

      context 'with cluster with prometheus installed' do
        let!(:prometheus) { create(:clusters_applications_prometheus, :installed, cluster: cluster) }

        it 'returns application handling all environments' 

      end

      context 'with cluster without prometheus installed' do
        it 'returns nil' 

      end
    end
  end
end

