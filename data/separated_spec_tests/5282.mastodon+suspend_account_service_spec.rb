require 'rails_helper'

RSpec.describe SuspendAccountService, type: :service do
  describe '#call' do
    before do
      stub_request(:post, "https://alice.com/inbox").to_return(status: 201)
      stub_request(:post, "https://bob.com/inbox").to_return(status: 201)
    end

    subject do
      -> { described_class.new.call(account) }
    end

    let!(:account) { Fabricate(:account) }
    let!(:status) { Fabricate(:status, account: account) }
    let!(:media_attachment) { Fabricate(:media_attachment, account: account) }
    let!(:notification) { Fabricate(:notification, account: account) }
    let!(:favourite) { Fabricate(:favourite, account: account) }
    let!(:active_relationship) { Fabricate(:follow, account: account) }
    let!(:passive_relationship) { Fabricate(:follow, target_account: account) }
    let!(:subscription) { Fabricate(:subscription, account: account) }
    let!(:remote_alice) { Fabricate(:account, inbox_url: 'https://alice.com/inbox', protocol: :activitypub) }
    let!(:remote_bob) { Fabricate(:account, inbox_url: 'https://bob.com/inbox', protocol: :activitypub) }

    it 'deletes associated records' 


    it 'sends a delete actor activity to all known inboxes' 

  end
end

