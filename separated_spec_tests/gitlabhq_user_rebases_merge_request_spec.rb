require "spec_helper"

describe "User rebases a merge request", :js do
  let(:merge_request) { create(:merge_request, :simple, source_project: project) }
  let(:user) { project.owner }

  before do
    sign_in(user)
  end

  shared_examples "rebases" do
    it "rebases" 

  end

  context "when merge is regular" do
    let(:project) { create(:project, :public, :repository, merge_requests_rebase_enabled: true) }

    it_behaves_like "rebases"
  end

  context "when merge is ff-only" do
    let(:project) { create(:project, :public, :repository, merge_requests_ff_only_enabled: true) }

    it_behaves_like "rebases"
  end
end

