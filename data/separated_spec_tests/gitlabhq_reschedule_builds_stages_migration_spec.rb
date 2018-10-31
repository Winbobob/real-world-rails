require 'spec_helper'
require Rails.root.join('db', 'post_migrate', '20180405101928_reschedule_builds_stages_migration')

describe RescheduleBuildsStagesMigration, :sidekiq, :migration do
  let(:namespaces) { table(:namespaces) }
  let(:projects) { table(:projects) }
  let(:pipelines) { table(:ci_pipelines) }
  let(:stages) { table(:ci_stages) }
  let(:jobs) { table(:ci_builds) }

  before do
    stub_const("#{described_class}::BATCH_SIZE", 1)

    namespaces.create(id: 12, name: 'gitlab-org', path: 'gitlab-org')
    projects.create!(id: 123, namespace_id: 12, name: 'gitlab', path: 'gitlab')
    pipelines.create!(id: 1, project_id: 123, ref: 'master', sha: 'adf43c3a')
    stages.create!(id: 1, project_id: 123, pipeline_id: 1, name: 'test')

    jobs.create!(id: 11, commit_id: 1, project_id: 123, stage_id: nil)
    jobs.create!(id: 206, commit_id: 1, project_id: 123, stage_id: nil)
    jobs.create!(id: 3413, commit_id: 1, project_id: 123, stage_id: nil)
    jobs.create!(id: 4109, commit_id: 1, project_id: 123, stage_id: 1)
  end

  it 'schedules delayed background migrations in batches in bulk' 

end

