require 'spec_helper'

describe Projects::HousekeepingService do
  subject { described_class.new(project) }
  set(:project) { create(:project, :repository) }

  before do
    project.reset_pushes_since_gc
  end

  after do
    project.reset_pushes_since_gc
  end

  describe '#execute' do
    it 'enqueues a sidekiq job' 


    it 'yields the block if given' 


    it 'resets counter after execution' 


    context 'when no lease can be obtained' do
      before do
        expect(subject).to receive(:try_obtain_lease).and_return(false)
      end

      it 'does not enqueue a job' 


      it 'does not reset pushes_since_gc' 


      it 'does not yield' 

    end

    context 'task type' do
      it 'goes through all three housekeeping tasks, executing only the highest task when there is overlap' 

    end
  end

  describe '#needed?' do
    it 'when the count is low enough' 


    it 'when the count is high enough' 

  end

  describe '#increment!' do
    it 'increments the pushes_since_gc counter' 

  end
end

