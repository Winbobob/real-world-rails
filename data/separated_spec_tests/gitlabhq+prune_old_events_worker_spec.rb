require 'spec_helper'

describe PruneOldEventsWorker do
  describe '#perform' do
    let(:user) { create(:user) }

    let!(:expired_event) { create(:event, :closed, author: user, created_at: 25.months.ago) }
    let!(:not_expired_1_day_event) { create(:event, :closed, author: user,  created_at: 1.day.ago) }
    let!(:not_expired_13_month_event) { create(:event, :closed, author: user,  created_at: 13.months.ago) }
    let!(:not_expired_2_years_event) { create(:event, :closed, author: user, created_at: 2.years.ago) }

    it 'prunes events older than 2 years' 


    it 'leaves fresh events' 


    it 'leaves events from 13 months ago' 


    it 'leaves events from 2 years ago' 

  end
end

