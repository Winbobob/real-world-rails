require 'rails_helper'

RSpec.describe MuteService, type: :service do
  subject do
    -> { described_class.new.call(account, target_account) }
  end

  let(:account) { Fabricate(:account) }
  let(:target_account) { Fabricate(:account) }

  describe 'home timeline' do
    let(:status) { Fabricate(:status, account: target_account) }
    let(:other_account_status) { Fabricate(:status) }
    let(:home_timeline_key) { FeedManager.instance.key(:home, account.id) }

    before do
      Redis.current.del(home_timeline_key)
    end

    it "clears account's statuses" 

  end

  it 'mutes account' 


  context 'without specifying a notifications parameter' do
    it 'mutes notifications from the account' 

  end

  context 'with a true notifications parameter' do
    subject do
      -> { described_class.new.call(account, target_account, notifications: true) }
    end

    it 'mutes notifications from the account' 

  end

  context 'with a false notifications parameter' do
    subject do
      -> { described_class.new.call(account, target_account, notifications: false) }
    end

    it 'does not mute notifications from the account' 

  end
end

