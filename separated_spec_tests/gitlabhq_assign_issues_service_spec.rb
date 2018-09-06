require 'spec_helper'

describe MergeRequests::AssignIssuesService do
  let(:user) { create(:user) }
  let(:project) { create(:project, :public, :repository) }
  let(:issue) { create(:issue, project: project) }
  let(:merge_request) { create(:merge_request, :simple, source_project: project, author: user, description: "fixes #{issue.to_reference}") }
  let(:service) { described_class.new(project, user, merge_request: merge_request) }

  before do
    project.add_developer(user)
  end

  it 'finds unassigned issues fixed in merge request' 


  it 'ignores issues the user cannot update assignee on' 


  it 'ignores issues already assigned to any user' 


  it 'ignores all issues unless current_user is merge_request.author' 


  it 'accepts precomputed data for closes_issues' 


  it 'assigns these to the merge request owner' 


  it 'ignores external issues' 

end

