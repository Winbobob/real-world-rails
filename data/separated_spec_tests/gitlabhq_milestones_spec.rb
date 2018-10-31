require 'spec_helper'

describe API::V3::Milestones do
  let(:user) { create(:user) }
  let!(:project) { create(:project, namespace: user.namespace ) }
  let!(:closed_milestone) { create(:closed_milestone, project: project) }
  let!(:milestone) { create(:milestone, project: project) }

  before { project.add_developer(user) }

  describe 'GET /projects/:id/milestones' do
    it 'returns project milestones' 


    it 'returns a 401 error if user not authenticated' 


    it 'returns an array of active milestones' 


    it 'returns an array of closed milestones' 

  end

  describe 'GET /projects/:id/milestones/:milestone_id' do
    it 'returns a project milestone by id' 


    it 'returns a project milestone by iid' 


    it 'returns a project milestone by iid array' 


    it 'returns 401 error if user not authenticated' 


    it 'returns a 404 error if milestone id not found' 

  end

  describe 'POST /projects/:id/milestones' do
    it 'creates a new project milestone' 


    it 'creates a new project milestone with description and dates' 


    it 'returns a 400 error if title is missing' 


    it 'returns a 400 error if params are invalid (duplicate title)' 


    it 'creates a new project with reserved html characters' 

  end

  describe 'PUT /projects/:id/milestones/:milestone_id' do
    it 'updates a project milestone' 


    it 'removes a due date if nil is passed' 


    it 'returns a 404 error if milestone id not found' 

  end

  describe 'PUT /projects/:id/milestones/:milestone_id to close milestone' do
    it 'updates a project milestone' 

  end

  describe 'PUT /projects/:id/milestones/:milestone_id to test observer on close' do
    it 'creates an activity event when an milestone is closed' 

  end

  describe 'GET /projects/:id/milestones/:milestone_id/issues' do
    before do
      milestone.issues << create(:issue, project: project)
    end
    it 'returns project issues for a particular milestone' 


    it 'matches V3 response schema for a list of issues' 


    it 'returns a 401 error if user not authenticated' 


    describe 'confidential issues' do
      let(:public_project) { create(:project, :public) }
      let(:milestone) { create(:milestone, project: public_project) }
      let(:issue) { create(:issue, project: public_project) }
      let(:confidential_issue) { create(:issue, confidential: true, project: public_project) }

      before do
        public_project.add_developer(user)
        milestone.issues << issue << confidential_issue
      end

      it 'returns confidential issues to team members' 


      it 'does not return confidential issues to team members with guest role' 


      it 'does not return confidential issues to regular users' 

    end
  end
end

