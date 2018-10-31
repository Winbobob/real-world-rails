require 'spec_helper'

describe UpdateUserActivityWorker, :clean_gitlab_redis_shared_state do
  let(:user_active_2_days_ago) { create(:user, current_sign_in_at: 10.months.ago) }
  let(:user_active_yesterday_1) { create(:user) }
  let(:user_active_yesterday_2) { create(:user) }
  let(:user_active_today) { create(:user) }
  let(:data) do
    {
      user_active_2_days_ago.id.to_s => 2.days.ago.at_midday.to_i.to_s,
      user_active_yesterday_1.id.to_s => 1.day.ago.at_midday.to_i.to_s,
      user_active_yesterday_2.id.to_s => 1.day.ago.at_midday.to_i.to_s,
      user_active_today.id.to_s => Time.now.to_i.to_s
    }
  end

  it 'updates users.last_activity_on' 


  it 'deletes the pairs from SharedState' 

end

