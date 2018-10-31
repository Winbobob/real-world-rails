require "spec_helper"

describe API::MergeRequestDiffs, 'MergeRequestDiffs' do
  let!(:user)          { create(:user) }
  let!(:merge_request) { create(:merge_request, importing: true) }
  let!(:project)       { merge_request.target_project }

  before do
    merge_request.merge_request_diffs.create(head_commit_sha: '6f6d7e7ed97bb5f0054f2b1df789b39ca89b6ff9')
    merge_request.merge_request_diffs.create(head_commit_sha: '5937ac0a7beb003549fc5fd26fc247adbce4a52e')
    project.add_maintainer(user)
  end

  describe 'GET /projects/:id/merge_requests/:merge_request_iid/versions' do
    it 'returns 200 for a valid merge request' 


    it 'returns a 404 when merge_request id is used instead of the iid' 


    it 'returns a 404 when merge_request_iid not found' 

  end

  describe 'GET /projects/:id/merge_requests/:merge_request_iid/versions/:version_id' do
    let(:merge_request_diff) { merge_request.merge_request_diffs.first }

    it 'returns a 200 for a valid merge request' 


    it 'returns a 404 when merge_request id is used instead of the iid' 


    it 'returns a 404 when merge_request version_id is not found' 


    it 'returns a 404 when merge_request_iid is not found' 

  end
end

