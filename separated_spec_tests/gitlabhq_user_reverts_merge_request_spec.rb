require 'spec_helper'

describe 'User reverts a merge request', :js do
  let(:merge_request) { create(:merge_request, :with_diffs, :simple, source_project: project) }
  let(:project) { create(:project, :public, :repository) }
  let(:user) { create(:user) }

  before do
    project.add_developer(user)
    sign_in(user)

    visit(merge_request_path(merge_request))

    click_button('Merge')

    visit(merge_request_path(merge_request))
  end

  it 'reverts a merge request' 


  it 'does not revert a merge request that was previously reverted' 


  it 'reverts a merge request in a new merge request' 


  it 'cannot revert a merge requests for an archived project' 

end

