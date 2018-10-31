require 'spec_helper'

describe API::ProjectSnapshots do
  include WorkhorseHelpers

  let(:project) { create(:project) }
  let(:admin) { create(:admin) }

  describe 'GET /projects/:id/snapshot' do
    def expect_snapshot_response_for(repository)
      type, params = workhorse_send_data

      expect(type).to eq('git-snapshot')
      expect(params).to eq(
        'GitalyServer' => {
          'address' => Gitlab::GitalyClient.address(repository.project.repository_storage),
          'token' => Gitlab::GitalyClient.token(repository.project.repository_storage)
        },
        'GetSnapshotRequest' => Gitaly::GetSnapshotRequest.new(
          repository: repository.gitaly_repository
        ).to_json
      )
    end

    it 'returns authentication error as project owner' 


    it 'returns authentication error as unauthenticated user' 


    it 'requests project repository raw archive as administrator' 


    it 'requests wiki repository raw archive as administrator' 

  end
end

