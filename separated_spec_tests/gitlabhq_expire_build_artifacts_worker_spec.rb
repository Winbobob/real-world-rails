require 'spec_helper'

describe ExpireBuildArtifactsWorker do
  include RepoHelpers

  let(:worker) { described_class.new }

  before do
    Sidekiq::Worker.clear_all
  end

  describe '#perform' do
    before do
      build
    end

    subject! do
      Sidekiq::Testing.fake! { worker.perform }
    end

    context 'with expired artifacts' do
      let(:build) { create(:ci_build, :artifacts, artifacts_expire_at: Time.now - 7.days) }

      it 'enqueues that build' 

    end

    context 'with not yet expired artifacts' do
      let(:build) { create(:ci_build, :artifacts, artifacts_expire_at: Time.now + 7.days) }

      it 'does not enqueue that build' 

    end

    context 'without expire date' do
      let(:build) { create(:ci_build, :artifacts) }

      it 'does not enqueue that build' 

    end

    def jobs_enqueued
      Sidekiq::Queues.jobs_by_worker['ExpireBuildInstanceArtifactsWorker']
    end
  end
end

