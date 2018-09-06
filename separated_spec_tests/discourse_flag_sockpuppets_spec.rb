require 'rails_helper'

describe SpamRule::FlagSockpuppets do

  let(:user1) { Fabricate(:user, ip_address: '182.189.119.174') }
  let(:post1) { Fabricate(:post, user: user1, topic: Fabricate(:topic, user: user1)) }

  describe 'perform' do
    let(:rule)        { described_class.new(post1) }
    subject(:perform) { rule.perform }

    it 'does nothing if flag_sockpuppets is disabled' 


    context 'flag_sockpuppets is enabled' do
      before { SiteSetting.flag_sockpuppets = true }

      it 'flags posts when it should' 


      it "doesn't flag posts when it shouldn't" 

    end
  end

  describe 'reply_is_from_sockpuppet?' do
    it 'is false for the first post in a topic' 


    it 'is false if users have different IP addresses' 


    it 'is true if users have the same IP address and are new' 


    it 'is false if the ip address is whitelisted' 


    it 'is false if reply and first post are from the same user' 


    it 'is false if first post user is staff' 


    it 'is false if second post user is staff' 


    it 'is false if both users are staff' 


    it 'is true if first post user was created over 24 hours ago and has trust level higher than 0' 


    it 'is false if second post user was created over 24 hours ago and has trust level higher than 0' 


    it 'is true if first post user was created less that 24 hours ago and has trust level higher than 0' 


    it 'is true if second user was created less that 24 hours ago and has trust level higher than 0' 


    # A weird case
    it 'is false when user is nil on first post' 

  end

  describe 'flag_sockpuppet_users' do
    let(:post2) { Fabricate(:post, user: Fabricate(:user, ip_address: user1.ip_address), topic: post1.topic) }

    it 'flags post and first post if both users are new' 


    it "doesn't flag the first post more than once" 


    it "doesn't flag the first post if the user is not new" 


    it "doesn't create a flag if user is nil on first post" 

  end
end

