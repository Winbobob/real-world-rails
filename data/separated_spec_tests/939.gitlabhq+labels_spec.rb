require 'spec_helper'

describe API::Labels do
  let(:user) { create(:user) }
  let(:project) { create(:project, creator_id: user.id, namespace: user.namespace) }
  let!(:label1) { create(:label, title: 'label1', project: project) }
  let!(:priority_label) { create(:label, title: 'bug', project: project, priority: 3) }

  before do
    project.add_maintainer(user)
  end

  describe 'GET /projects/:id/labels' do
    it 'returns all available labels to the project' 

  end

  describe 'POST /projects/:id/labels' do
    it 'returns created label when all params' 


    it 'returns created label when only required params' 


    it 'creates a prioritized label' 


    it 'returns a 400 bad request if name not given' 


    it 'returns a 400 bad request if color not given' 


    it 'returns 400 for invalid color' 


    it 'returns 400 for too long color code' 


    it 'returns 400 for invalid name' 


    it 'returns 409 if label already exists in group' 


    it 'returns 400 for invalid priority' 


    it 'returns 409 if label already exists in project' 

  end

  describe 'DELETE /projects/:id/labels' do
    it 'returns 204 for existing label' 


    it 'returns 404 for non existing label' 


    it 'returns 400 for wrong parameters' 


    it_behaves_like '412 response' do
      let(:request) { api("/projects/#{project.id}/labels", user) }
      let(:params) { { name: 'label1' } }
    end
  end

  describe 'PUT /projects/:id/labels' do
    it 'returns 200 if name and colors and description are changed' 


    it 'returns 200 if name is changed' 


    it 'returns 200 if colors is changed' 


    it 'returns 200 if description is changed' 


    it 'returns 200 if priority is changed' 


    it 'returns 200 if a priority is added' 


    it 'returns 200 if the priority is removed' 


    it 'returns 404 if label does not exist' 


    it 'returns 400 if no label name given' 


    it 'returns 400 if no new parameters given' 


    it 'returns 400 for invalid name' 


    it 'returns 400 when color code is too short' 


    it 'returns 400 for too long color code' 


    it 'returns 400 for invalid priority' 

  end

  describe "POST /projects/:id/labels/:label_id/subscribe" do
    context "when label_id is a label title" do
      it "subscribes to the label" 

    end

    context "when label_id is a label ID" do
      it "subscribes to the label" 

    end

    context "when user is already subscribed to label" do
      before do
        label1.subscribe(user, project)
      end

      it "returns 304" 

    end

    context "when label ID is not found" do
      it "returns 404 error" 

    end
  end

  describe "POST /projects/:id/labels/:label_id/unsubscribe" do
    before do
      label1.subscribe(user, project)
    end

    context "when label_id is a label title" do
      it "unsubscribes from the label" 

    end

    context "when label_id is a label ID" do
      it "unsubscribes from the label" 

    end

    context "when user is already unsubscribed from label" do
      before do
        label1.unsubscribe(user, project)
      end

      it "returns 304" 

    end

    context "when label ID is not found" do
      it "returns 404 error" 

    end
  end
end

