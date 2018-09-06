require 'rails_helper'

describe RepositoryUpdateRemoteMirrorWorker do
  subject { described_class.new }

  let(:remote_mirror) { create(:project, :repository, :remote_mirror).remote_mirrors.first }
  let(:scheduled_time) { Time.now - 5.minutes }

  around do |example|
    Timecop.freeze(Time.now) { example.run }
  end

  describe '#perform' do
    context 'with status none' do
      before do
        remote_mirror.update_attributes(update_status: 'none')
      end

      it 'sets status as finished when update remote mirror service executes successfully' 


      it 'sets status as failed when update remote mirror service executes with errors' 


      it 'does nothing if last_update_started_at is higher than the time the job was scheduled in' 

    end

    context 'with unexpected error' do
      it 'marks mirror as failed' 

    end

    context 'with another worker already running' do
      before do
        remote_mirror.update_attributes(update_status: 'started')
      end

      it 'raises RemoteMirrorUpdateAlreadyInProgressError' 

    end

    context 'with status failed' do
      before do
        remote_mirror.update_attributes(update_status: 'failed')
      end

      it 'sets status as finished if last_update_started_at is higher than the time the job was scheduled in' 

    end
  end
end

