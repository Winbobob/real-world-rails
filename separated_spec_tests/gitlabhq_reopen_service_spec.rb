require 'spec_helper'

describe MergeRequests::ReopenService do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:guest) { create(:user) }
  let(:merge_request) { create(:merge_request, :closed, assignee: user2, author: create(:user)) }
  let(:project) { merge_request.project }

  before do
    project.add_master(user)
    project.add_developer(user2)
    project.add_guest(guest)
  end

  describe '#execute' do
    it_behaves_like 'cache counters invalidator'

    context 'valid params' do
      let(:service) { described_class.new(project, user, {}) }

      before do
        allow(service).to receive(:execute_hooks)

        perform_enqueued_jobs do
          service.execute(merge_request)
        end
      end

      it { expect(merge_request).to be_valid }
      it { expect(merge_request).to be_opened }

      it 'executes hooks with reopen action' 


      it 'sends email to user2 about reopen of merge_request' 


      it 'creates system note about merge_request reopen' 

    end

    it 'updates metrics' 


    it 'refreshes the number of open merge requests for a valid MR' 


    context 'current user is not authorized to reopen merge request' do
      before do
        perform_enqueued_jobs do
          @merge_request = described_class.new(project, guest).execute(merge_request)
        end
      end

      it 'does not reopen the merge request' 

    end
  end
end

