require 'spec_helper'

describe 'Projects > Files > User browses LFS files' do
  let(:project) { create(:project, :repository) }
  let(:user) { project.owner }

  before do
    sign_in(user)
  end

  context 'when LFS is disabled', :js do
    before do
      allow_any_instance_of(Project).to receive(:lfs_enabled?).and_return(false)
      visit project_tree_path(project, 'lfs')
    end

    it 'is possible to see raw content of LFS pointer' 

  end

  context 'when LFS is enabled' do
    before do
      allow_any_instance_of(Project).to receive(:lfs_enabled?).and_return(true)
      visit project_tree_path(project, 'lfs')
    end

    it 'shows an LFS object' 

  end
end

