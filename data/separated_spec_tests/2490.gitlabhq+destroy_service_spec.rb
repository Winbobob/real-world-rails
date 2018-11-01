require 'spec_helper'

describe Issuable::DestroyService do
  let(:user) { create(:user) }
  let(:project) { create(:project, :public) }

  subject(:service) { described_class.new(project, user) }

  describe '#execute' do
    context 'when issuable is an issue' do
      let!(:issue) { create(:issue, project: project, author: user, assignees: [user]) }

      it 'destroys the issue' 


      it 'updates open issues count cache' 


      it 'updates the todo caches for users with todos on the issue' 


      it 'invalidates the issues count cache for the assignees' 

    end

    context 'when issuable is a merge request' do
      let!(:merge_request) { create(:merge_request, target_project: project, source_project: project, author: user, assignee: user) }

      it 'destroys the merge request' 


      it 'updates open merge requests count cache' 


      it 'invalidates the merge request caches for the MR assignee' 


      it 'updates the todo caches for users with todos on the merge request' 

    end
  end
end

