require 'spec_helper'

describe Gitlab::BackgroundMigration::PopulateMergeRequestsLatestMergeRequestDiffId, :migration, schema: 20171026082505 do
  let(:projects_table) { table(:projects) }
  let(:merge_requests_table) { table(:merge_requests) }
  let(:merge_request_diffs_table) { table(:merge_request_diffs) }

  let(:project) { projects_table.create!(name: 'gitlab', path: 'gitlab-org/gitlab-ce') }

  def create_mr!(name, diffs: 0)
    merge_request =
      merge_requests_table.create!(target_project_id: project.id,
                                   target_branch: 'master',
                                   source_project_id: project.id,
                                   source_branch: name,
                                   title: name)

    diffs.times do
      merge_request_diffs_table.create!(merge_request_id: merge_request.id)
    end

    merge_request
  end

  def diffs_for(merge_request)
    merge_request_diffs_table.where(merge_request_id: merge_request.id)
  end

  describe '#perform' do
    it 'ignores MRs without diffs' 


    it 'ignores MRs that have a diff ID already set' 


    it 'migrates multiple MR diffs to the correct values' 

  end
end

