require 'spec_helper'

describe EventHelper do

  it 'extract event ocurrence from hash' 


  describe 'time ranges' do
    let(:current_time) { Time.utc(2016, 2, 9, 19, 0, 0) }
    let(:event) do
      double(:event,
             start_time: current_time,
             duration: 15.minutes,
             instance_end_time: current_time + 15.minutes)
    end

    before { Delorean.time_travel_to(current_time - 15.minutes) }

    after { Delorean.back_to_the_present }

    it 'returns a local time range' 

  end

  describe 'set_column_width' do
    it 'should be col-sm-2 when modifier_id exists' 


    it 'should be col-sm-4 when modifier_id does not exist' 

  end
end

