require 'rails_helper'

describe ::Presence::PresencesController do
  before do
    SiteSetting.presence_enabled = true
  end

  let(:user1) { Fabricate(:user) }
  let(:user2) { Fabricate(:user) }
  let(:user3) { Fabricate(:user) }

  let(:post1) { Fabricate(:post) }
  let(:post2) { Fabricate(:post) }

  let(:manager) { ::Presence::PresenceManager }

  after do
    $redis.del("presence:topic:#{post1.topic.id}")
    $redis.del("presence:topic:#{post2.topic.id}")
    $redis.del("presence:post:#{post1.id}")
    $redis.del("presence:post:#{post2.id}")
  end

  context 'when not logged in' do
    it 'should raise the right error' 

  end

  context 'when logged in' do
    before do
      sign_in(user1)
    end

    it "doesn't produce an error" 


    it "does not publish for users with disabled presence features" 


    it "uses guardian to secure endpoint" 


    it "returns a response when requested" 


    it "doesn't return a response when not requested" 


    it "does send duplicate messagebus messages" 


    it "clears 'previous' state when supplied" 


    it 'cleans up old users when requested' 


    describe 'when post has been deleted' do
      it 'should return an empty response' 

    end

  end

end

