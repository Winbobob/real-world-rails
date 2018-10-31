require 'rails_helper'

RSpec.describe BatchedRemoveStatusService, type: :service do
  subject { BatchedRemoveStatusService.new }

  let!(:alice)  { Fabricate(:account) }
  let!(:bob)    { Fabricate(:account, username: 'bob', domain: 'example.com', salmon_url: 'http://example.com/salmon') }
  let!(:jeff)   { Fabricate(:user).account }
  let!(:hank)   { Fabricate(:account, username: 'hank', protocol: :activitypub, domain: 'example.com', inbox_url: 'http://example.com/inbox') }

  let(:status1) { PostStatusService.new.call(alice, 'Hello @bob@example.com') }
  let(:status2) { PostStatusService.new.call(alice, 'Another status') }

  before do
    allow(Redis.current).to receive_messages(publish: nil)

    stub_request(:post, 'http://example.com/push').to_return(status: 200, body: '', headers: {})
    stub_request(:post, 'http://example.com/salmon').to_return(status: 200, body: '', headers: {})
    stub_request(:post, 'http://example.com/inbox').to_return(status: 200)

    Fabricate(:subscription, account: alice, callback_url: 'http://example.com/push', confirmed: true, expires_at: 30.days.from_now)
    jeff.user.update(current_sign_in_at: Time.zone.now)
    jeff.follow!(alice)
    hank.follow!(alice)

    status1
    status2

    subject.call([status1, status2])
  end

  it 'removes statuses from author\'s home feed' 


  it 'removes statuses from local follower\'s home feed' 


  it 'notifies streaming API of followers' 


  it 'notifies streaming API of author' 


  it 'notifies streaming API of public timeline' 


  it 'sends PuSH update to PuSH subscribers' 


  it 'sends Salmon slap to previously mentioned users' 


  it 'sends delete activity to followers' 

end

