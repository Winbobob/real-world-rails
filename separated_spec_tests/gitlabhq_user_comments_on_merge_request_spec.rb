require 'spec_helper'

describe 'User comments on a merge request', :js do
  include RepoHelpers

  let(:project) { create(:project, :repository) }
  let(:merge_request) { create(:merge_request, source_project: project, target_project: project) }
  let(:user) { create(:user) }

  before do
    project.add_master(user)
    sign_in(user)

    visit(merge_request_path(merge_request))
  end

  it 'adds a comment' 


  it 'loads new comment' 

end

