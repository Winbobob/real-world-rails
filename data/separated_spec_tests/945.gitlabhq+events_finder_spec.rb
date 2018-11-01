require 'spec_helper'

describe EventsFinder do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let(:project1) { create(:project, :private, creator_id: user.id, namespace: user.namespace) }
  let(:project2) { create(:project, :private, creator_id: user.id, namespace: user.namespace) }
  let(:closed_issue) { create(:closed_issue, project: project1, author: user) }
  let(:opened_merge_request) { create(:merge_request, source_project: project2, author: user) }
  let!(:closed_issue_event) { create(:event, project: project1, author: user, target: closed_issue, action: Event::CLOSED, created_at: Date.new(2016, 12, 30)) }
  let!(:opened_merge_request_event) { create(:event, project: project2, author: user, target: opened_merge_request, action: Event::CREATED, created_at: Date.new(2017, 1, 31)) }
  let(:closed_issue2) { create(:closed_issue, project: project1, author: user) }
  let(:opened_merge_request2) { create(:merge_request, source_project: project2, author: user) }
  let!(:closed_issue_event2) { create(:event, project: project1, author: user, target: closed_issue, action: Event::CLOSED, created_at: Date.new(2016, 2, 2)) }
  let!(:opened_merge_request_event2) { create(:event, project: project2, author: user, target: opened_merge_request, action: Event::CREATED, created_at: Date.new(2017, 2, 2)) }

  context 'when targeting a user' do
    it 'returns events between specified dates filtered on action and type' 


    it 'does not return events the current_user does not have access to' 


    it 'returns nothing when the current user cannot read cross project' 

  end

  context 'when targeting a project' do
    it 'returns project events between specified dates filtered on action and type' 


    it 'does not return events the current_user does not have access to' 

  end
end

