require 'spec_helper'

describe ProjectUpdater do
  let(:project) { build(:jenkins_project) }
  let(:payload_log_entry) { PayloadLogEntry.new(status: 'successful') }
  let(:payload_processor) { double(PayloadProcessor, process_payload: payload_log_entry ) }
  let(:payload) { double(Payload, 'status_content=' => nil, 'build_status_content=' => nil) }
  let(:polling_strategy_factory) { double(:polling_strategy_factory) }
  let(:polling_strategy) { double(:polling_strategy) }
  let(:project_updater) { ProjectUpdater.new(payload_processor, polling_strategy_factory) }

  describe '#update' do
    before do
      allow(project).to receive(:fetch_payload).and_return(payload)
      allow(PayloadProcessor).to receive(:new).and_return(payload_processor)
      allow(EM).to receive(:run).and_yield
      allow(EM).to receive(:stop)
      allow(polling_strategy_factory).to receive(:build_ci_strategy).and_return(polling_strategy)
      allow(polling_strategy).to receive(:fetch_status).with(project, anything)
    end

    it 'should process the payload' 


    it 'should fetch the feed_url' 


    describe 'on an unsaved project' do
      it 'should not create a payload log entry' 

    end

    describe 'on a persisted project' do
      before do
        project.save!
      end

      it 'should create a payload log entry' 

    end

    context 'when fetching the status succeeds' do
      before do
        allow(polling_strategy).to receive(:fetch_status).with(project, project.feed_url).and_yield(PollState::SUCCEEDED, 'feed-status', 200)
      end

      it 'should return the log entry' 


      it 'should set the payloads status_content' 


      it 'should stop the EventMachine run loop' 

    end

    context 'when fetching the status fails' do
      before do
        allow(polling_strategy).to receive(:fetch_status).with(project, project.feed_url).and_yield(PollState::FAILED, 'authorization failed', 401)
      end

      it 'should create a payload log entry' 


      it 'should save a useful error message' 


      it 'should set the project to offline' 


      it 'should set the project as not building' 


      it 'should stop the EventMachine run loop' 

    end

    context 'when the project has a different url for status and building status' do
      before do
        allow(project).to receive(:feed_url).and_return('http://status.com')
        allow(project).to receive(:build_status_url).and_return('http://build-status.com')
        allow(polling_strategy).to receive(:fetch_status).with(project, project.build_status_url).and_yield(PollState::SUCCEEDED, 'build-status', 200)
      end

      it 'should fetch the build_status_url' 


      it 'should set the payloads build_status_content' 


      context 'and fetching the build status fails' do
        before do
          allow(polling_strategy).to receive(:fetch_status).with(project, project.feed_url).and_yield(PollState::SUCCEEDED, '{}', 200)
          allow(polling_strategy).to receive(:fetch_status).with(project, project.build_status_url).and_yield(PollState::FAILED, '{}', 500)
        end

        it 'should set the project to offline' 


        it 'should leave the project as building' 

      end
    end
  end
end

