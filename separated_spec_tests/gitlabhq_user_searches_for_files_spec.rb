require 'spec_helper'

describe 'Projects > Files > User searches for files' do
  let(:user) { project.owner }

  before do
    sign_in(user)
  end

  describe 'project main screen' do
    context 'when project is empty' do
      let(:project) { create(:project) }

      before do
        visit project_path(project)
      end

      it 'does not show any result' 

    end

    context 'when project is not empty' do
      let(:project) { create(:project, :repository) }

      before do
        project.add_developer(user)
        visit project_path(project)
      end

      it 'shows "Find file" button' 

    end
  end

  describe 'project tree screen' do
    let(:project) { create(:project, :repository) }

    before do
      project.add_developer(user)
      visit project_tree_path(project, project.default_branch)
    end

    it 'shows found files' 

  end
end

