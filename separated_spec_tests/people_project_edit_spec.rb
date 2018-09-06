require 'spec_helper'

describe 'Project editing', js: true do
  let!(:admin_user) { create :user, :admin }
  let!(:user) { create :user, :developer }
  let(:project) { create(:project) }
  let!(:potential_project) { create :project, :potential }
  let!(:membership) { create :membership, project: potential_project, user: user }

  let!(:project_edit_page) { App.new.project_edit_page }

  before do
    log_in_as admin_user
    project_edit_page.load(project_id: project.id)
  end

  describe 'regular projects' do
    it 'allows to edit project' 

  end

  describe 'potential projects' do
    before { project_edit_page.load(project_id: potential_project.id) }

    context "when 'stays' is unchecked" do
      it 'shows potential memberships' 


      it 'deletes membership when project is updated to nonpotential' 

    end

    context "when 'stays' is checked" do
      it 'shows potential memberships' 


      it "doesn't delete membership when project is updated to nonpotential" 

    end
  end
end

