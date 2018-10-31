# frozen_string_literal: true

require 'spec_helper'

describe API::ResourceLabelEvents do
  set(:user) { create(:user) }
  set(:project) { create(:project, :public, :repository, namespace: user.namespace) }
  set(:private_user)    { create(:user) }

  before do
    project.add_developer(user)
  end

  shared_examples 'resource_label_events API' do |parent_type, eventable_type, id_name|
    describe "GET /#{parent_type}/:id/#{eventable_type}/:noteable_id/resource_label_events" do
      it "returns an array of resource label events" 


      it "returns a 404 error when eventable id not found" 


      it "returns 404 when not authorized" 

    end

    describe "GET /#{parent_type}/:id/#{eventable_type}/:noteable_id/resource_label_events/:event_id" do
      it "returns a resource label event by id" 


      it "returns a 404 error if resource label event not found" 

    end
  end

  context 'when eventable is an Issue' do
    let(:issue) { create(:issue, project: project, author: user) }

    it_behaves_like 'resource_label_events API', 'projects', 'issues', 'iid' do
      let(:parent) { project }
      let(:eventable) { issue }
      let!(:event) { create(:resource_label_event, issue: issue) }
    end
  end

  context 'when eventable is a Merge Request' do
    let(:merge_request) { create(:merge_request, source_project: project, target_project: project, author: user) }

    it_behaves_like 'resource_label_events API', 'projects', 'merge_requests', 'iid' do
      let(:parent) { project }
      let(:eventable) { merge_request }
      let!(:event) { create(:resource_label_event, merge_request: merge_request) }
    end
  end
end

