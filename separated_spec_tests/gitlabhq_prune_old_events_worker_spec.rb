require 'spec_helper'

describe PruneOldEventsWorker do
  describe '#perform' do
    let(:user) { create(:user) }

    let!(:expired_event) { create(:event, :closed, author: user, created_at: 13.months.ago) }
    let!(:not_expired_event) { create(:event, :closed, author: user,  created_at: 1.day.ago) }
    let!(:exactly_12_months_event) { create(:event, :closed, author: user, created_at: 12.months.ago) }

    it 'prunes events older than 12 months' 


    it 'leaves fresh events' 


    it 'leaves events from exactly 12 months ago' 

  end
end

