require 'spec_helper'

describe Gitlab::BackgroundMigration::MigrateEventsToPushEventPayloads::Event, :migration, schema: 20170608152748 do
  describe '#commit_title' do
    it 'returns nil when there are no commits' 


    it 'returns nil when there are commits without commit messages' 


    it 'returns the commit message when it is less than 70 characters long' 


    it 'returns the first line of a commit message if multiple lines are present' 


    it 'truncates the commit to 70 characters when it is too long' 

  end

  describe '#commit_from_sha' do
    it 'returns nil when pushing to a new ref' 


    it 'returns the ID of the first commit when pushing to an existing ref' 

  end

  describe '#commit_to_sha' do
    it 'returns nil when removing an existing ref' 


    it 'returns the ID of the last commit when pushing to an existing ref' 

  end

  describe '#data' do
    it 'returns the deserialized data' 


    it 'returns an empty hash when no data is present' 

  end

  describe '#commits' do
    it 'returns an Array of commits' 


    it 'returns an empty array when no data is present' 

  end

  describe '#commit_count' do
    it 'returns the number of commits' 


    it 'returns 0 when no data is present' 

  end

  describe '#ref' do
    it 'returns the name of the ref' 

  end

  describe '#trimmed_ref_name' do
    it 'returns the trimmed ref name for a branch' 


    it 'returns the trimmed ref name for a tag' 

  end

  describe '#create?' do
    it 'returns true when creating a new ref' 


    it 'returns false when pushing to an existing ref' 

  end

  describe '#remove?' do
    it 'returns true when removing an existing ref' 


    it 'returns false when pushing to an existing ref' 

  end

  describe '#push_action' do
    let(:event) { described_class.new }

    it 'returns :created when creating a new ref' 


    it 'returns :removed when removing an existing ref' 


    it 'returns :pushed when pushing to an existing ref' 

  end

  describe '#ref_type' do
    let(:event) { described_class.new }

    it 'returns :tag for a tag' 


    it 'returns :branch for a branch' 

  end
end

##
# The background migration relies on a temporary table, hence we're migrating
# to a specific version of the database where said table is still present.
#
describe Gitlab::BackgroundMigration::MigrateEventsToPushEventPayloads, :migration, schema: 20170825154015 do
  let(:user_class) do
    Class.new(ActiveRecord::Base) do
      self.table_name = 'users'
    end
  end

  let(:migration) { described_class.new }
  let(:user_class) { table(:users) }
  let(:author) { build(:user).becomes(user_class).tap(&:save!).becomes(User) }
  let(:namespace) { create(:namespace, owner: author) }
  let(:projects) { table(:projects) }
  let(:project) { projects.create(namespace_id: namespace.id, creator_id: author.id) }

  # We can not rely on FactoryBot as the state of Event may change in ways that
  # the background migration does not expect, hence we use the Event class of
  # the migration itself.
  def create_push_event(project, author, data = nil)
    klass = Gitlab::BackgroundMigration::MigrateEventsToPushEventPayloads::Event

    klass.create!(
      action: klass::PUSHED,
      project_id: project.id,
      author_id: author.id,
      data: data
    )
  end

  describe '#perform' do
    it 'returns if data should not be migrated' 


    it 'migrates the range of events if data is to be migrated' 

  end

  describe '#process_event' do
    it 'processes a regular event' 


    it 'processes a push event' 


    it 'handles an error gracefully' 

  end

  describe '#replicate_event' do
    it 'replicates the event to the "events_for_migration" table' 

  end

  describe '#create_push_event_payload' do
    let(:push_data) do
      {
        commits: [],
        ref: 'refs/heads/master',
        before: '156e0e9adc587a383a7eeb5b21ddecb9044768a8',
        after: '0' * 40,
        total_commits_count: 1
      }
    end

    let(:event) do
      create_push_event(project, author, push_data)
    end

    before do
      # The foreign key in push_event_payloads at this point points to the
      # "events_for_migration" table so we need to make sure a row exists in
      # said table.
      migration.replicate_event(event)
    end

    it 'creates a push event payload for an event' 


    it 'does not create push event payloads for removed events' 


    it 'encodes and decodes the commit IDs from and to binary data' 

  end

  describe '#find_events' do
    it 'returns the events for the given ID range' 

  end

  describe '#migrate?' do
    it 'returns true when data should be migrated' 


    it 'returns false if the "events" table does not exist' 


    it 'returns false if the "push_event_payloads" table does not exist' 


    it 'returns false when the "events_for_migration" table does not exist' 

  end

  describe '#pack' do
    it 'packs a SHA1 into a 20 byte binary string' 


    it 'returns nil if the input value is nil' 

  end
end

