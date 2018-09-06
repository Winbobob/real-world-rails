require 'spec_helper'

describe Gitlab::BackgroundMigration::PopulateForkNetworksRange, :migration, schema: 20170929131201 do
  let(:migration) { described_class.new }
  let(:projects) { table(:projects) }
  let(:base1) { projects.create }

  let(:base2) { projects.create }
  let(:base2_fork1) { projects.create }

  let!(:forked_project_links) { table(:forked_project_links) }
  let!(:fork_networks) { table(:fork_networks) }
  let!(:fork_network_members) { table(:fork_network_members) }

  let(:fork_network1) { fork_networks.find_by(root_project_id: base1.id) }
  let(:fork_network2) { fork_networks.find_by(root_project_id: base2.id) }

  before do
    # A normal fork link
    forked_project_links.create(id: 1,
                                forked_from_project_id: base1.id,
                                forked_to_project_id: projects.create.id)
    forked_project_links.create(id: 2,
                                forked_from_project_id: base1.id,
                                forked_to_project_id: projects.create.id)
    forked_project_links.create(id: 3,
                                forked_from_project_id: base2.id,
                                forked_to_project_id: base2_fork1.id)

    # create a fork of a fork
    forked_project_links.create(id: 4,
                                forked_from_project_id: base2_fork1.id,
                                forked_to_project_id: projects.create.id)
    forked_project_links.create(id: 5,
                                forked_from_project_id: projects.create.id,
                                forked_to_project_id: projects.create.id)

    # Stub out the calls to the other migrations
    allow(BackgroundMigrationWorker).to receive(:perform_in)

    migration.perform(1, 3)
  end

  it 'it creates the fork network' 


  it 'does not create a fork network for a fork-of-fork' 


  it 'creates memberships for the root of fork networks' 


  it 'creates a fork network for the fork of which the source was deleted' 


  it 'schedules a job for inserting memberships for forks-of-forks' 


  it 'only processes a single batch of links at a time' 


  it 'can be repeated without effect' 

end

