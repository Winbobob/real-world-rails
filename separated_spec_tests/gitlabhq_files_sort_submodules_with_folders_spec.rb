require 'spec_helper'

describe 'Projects > Files > User views files page' do
  let(:project) { create(:forked_project_with_submodules) }
  let(:user) { project.owner }

  before do
    sign_in user
    visit project_tree_path(project, project.repository.root_ref)
  end

  it 'user sees folders and submodules sorted together, followed by files' 

end

