require 'spec_helper'

describe 'User creates a merge request', :js do
  let(:project) { create(:project, :repository) }
  let(:user) { create(:user) }

  before do
    project.add_master(user)
    sign_in(user)

    visit(project_new_merge_request_path(project))
  end

  it 'creates a merge request' 

end

