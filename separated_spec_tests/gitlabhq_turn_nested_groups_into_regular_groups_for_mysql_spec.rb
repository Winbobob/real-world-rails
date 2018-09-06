require 'spec_helper'
require Rails.root.join('db', 'migrate', '20170503140202_turn_nested_groups_into_regular_groups_for_mysql.rb')

describe TurnNestedGroupsIntoRegularGroupsForMysql do
  let!(:parent_group) { create(:group) } # rubocop:disable RSpec/FactoriesInMigrationSpecs
  let!(:child_group) { create(:group, parent: parent_group) } # rubocop:disable RSpec/FactoriesInMigrationSpecs
  let!(:project) { create(:project, :legacy_storage, :empty_repo, namespace: child_group) } # rubocop:disable RSpec/FactoriesInMigrationSpecs
  let!(:member) { create(:user) } # rubocop:disable RSpec/FactoriesInMigrationSpecs
  let(:migration) { described_class.new }

  before do
    parent_group.add_developer(member)

    allow(migration).to receive(:run_migration?).and_return(true)
    allow(migration).to receive(:verbose).and_return(false)
  end

  describe '#up' do
    let(:updated_project) do
      # path_with_namespace is memoized in an instance variable so we retrieve a
      # new row here to work around that.
      Project.find(project.id)
    end

    before do
      migration.up
    end

    it 'unsets the parent_id column' 


    it 'adds members of parent groups as members to the migrated group' 


    it 'update the path of the nested group' 


    it 'renames projects of the nested group' 


    it 'renames the repository of any projects' 


    it 'creates a redirect route for renamed projects' 

  end
end

