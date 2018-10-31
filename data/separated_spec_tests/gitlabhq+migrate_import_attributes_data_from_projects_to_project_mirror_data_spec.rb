require 'spec_helper'
require Rails.root.join('db', 'post_migrate', '20180502134117_migrate_import_attributes_data_from_projects_to_project_mirror_data.rb')

describe MigrateImportAttributesDataFromProjectsToProjectMirrorData, :sidekiq, :migration do
  let(:namespaces) { table(:namespaces) }
  let(:projects) { table(:projects) }
  let(:import_state) { table(:project_mirror_data) }

  before do
    stub_const("#{described_class}::BATCH_SIZE", 1)
    namespaces.create(id: 1, name: 'gitlab-org', path: 'gitlab-org')

    projects.create!(id: 1, namespace_id: 1, name: 'gitlab1',
                     path: 'gitlab1', import_error: "foo", import_status: :started,
                     import_url: generate(:url))
    projects.create!(id: 2, namespace_id: 1, name: 'gitlab2',
                     path: 'gitlab2', import_error: "bar", import_status: :failed,
                     import_url: generate(:url))
    projects.create!(id: 3, namespace_id: 1, name: 'gitlab3', path: 'gitlab3', import_status: :none, import_url: generate(:url))
  end

  it 'schedules delayed background migrations in batches in bulk' 


  describe '#down' do
    before do
      import_state.create!(id: 1, project_id: 1, status: :started)
      import_state.create!(id: 2, project_id: 2, status: :started)
    end

    it 'schedules delayed background migrations in batches in bulk for rollback' 

  end
end

