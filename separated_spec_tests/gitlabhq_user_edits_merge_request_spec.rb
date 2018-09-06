require 'spec_helper'

describe 'User edits a merge request', :js do
  include Select2Helper

  let(:project) { create(:project, :repository) }
  let(:merge_request) { create(:merge_request, source_project: project, target_project: project) }
  let(:user) { create(:user) }

  before do
    project.add_master(user)
    sign_in(user)

    visit(edit_project_merge_request_path(project, merge_request))
  end

  it 'changes the target branch' 

end

