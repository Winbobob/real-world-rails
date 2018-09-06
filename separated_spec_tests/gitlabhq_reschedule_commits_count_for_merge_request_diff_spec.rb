require 'spec_helper'
require Rails.root.join('db', 'migrate', '20180309121820_reschedule_commits_count_for_merge_request_diff')

describe RescheduleCommitsCountForMergeRequestDiff, :migration, :sidekiq do
  let(:merge_request_diffs) { table(:merge_request_diffs) }
  let(:merge_requests) { table(:merge_requests) }
  let(:projects) { table(:projects) }
  let(:namespaces) { table(:namespaces) }

  before do
    stub_const("#{described_class.name}::BATCH_SIZE", 1)

    namespaces.create!(id: 1, name: 'gitlab', path: 'gitlab')

    projects.create!(id: 1, namespace_id: 1)

    merge_requests.create!(id: 1, target_project_id: 1, source_project_id: 1, target_branch: 'feature', source_branch: 'master')

    merge_request_diffs.create!(id: 1, merge_request_id: 1)
    merge_request_diffs.create!(id: 2, merge_request_id: 1)
    merge_request_diffs.create!(id: 3, merge_request_id: 1, commits_count: 0)
    merge_request_diffs.create!(id: 4, merge_request_id: 1)
  end

  it 'correctly schedules background migrations' 

end

