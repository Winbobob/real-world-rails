require 'spec_helper'

describe MergeRequests::FfMergeService do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:merge_request) do
    create(:merge_request,
           source_branch: 'flatten-dir',
           target_branch: 'improve/awesome',
           assignee: user2,
           author: create(:user))
  end
  let(:project) { merge_request.project }

  before do
    project.add_maintainer(user)
    project.add_developer(user2)
  end

  describe '#execute' do
    context 'valid params' do
      let(:service) { described_class.new(project, user, {}) }

      before do
        allow(service).to receive(:execute_hooks)

        perform_enqueued_jobs do
          service.execute(merge_request)
        end
      end

      it "does not create merge commit" 


      it { expect(merge_request).to be_valid }
      it { expect(merge_request).to be_merged }

      it 'sends email to user2 about merge of new merge_request' 


      it 'creates system note about merge_request merge' 

    end

    context "error handling" do
      let(:service) { described_class.new(project, user, commit_message: 'Awesome message') }

      before do
        allow(Rails.logger).to receive(:error)
      end

      it 'logs and saves error if there is an exception' 


      it 'logs and saves error if there is an PreReceiveError exception' 

    end
  end
end

