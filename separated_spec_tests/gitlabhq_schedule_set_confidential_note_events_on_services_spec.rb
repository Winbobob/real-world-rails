require 'spec_helper'
require Rails.root.join('db', 'post_migrate', '20180122154930_schedule_set_confidential_note_events_on_services.rb')

describe ScheduleSetConfidentialNoteEventsOnServices, :migration, :sidekiq do
  let(:services_table) { table(:services) }
  let(:migration_class) { Gitlab::BackgroundMigration::SetConfidentialNoteEventsOnServices }
  let(:migration_name)  { migration_class.to_s.demodulize }

  let!(:service_1)        { services_table.create!(confidential_note_events: nil, note_events: true) }
  let!(:service_2)        { services_table.create!(confidential_note_events: nil, note_events: true) }
  let!(:service_migrated) { services_table.create!(confidential_note_events: true, note_events: true) }
  let!(:service_skip)     { services_table.create!(confidential_note_events: nil, note_events: false) }
  let!(:service_new)      { services_table.create!(confidential_note_events: false, note_events: true) }
  let!(:service_4)        { services_table.create!(confidential_note_events: nil, note_events: true) }

  before do
    stub_const("#{described_class}::BATCH_SIZE", 1)
  end

  it 'schedules background migrations at correct time' 


  it 'correctly processes services' 

end

