require 'rails_helper'

describe SpamRule::AutoSilence do

  before do
    SiteSetting.flags_required_to_hide_post = 0 # never
    SiteSetting.num_spam_flags_to_silence_new_user = 2
    SiteSetting.num_users_to_silence_new_user = 2
  end

  describe 'perform' do
    let(:post)  { Fabricate.build(:post, user: Fabricate.build(:user, trust_level: TrustLevel[0])) }
    subject     { described_class.new(post.user) }

    it 'takes no action if user should not be silenced' 


    it 'delivers punishment when user should be silenced' 

  end

  describe 'num_spam_flags_against_user' do
    before { described_class.any_instance.stubs(:silence_user) }
    let(:post)     { Fabricate(:post) }
    let(:enforcer) { described_class.new(post.user) }
    subject        { enforcer.num_spam_flags_against_user }

    it 'returns 0 when there are no flags' 


    it 'returns 0 when there is one flag that has a reason other than spam' 


    it 'returns 2 when there are two flags with spam as the reason' 


    it 'returns 2 when there are two spam flags, each on a different post' 

  end

  describe 'num_users_who_flagged_spam_against_user' do
    before { described_class.any_instance.stubs(:silence_user) }
    let(:post)     { Fabricate(:post) }
    let(:enforcer) { described_class.new(post.user) }
    subject        { enforcer.num_users_who_flagged_spam_against_user }

    it 'returns 0 when there are no flags' 


    it 'returns 0 when there is one flag that has a reason other than spam' 


    it 'returns 1 when there is one spam flag' 


    it 'returns 2 when there are two spam flags from 2 users' 


    it 'returns 1 when there are two spam flags on two different posts from 1 user' 

  end

  describe 'num_tl3_flags_against_user' do
    let(:post)     { Fabricate(:post) }
    let(:enforcer) { described_class.new(post.user) }

    it "counts flags of all types from tl3 users only" 

  end

  describe 'num_tl3_users_who_flagged' do
    let(:post)     { Fabricate(:post) }
    let(:enforcer) { described_class.new(post.user) }

    it "counts only tl3 users who flagged with any type" 

  end

  describe 'silence_user' do
    let!(:admin)  { Fabricate(:admin) } # needed for SystemMessage
    let(:user)    { Fabricate(:user) }
    let!(:post)   { Fabricate(:post, user: user) }
    subject       { described_class.new(user) }

    before do
      described_class.stubs(:silence?).with { |u| u.id != user.id }.returns(false)
      described_class.stubs(:silence?).with { |u| u.id == user.id }.returns(true)
      subject.stubs(:silence?).returns(true)
    end

    context 'user is not silenced' do
      before do
        UserSilencer.expects(:silence).with(user, Discourse.system_user, message: :too_many_spam_flags).returns(true)
      end

      it 'prevents the user from making new posts' 


      it 'sends private message to moderators' 


      it "doesn't send a pm to moderators if notify_mods_when_user_silenced is false" 

    end

    context 'user is already silenced' do
      before do
        UserSilencer.expects(:silence).with(user, Discourse.system_user, message: :too_many_spam_flags).returns(false)
      end

      it "doesn't send a pm to moderators if the user is already silenced" 

    end
  end

  describe 'silence?' do

    context 'never been silenced' do
      shared_examples "can't be silenced" do
        it "returns false" 

      end

      (1..4).each do |trust_level|
        context "user has trust level #{trust_level}" do
          let(:user) { Fabricate(:user, trust_level: trust_level) }
          include_examples "can't be silenced"
        end
      end

      context "user is an admin" do
        let(:user) { Fabricate(:admin) }
        include_examples "can't be silenced"
      end

      context "user is a moderator" do
        let(:user) { Fabricate(:moderator) }
        include_examples "can't be silenced"
      end
    end

    context 'new user' do
      let(:user)  { Fabricate(:user, trust_level: TrustLevel[0]) }
      subject     { described_class.new(user) }

      it 'returns false if there are no spam flags' 


      it 'returns false if there are not received enough flags' 


      it 'returns false if there have not been enough users' 


      it 'returns false if num_spam_flags_to_silence_new_user is 0' 


      it 'returns false if num_users_to_silence_new_user is 0' 


      it 'returns true when there are enough flags from enough users' 


      context "all types of flags" do
        before do
          SiteSetting.num_tl3_flags_to_silence_new_user = 3
          SiteSetting.num_tl3_users_to_silence_new_user = 2
        end

        it 'returns false if there are not enough flags' 


        it 'returns false if enough flags but not enough users' 


        it 'returns true if enough flags and users' 

      end
    end

    context "silenced, but has higher trust level now" do
      let(:user)  { Fabricate(:user, silenced_till: 1.year.from_now, trust_level: TrustLevel[1]) }
      subject     { described_class.new(user) }

      it 'returns false' 

    end
  end
end

