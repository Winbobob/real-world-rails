require 'rails_helper'

describe FixSchedulesWorker do

  before :each do
    @feed = FactoryBot.create :feed

    # @feed has a scheduled update
    @job = double 'job', klass: 'ScheduledUpdateFeedWorker', args: [@feed.id]
    allow(Sidekiq::ScheduledSet).to receive(:new).and_return [@job]
  end

  it 'adds missing scheduled feed updates' 


  it 'schedules next update when it should have been scheduled' 


  it 'schedules next update in the following hour if feed has never been updated' 


  it 'does nothing for existing feed updates' 


  it 'does not add a schedule for an unavailable feed' 

end

