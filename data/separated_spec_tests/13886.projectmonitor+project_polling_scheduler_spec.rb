require 'spec_helper'

describe ProjectPollingScheduler do

  let (:helper) { double(:project_poller_helper) }

  subject { ProjectPollingScheduler.new(helper) }

  describe '#run' do
    before do
      allow(EM).to receive(:run).and_yield
      allow(EM).to receive(:add_periodic_timer)
    end

    it 'should call EM::run' 


    it 'should add a periodic timer to poll projects' 


    context 'the ci poller periodic timer has elapsed' do
      before do
        allow(EM).to receive(:add_periodic_timer).and_yield

        allow(helper).to receive(:poll_projects)
        allow(helper).to receive(:poll_tracker)
      end

      it 'should poll projects' 


      it 'should poll tracker projects' 

    end
  end

  describe '#stop' do
    it 'should call EM.stop_event_loop' 

  end
end

