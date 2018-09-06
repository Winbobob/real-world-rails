require 'spec_helper'

describe ScheduleUpdateUserActivityWorker, :clean_gitlab_redis_shared_state do
  let(:now) { Time.now }

  before do
    Gitlab::UserActivities.record('1', now)
    Gitlab::UserActivities.record('2', now)
  end

  it 'schedules UpdateUserActivityWorker once' 


  context 'when specifying a batch size' do
    it 'schedules UpdateUserActivityWorker twice' 

  end
end

