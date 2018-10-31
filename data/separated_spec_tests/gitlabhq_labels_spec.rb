require 'spec_helper'

describe API::V3::Labels do
  let(:user) { create(:user) }
  let(:project) { create(:project, creator_id: user.id, namespace: user.namespace) }
  let!(:label1) { create(:label, title: 'label1', project: project) }
  let!(:priority_label) { create(:label, title: 'bug', project: project, priority: 3) }

  before do
    project.add_master(user)
  end

  describe 'GET /projects/:id/labels' do
    it 'returns all available labels to the project' 

  end

  describe "POST /projects/:id/labels/:label_id/subscription" do
    context "when label_id is a label title" do
      it "subscribes to the label" 

    end

    context "when label_id is a label ID" do
      it "subscribes to the label" 

    end

    context "when user is already subscribed to label" do
      before { label1.subscribe(user, project) }

      it "returns 304" 

    end

    context "when label ID is not found" do
      it "returns 404 error" 

    end
  end

  describe "DELETE /projects/:id/labels/:label_id/subscription" do
    before { label1.subscribe(user, project) }

    context "when label_id is a label title" do
      it "unsubscribes from the label" 

    end

    context "when label_id is a label ID" do
      it "unsubscribes from the label" 

    end

    context "when user is already unsubscribed from label" do
      before { label1.unsubscribe(user, project) }

      it "returns 304" 

    end

    context "when label ID is not found" do
      it "returns 404 error" 

    end
  end

  describe 'DELETE /projects/:id/labels' do
    it 'returns 200 for existing label' 


    it 'returns 404 for non existing label' 


    it 'returns 400 for wrong parameters' 

  end
end

