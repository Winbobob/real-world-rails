require 'spec_helper'

describe Clusters::ClusterPresenter do
  let(:cluster) { create(:cluster, :provided_by_gcp) }

  subject(:presenter) do
    described_class.new(cluster)
  end

  it 'inherits from Gitlab::View::Presenter::Delegated' 


  describe '#initialize' do
    it 'takes a cluster and optional params' 


    it 'exposes cluster' 


    it 'forwards missing methods to cluster' 

  end

  describe '#gke_cluster_url' do
    subject { described_class.new(cluster).gke_cluster_url }

    it { is_expected.to include(cluster.provider.zone) }
    it { is_expected.to include(cluster.name) }
  end

  describe '#can_toggle_cluster' do
    let(:user) { create(:user) }

    before do
      allow(cluster).to receive(:current_user).and_return(user)
    end

    subject { described_class.new(cluster).can_toggle_cluster? }

    context 'when user can update' do
      before do
        allow_any_instance_of(described_class).to receive(:can?).with(user, :update_cluster, cluster).and_return(true)
      end

      context 'when cluster is created' do
        before do
          allow(cluster).to receive(:created?).and_return(true)
        end

        it { is_expected.to eq(true) }
      end

      context 'when cluster is not created' do
        before do
          allow(cluster).to receive(:created?).and_return(false)
        end

        it { is_expected.to eq(false) }
      end
    end

    context 'when user can not update' do
      before do
        allow_any_instance_of(described_class).to receive(:can?).with(user, :update_cluster, cluster).and_return(false)
      end

      it { is_expected.to eq(false) }
    end
  end
end

