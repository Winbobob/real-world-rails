require 'spec_helper'
require Rails.root.join('db', 'post_migrate', '20180104131052_schedule_set_confidential_note_events_on_webhooks.rb')

describe ScheduleSetConfidentialNoteEventsOnWebhooks, :migration, :sidekiq do
  let(:web_hooks_table) { table(:web_hooks) }
  let(:migration_class) { Gitlab::BackgroundMigration::SetConfidentialNoteEventsOnWebhooks }
  let(:migration_name)  { migration_class.to_s.demodulize }

  let!(:web_hook_1)        { web_hooks_table.create!(confidential_note_events: nil, note_events: true) }
  let!(:web_hook_2)        { web_hooks_table.create!(confidential_note_events: nil, note_events: true) }
  let!(:web_hook_migrated) { web_hooks_table.create!(confidential_note_events: true, note_events: true) }
  let!(:web_hook_skip)     { web_hooks_table.create!(confidential_note_events: nil, note_events: false) }
  let!(:web_hook_new)      { web_hooks_table.create!(confidential_note_events: false, note_events: true) }
  let!(:web_hook_4)        { web_hooks_table.create!(confidential_note_events: nil, note_events: true) }

  before do
    stub_const("#{described_class}::BATCH_SIZE", 1)
  end

  it 'schedules background migrations at correct time' 


  it 'correctly processes web hooks' 

end

