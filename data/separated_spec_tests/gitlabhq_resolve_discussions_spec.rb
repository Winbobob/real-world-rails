require 'spec_helper.rb'

describe Issues::ResolveDiscussions do
  class DummyService < Issues::BaseService
    include ::Issues::ResolveDiscussions

    def initialize(*args)
      super
      filter_resolve_discussion_params
    end
  end

  let(:project) { create(:project, :repository) }
  let(:user) { create(:user) }

  before do
    project.add_developer(user)
  end

  describe "for resolving discussions" do
    let(:discussion) { create(:diff_note_on_merge_request, project: project, note: "Almost done").to_discussion }
    let(:merge_request) { discussion.noteable }
    let(:other_merge_request) { create(:merge_request, source_project: project, source_branch: "fix") }

    describe "#merge_request_for_resolving_discussion" do
      let(:service) { DummyService.new(project, user, merge_request_to_resolve_discussions_of: merge_request.iid) }

      it "finds the merge request" 


      it "only queries for the merge request once" 

    end

    describe "#discussions_to_resolve" do
      it "contains a single discussion when matching merge request and discussion are passed" 


      it "contains all discussions when only a merge request is passed" 


      it "contains only unresolved discussions" 


      it "is empty when a discussion and another merge request are passed" 

    end
  end
end

