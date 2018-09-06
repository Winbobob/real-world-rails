require 'rails_helper'

RSpec.describe RemoveStatusService, type: :service do
  subject { RemoveStatusService.new }

  let!(:alice)  { Fabricate(:account) }
  let!(:bob)    { Fabricate(:account, username: 'bob', domain: 'example.com', salmon_url: 'http://example.com/salmon') }
  let!(:jeff)   { Fabricate(:account) }
  let!(:hank)   { Fabricate(:account, username: 'hank', protocol: :activitypub, domain: 'example.com', inbox_url: 'http://example.com/inbox') }
  let!(:bill)   { Fabricate(:account, username: 'bill', protocol: :activitypub, domain: 'example2.com', inbox_url: 'http://example2.com/inbox') }

  before do
    stub_request(:post, 'http://example.com/push').to_return(status: 200, body: '', headers: {})
    stub_request(:post, 'http://example.com/salmon').to_return(status: 200, body: '', headers: {})
    stub_request(:post, 'http://example.com/inbox').to_return(status: 200)
    stub_request(:post, 'http://example2.com/inbox').to_return(status: 200)

    Fabricate(:subscription, account: alice, callback_url: 'http://example.com/push', confirmed: true, expires_at: 30.days.from_now)
    jeff.follow!(alice)
    hank.follow!(alice)

    @status = PostStatusService.new.call(alice, 'Hello @bob@example.com')
    Fabricate(:status, account: bill, reblog: @status, uri: 'hoge')
    subject.call(@status)
  end

  it 'removes status from author\'s home feed' 


  it 'removes status from local follower\'s home feed' 


  it 'sends PuSH update to PuSH subscribers' 


  it 'sends delete activity to followers' 


  it 'sends Salmon slap to previously mentioned users' 


  it 'sends delete activity to rebloggers' 

end

