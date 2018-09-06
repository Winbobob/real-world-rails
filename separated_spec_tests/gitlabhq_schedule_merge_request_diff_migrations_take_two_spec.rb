require 'spec_helper'
require Rails.root.join('db', 'post_migrate', '20170926150348_schedule_merge_request_diff_migrations_take_two')

describe ScheduleMergeRequestDiffMigrationsTakeTwo, :migration, :sidekiq do
  let(:merge_request_diffs) { table(:merge_request_diffs) }
  let(:merge_requests) { table(:merge_requests) }
  let(:projects) { table(:projects) }

  before do
    stub_const("#{described_class.name}::BATCH_SIZE", 1)

    projects.create!(id: 1, name: 'gitlab', path: 'gitlab')

    merge_requests.create!(id: 1, target_project_id: 1, source_project_id: 1, target_branch: 'feature', source_branch: 'master')

    merge_request_diffs.create!(id: 1, merge_request_id: 1, st_commits: YAML.dump([]), st_diffs: nil)
    merge_request_diffs.create!(id: 2, merge_request_id: 1, st_commits: nil, st_diffs: YAML.dump([]))
    merge_request_diffs.create!(id: 3, merge_request_id: 1, st_commits: nil, st_diffs: nil)
    merge_request_diffs.create!(id: 4, merge_request_id: 1, st_commits: YAML.dump([]), st_diffs: YAML.dump([]))
  end

  it 'correctly schedules background migrations' 


  it 'migrates the data' 

end

