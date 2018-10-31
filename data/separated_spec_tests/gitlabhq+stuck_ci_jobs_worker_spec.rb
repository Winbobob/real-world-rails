require 'spec_helper'

describe StuckCiJobsWorker do
  include ExclusiveLeaseHelpers

  let!(:runner) { create :ci_runner }
  let!(:job) { create :ci_build, runner: runner }
  let(:trace_lease_key) { "trace:archive:#{job.id}" }
  let(:trace_lease_uuid) { SecureRandom.uuid }
  let(:worker_lease_key) { StuckCiJobsWorker::EXCLUSIVE_LEASE_KEY }
  let(:worker_lease_uuid) { SecureRandom.uuid }

  subject(:worker) { described_class.new }

  before do
    stub_exclusive_lease(worker_lease_key, worker_lease_uuid)
    stub_exclusive_lease(trace_lease_key, trace_lease_uuid)
    job.update!(status: status, updated_at: updated_at)
  end

  shared_examples 'job is dropped' do
    before do
      worker.perform
      job.reload
    end

    it "changes status" 

  end

  shared_examples 'job is unchanged' do
    before do
      worker.perform
      job.reload
    end

    it "doesn't change status" 

  end

  context 'when job is pending' do
    let(:status) { 'pending' }

    context 'when job is not stuck' do
      before do
        allow_any_instance_of(Ci::Build).to receive(:stuck?).and_return(false)
      end

      context 'when job was not updated for more than 1 day ago' do
        let(:updated_at) { 2.days.ago }

        it_behaves_like 'job is dropped'
      end

      context 'when job was updated in less than 1 day ago' do
        let(:updated_at) { 6.hours.ago }

        it_behaves_like 'job is unchanged'
      end

      context 'when job was not updated for more than 1 hour ago' do
        let(:updated_at) { 2.hours.ago }

        it_behaves_like 'job is unchanged'
      end
    end

    context 'when job is stuck' do
      before do
        allow_any_instance_of(Ci::Build).to receive(:stuck?).and_return(true)
      end

      context 'when job was not updated for more than 1 hour ago' do
        let(:updated_at) { 2.hours.ago }

        it_behaves_like 'job is dropped'
      end

      context 'when job was updated in less than 1
       hour ago' do
        let(:updated_at) { 30.minutes.ago }

        it_behaves_like 'job is unchanged'
      end
    end
  end

  context 'when job is running' do
    let(:status) { 'running' }

    context 'when job was not updated for more than 1 hour ago' do
      let(:updated_at) { 2.hours.ago }

      it_behaves_like 'job is dropped'
    end

    context 'when job was updated in less than 1 hour ago' do
      let(:updated_at) { 30.minutes.ago }

      it_behaves_like 'job is unchanged'
    end
  end

  %w(success skipped failed canceled).each do |status|
    context "when job is #{status}" do
      let(:status) { status }
      let(:updated_at) { 2.days.ago }

      it_behaves_like 'job is unchanged'
    end
  end

  context 'for deleted project' do
    let(:status) { 'running' }
    let(:updated_at) { 2.days.ago }

    before do
      job.project.update(pending_delete: true)
    end

    it 'does drop job' 

  end

  describe 'drop stale scheduled builds' do
    let(:status) { 'scheduled' }
    let(:updated_at) { }

    context 'when scheduled at 2 hours ago but it is not executed yet' do
      let!(:job) { create(:ci_build, :scheduled, scheduled_at: 2.hours.ago) }

      it 'drops the stale scheduled build' 

    end

    context 'when scheduled at 30 minutes ago but it is not executed yet' do
      let!(:job) { create(:ci_build, :scheduled, scheduled_at: 30.minutes.ago) }

      it 'does not drop the stale scheduled build yet' 

    end

    context 'when there are no stale scheduled builds' do
      it 'does not drop the stale scheduled build yet' 

    end
  end

  describe 'exclusive lease' do
    let(:status) { 'running' }
    let(:updated_at) { 2.days.ago }
    let(:worker2) { described_class.new }

    it 'is guard by exclusive lease when executed concurrently' 


    it 'can be executed in sequence' 


    it 'cancels exclusive leases after worker perform' 

  end
end

