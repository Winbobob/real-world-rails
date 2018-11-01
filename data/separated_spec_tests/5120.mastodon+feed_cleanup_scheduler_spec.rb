require 'rails_helper'

describe Scheduler::FeedCleanupScheduler do
  subject { described_class.new }

  let!(:active_user) { Fabricate(:user, current_sign_in_at: 2.days.ago) }
  let!(:inactive_user) { Fabricate(:user, current_sign_in_at: 22.days.ago) }

  it 'clears feeds of inactives' 


  def feed_key_for(user, subtype = nil)
    FeedManager.instance.key(:home, user.account_id, subtype)
  end
end

