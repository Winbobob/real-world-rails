require 'spec_helper'
require Rails.root.join('db', 'post_migrate', '20171128214150_schedule_populate_merge_request_metrics_with_events_data.rb')

describe SchedulePopulateMergeRequestMetricsWithEventsData, :migration, :sidekiq do
  # commits_count attribute is added in a next migration
  before do
    allow_any_instance_of(MergeRequestDiff)
      .to receive(:commits_count=).and_return(nil)
  end

  let!(:mrs) { create_list(:merge_request, 3) } # rubocop:disable RSpec/FactoriesInMigrationSpecs

  it 'correctly schedules background migrations' 

end

