require 'rails_helper'

describe ::Presence::PresenceManager do

  let(:user1) { Fabricate(:user) }
  let(:user2) { Fabricate(:user) }
  let(:user3) { Fabricate(:user) }
  let(:manager) { ::Presence::PresenceManager }

  let(:post1) { Fabricate(:post) }
  let(:post2) { Fabricate(:post) }

  after(:each) do
    $redis.del("presence:topic:#{post1.topic.id}")
    $redis.del("presence:topic:#{post2.topic.id}")
    $redis.del("presence:post:#{post1.id}")
    $redis.del("presence:post:#{post2.id}")
  end

  it 'adds, removes and lists users correctly' 


  it 'publishes correctly' 


  it 'publishes private message securely' 


  it 'publishes private category securely' 


  it 'cleans up correctly' 

end

