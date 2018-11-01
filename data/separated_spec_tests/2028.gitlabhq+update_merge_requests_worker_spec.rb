require 'spec_helper'

describe UpdateMergeRequestsWorker do
  include RepoHelpers

  let(:project) { create(:project, :repository) }
  let(:user) { create(:user) }

  subject { described_class.new }

  describe '#perform' do
    let(:oldrev) { "123456" }
    let(:newrev) { "789012" }
    let(:ref)    { "refs/heads/test" }

    def perform
      subject.perform(project.id, user.id, oldrev, newrev, ref)
    end

    it 'executes MergeRequests::RefreshService with expected values' 


    context 'when slow' do
      before do
        stub_const("UpdateMergeRequestsWorker::LOG_TIME_THRESHOLD", -1)
      end

      it 'logs debug info' 

    end
  end
end

