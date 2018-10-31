require 'spec_helper'

describe AdminHelper do
  describe 'admin_display_date' do
    let(:time_now_in_zone) { Time.now.in_time_zone('Central Time (US & Canada)') }
    context 'today' do
      let(:target) { 'Today at 11:00am' }
      it 'returns today' 

    end
    context 'yesterday' do
      let(:target) { 'Yesterday at 11:27pm' }
      it 'returns yesterday' 

    end
    context 'other date' do
      let(:target) { '2/20/2017 at 10am' }
      let(:time) { Time.parse('2017-02-20T10:37:39.000-06:00') }
      it 'returns in correct format' 

    end
  end
end

