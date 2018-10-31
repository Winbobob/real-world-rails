require 'spec_helper'

describe RemoveExpiredGroupLinksWorker do
  describe '#perform' do
    let!(:expired_project_group_link) { create(:project_group_link, expires_at: 1.hour.ago) }
    let!(:project_group_link_expiring_in_future) { create(:project_group_link, expires_at: 10.days.from_now) }
    let!(:non_expiring_project_group_link) { create(:project_group_link, expires_at: nil) }

    it 'removes expired group links' 


    it 'leaves group links that expire in the future' 


    it 'leaves group links that do not expire at all' 

  end
end

