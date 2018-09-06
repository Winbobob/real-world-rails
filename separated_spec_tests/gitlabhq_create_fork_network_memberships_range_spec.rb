require 'spec_helper'

describe Gitlab::BackgroundMigration::CreateForkNetworkMembershipsRange, :migration, schema: 20170929131201 do
  let(:migration) { described_class.new }
  let(:projects) { table(:projects) }

  let(:base1) { projects.create }
  let(:base1_fork1) { projects.create }
  let(:base1_fork2) { projects.create }

  let(:base2) { projects.create }
  let(:base2_fork1) { projects.create }
  let(:base2_fork2) { projects.create }

  let(:fork_of_fork) { projects.create }
  let(:fork_of_fork2) { projects.create }
  let(:second_level_fork) { projects.create }
  let(:third_level_fork) { projects.create }

  let(:fork_network1) { fork_networks.find_by(root_project_id: base1.id) }
  let(:fork_network2) { fork_networks.find_by(root_project_id: base2.id) }

  let!(:forked_project_links) { table(:forked_project_links) }
  let!(:fork_networks) { table(:fork_networks) }
  let!(:fork_network_members) { table(:fork_network_members) }

  before do
    # The fork-network relation created for the forked project
    fork_networks.create(id: 1, root_project_id: base1.id)
    fork_network_members.create(project_id: base1.id, fork_network_id: 1)
    fork_networks.create(id: 2, root_project_id: base2.id)
    fork_network_members.create(project_id: base2.id, fork_network_id: 2)

    # Normal fork links
    forked_project_links.create(id: 1, forked_from_project_id: base1.id, forked_to_project_id: base1_fork1.id)
    forked_project_links.create(id: 2, forked_from_project_id: base1.id, forked_to_project_id: base1_fork2.id)
    forked_project_links.create(id: 3, forked_from_project_id: base2.id, forked_to_project_id: base2_fork1.id)
    forked_project_links.create(id: 4, forked_from_project_id: base2.id, forked_to_project_id: base2_fork2.id)

    # Fork links
    forked_project_links.create(id: 5, forked_from_project_id: base1_fork1.id, forked_to_project_id: fork_of_fork.id)
    forked_project_links.create(id: 6, forked_from_project_id: base1_fork1.id, forked_to_project_id: fork_of_fork2.id)

    # Forks 3 levels down
    forked_project_links.create(id: 7, forked_from_project_id: fork_of_fork.id, forked_to_project_id: second_level_fork.id)
    forked_project_links.create(id: 8, forked_from_project_id: second_level_fork.id, forked_to_project_id: third_level_fork.id)

    migration.perform(1, 8)
  end

  it 'creates a memberships for the direct forks' 


  it 'adds the fork network members for forks of forks' 


  it 'reschedules itself when there are missing members' 


  it 'can be repeated without effect' 


  it 'knows it is finished for this range' 


  it 'does not miss members for forks of forks for which the root was deleted' 


  context 'with more forks' do
    before do
      forked_project_links.create(id: 9, forked_from_project_id: fork_of_fork.id, forked_to_project_id: projects.create.id)
      forked_project_links.create(id: 10, forked_from_project_id: fork_of_fork.id, forked_to_project_id: projects.create.id)
    end

    it 'only processes a single batch of links at a time' 


    it 'knows when not all memberships withing a batch have been created' 

  end
end

