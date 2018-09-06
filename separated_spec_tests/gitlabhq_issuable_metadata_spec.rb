require 'spec_helper'

describe Gitlab::IssuableMetadata do
  let(:user)     { create(:user) }
  let!(:project) { create(:project, :public, :repository, creator: user, namespace: user.namespace) }

  subject { Class.new { include Gitlab::IssuableMetadata }.new }

  it 'returns an empty Hash if an empty collection is provided' 


  it 'raises an error when given a collection with no limit' 


  context 'issues' do
    let!(:issue) { create(:issue, author: user, project: project) }
    let!(:closed_issue) { create(:issue, state: :closed, author: user, project: project) }
    let!(:downvote) { create(:award_emoji, :downvote, awardable: closed_issue) }
    let!(:upvote) { create(:award_emoji, :upvote, awardable: issue) }
    let!(:merge_request) { create(:merge_request, :simple, author: user, assignee: user, source_project: project, target_project: project, title: "Test") }
    let!(:closing_issues) { create(:merge_requests_closing_issues, issue: issue, merge_request: merge_request) }

    it 'aggregates stats on issues' 

  end

  context 'merge requests' do
    let!(:merge_request) { create(:merge_request, :simple, author: user, assignee: user, source_project: project, target_project: project, title: "Test") }
    let!(:merge_request_closed) { create(:merge_request, state: "closed", source_project: project, target_project: project, title: "Closed Test") }
    let!(:downvote) { create(:award_emoji, :downvote, awardable: merge_request) }
    let!(:upvote) { create(:award_emoji, :upvote, awardable: merge_request) }
    let!(:note) { create(:note_on_merge_request, author: user, project: project, noteable: merge_request, note: "a comment on a MR") }

    it 'aggregates stats on merge requests' 

  end
end

