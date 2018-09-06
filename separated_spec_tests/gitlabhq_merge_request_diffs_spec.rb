require "spec_helper"

describe API::V3::MergeRequestDiffs, 'MergeRequestDiffs' do
  let!(:user)          { create(:user) }
  let!(:merge_request) { create(:merge_request, importing: true) }
  let!(:project)       { merge_request.target_project }

  before do
    merge_request.merge_request_diffs.create(head_commit_sha: '6f6d7e7ed97bb5f0054f2b1df789b39ca89b6ff9')
    merge_request.merge_request_diffs.create(head_commit_sha: '5937ac0a7beb003549fc5fd26fc247adbce4a52e')
    project.add_master(user)
  end

  describe 'GET /projects/:id/merge_requests/:merge_request_id/versions' do
    it 'returns 200 for a valid merge request' 


    it 'returns a 404 when merge_request_id not found' 

  end

  describe 'GET /projects/:id/merge_requests/:merge_request_id/versions/:version_id' do
    it 'returns a 200 for a valid merge request' 


    it 'returns a 404 when merge_request_id not found' 

  end
end

