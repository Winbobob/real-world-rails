require 'spec_helper'

describe Clusters::Applications::ScheduleInstallationService do
  def count_scheduled
    application&.class&.with_status(:scheduled)&.count || 0
  end

  shared_examples 'a failing service' do
    it 'raise an exception' 

  end

  describe '#execute' do
    let(:service) { described_class.new(application) }

    context 'when application is installable' do
      let(:application) { create(:clusters_applications_helm, :installable) }

      it 'make the application scheduled' 

    end

    context 'when installation is already in progress' do
      let(:application) { create(:clusters_applications_helm, :installing) }

      it_behaves_like 'a failing service'
    end

    context 'when application is nil' do
      let(:application) { nil }

      it_behaves_like 'a failing service'
    end

    context 'when application cannot be persisted' do
      let(:application) { create(:clusters_applications_helm) }

      before do
        expect(application).to receive(:make_scheduled!).once.and_raise(ActiveRecord::RecordInvalid)
      end

      it_behaves_like 'a failing service'
    end
  end
end

