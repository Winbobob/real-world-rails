require 'spec_helper'

describe ProjectPoller do
  let(:project) { build(:project, name: 'project 1') }
  let(:jobs) { {job_1: 'https://url/1', job_2: 'https://url/2'} }
  let(:ci_strategy) { double(:polling_strategy) }
  let(:completion_block) { Proc.new { nil } }
  let(:handler) { double(:handler) }

  subject { ProjectPoller.new }

  describe '#poll_project' do
    context 'when there are projects to update' do
      before do
        allow(ci_strategy).to receive(:create_handler).and_return(handler)
      end

      it 'should fetch status for each job description in the workload' 


      it 'should call the completion callback immediately if there are no jobs' 


      context 'when polling a project succeeds' do
        before do
          allow(ci_strategy).to receive(:fetch_status).and_yield(PollState::SUCCEEDED, 'response body', 200)
        end

        it 'should call the completion callback' 


        context 'when one of the jobs could not determine the build status' do
          before do
            allow(ci_strategy).to receive(:fetch_status).and_yield(PollState::SUCCEEDED, 'project not found', 404)
          end

          it 'should call the completion callback' 


          it 'should abort the polling and not fetch further jobs' 

        end
      end

      context 'when polling the project fails' do
        before do
          allow(ci_strategy).to receive(:fetch_status).and_yield(PollState::FAILED, 'it broke', -1)
          allow(handler).to receive(:workload_failed).with('it broke')
        end

        it 'should call the completion callback' 

      end
    end
  end
end

