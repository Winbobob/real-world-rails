require 'spec_helper'

describe ProjectWorkloadHandler do

  let(:log) { PayloadLogEntry.new }
  let(:payload_processor) { double(PayloadProcessor) }
  let(:project) { double.as_null_object }
  let(:job_results) { double(:job_results) }
  let(:payload) { double(Payload) }
  subject { ProjectWorkloadHandler.new(project, payload_processor: payload_processor) }

  before do
    allow(project).to receive(:fetch_payload).and_return(payload)
    allow(payload).to receive(:status_content=)
    allow(payload).to receive(:build_status_content=)
    allow(payload_processor).to receive(:process_payload).with({project: project, payload: payload}).and_return(log)
  end

  describe '#workload_complete' do
    let(:project) { create(:project) }
    let(:job_results) { double.as_null_object }

    it 'should process the provided status content' 


    it 'sets the project to online' 


    describe 'creating a log entry' do
      before do
        allow(payload_processor).to receive(:process_payload) { PayloadLogEntry.new(status: 'success') }
      end

      it 'creates a payload_log_entry' 


      it 'sets the method to Polling' 

    end

    context 'if something goes wrong' do
      before do
        project.update!(online: true)
        project.name = nil
        expect(project).not_to be_valid
      end

      it 'creates an error log (in addition to the original log entry)' 


      it 'sets the project to offline' 

    end
  end

  describe '#workload_failed' do
    let(:error) { double }

    before do
      allow(error).to receive(:backtrace).and_return(['backtrace', 'more'])
    end

    after { subject.workload_failed(error) }

    it 'should add a log entry' 


    it 'should not call message on a failure when passed a String instead of an Exception' 


    it 'should set building to false' 


    it 'should set online to false' 


    it 'should save the project' 

  end
end

