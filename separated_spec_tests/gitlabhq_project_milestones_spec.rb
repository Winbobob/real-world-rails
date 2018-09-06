require 'spec_helper'

describe API::ProjectMilestones do
  let(:user) { create(:user) }
  let!(:project) { create(:project, namespace: user.namespace ) }
  let!(:closed_milestone) { create(:closed_milestone, project: project, title: 'version1', description: 'closed milestone') }
  let!(:milestone) { create(:milestone, project: project, title: 'version2', description: 'open milestone') }

  before do
    project.add_developer(user)
  end

  it_behaves_like 'group and project milestones', "/projects/:id/milestones"  do
    let(:route) { "/projects/#{project.id}/milestones" }
  end

  describe 'DELETE /projects/:id/milestones/:milestone_id' do
    let(:guest) { create(:user) }
    let(:reporter) { create(:user) }

    before do
      project.add_reporter(reporter)
    end

    it 'returns 404 response when the project does not exists' 


    it 'returns 404 response when the milestone does not exists' 


    it "returns 404 from guest user deleting a milestone" 


    it "rejects a member with reporter access from deleting a milestone" 


    it 'deletes the milestone when the user has developer access to the project' 

  end

  describe 'PUT /projects/:id/milestones/:milestone_id to test observer on close' do
    it 'creates an activity event when an milestone is closed' 

  end
end
