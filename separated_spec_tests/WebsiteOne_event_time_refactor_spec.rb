require 'spec_helper'
load 'db/migrate/20140725131327_event_combine_date_and_time_fields.rb'

ActiveRecord::Migration.verbose = false

describe 'EventCombineDateAndTimeFields', type: :migration do
  describe 'up' do
    before do
      ActiveRecord::Migration.verbose = false

      EventCombineDateAndTimeFields.new.down
      sql= %Q{INSERT INTO events (name, category, repeats, start_time, event_date, end_time, time_zone) VALUES ('test', 'PairProgramming', 'never', TIME'10:00', DATE'2013-06-17', TIME'11:00', 'UTC');}
      ApplicationRecord.connection.execute(sql)
    end

    it 'refactors events time fields' 

  end

  describe 'down' do
    before do
      FactoryBot.create(:event,
                        name: 'every Monday event',
                        category: 'Scrum',
                        start_datetime: 'Mon, 17 Jun 2013 09:00:00 UTC',
                        duration: 60)
    end

    it 'refactors events time fields' 

  end
end


