require 'spec_helper'

describe MergeRequests::CloseService do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:guest) { create(:user) }
  let(:merge_request) { create(:merge_request, assignee: user2, author: create(:user)) }
  let(:project) { merge_request.project }
  let!(:todo) { create(:todo, :assigned, user: user, project: project, target: merge_request, author: user2) }

  before do
    project.add_maintainer(user)
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
          @merge_request = service.execute(merge_request)
        end
      end

      it { expect(@merge_request).to be_valid }
      it { expect(@merge_request).to be_closed }

      it 'executes hooks with close action' 


      it 'sends email to user2 about assign of new merge_request' 


      it 'creates system note about merge_request reassign' 


      it 'marks todos as done' 

    end

    it 'updates metrics' 


    it 'refreshes the number of open merge requests for a valid MR', :use_clean_rails_memory_store_caching do
      service = described_class.new(project, user, {})

      expect { service.execute(merge_request) }
        .to change { project.open_merge_requests_count }.from(1).to(0)
    end

    context 'current user is not authorized to close merge request' do
      before do
        perform_enqueued_jobs do
          @merge_request = described_class.new(project, guest).execute(merge_request)
        end
      end

      it 'does not close the merge request' 

    end
  end
end
