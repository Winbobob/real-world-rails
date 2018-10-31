require 'rails_helper'

RSpec.describe AfterBlockService, type: :service do
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
end

