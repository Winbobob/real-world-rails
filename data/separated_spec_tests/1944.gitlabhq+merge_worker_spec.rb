require 'spec_helper'

describe MergeWorker do
  describe "remove source branch" do
    let!(:merge_request) { create(:merge_request, source_branch: "markdown") }
    let!(:source_project) { merge_request.source_project }
    let!(:project) { merge_request.project }
    let!(:author) { merge_request.author }

    before do
      source_project.add_maintainer(author)
      source_project.repository.expire_branches_cache
    end

    it 'clears cache of source repo after removing source branch' 

  end
end

