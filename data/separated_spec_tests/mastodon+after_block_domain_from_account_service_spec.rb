require 'rails_helper'

RSpec.describe AfterBlockDomainFromAccountService, type: :service do
  let!(:wolf) { Fabricate(:account, username: 'wolf', domain: 'evil.org', inbox_url: 'https://evil.org/inbox', protocol: :activitypub) }
  let!(:alice) { Fabricate(:account, username: 'alice') }

  subject { AfterBlockDomainFromAccountService.new }

  before do
    stub_jsonld_contexts!
    allow(ActivityPub::DeliveryWorker).to receive(:perform_async)
  end

  it 'purge followers from blocked domain' 


  it 'sends Reject->Follow to followers from blocked domain' 

end

