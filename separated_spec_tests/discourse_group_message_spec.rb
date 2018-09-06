require 'rails_helper'

describe GroupMessage do

  let(:moderators_group) { Group[:moderators].name }

  let!(:admin)     { Fabricate.build(:admin, id: 999) }
  let!(:user)      { Fabricate.build(:user, id: 111) }

  before do
    Discourse.stubs(:system_user).returns(admin)
  end

  subject(:send_group_message) { GroupMessage.create(moderators_group, :user_automatically_silenced, user: user) }

  describe 'not sent recently' do
    before { GroupMessage.any_instance.stubs(:sent_recently?).returns(false) }

    it 'should send a private message to the given group' 


    it 'returns whatever PostCreator returns' 


    it "remembers that it was sent so it doesn't spam the group with the same message" 

  end

  describe 'sent recently' do
    before  { GroupMessage.any_instance.stubs(:sent_recently?).returns(true) }
    subject { GroupMessage.create(moderators_group, :user_automatically_silenced, user: user) }

    it { is_expected.to eq(false) }

    it 'should not send the same notification again' 

  end

  describe 'message_params' do
    let(:user) { Fabricate.build(:user, id: 123123) }
    shared_examples 'common message params for group messages' do
      it 'returns the correct params' 

    end

    context 'user_automatically_silenced' do
      subject { GroupMessage.new(moderators_group, :user_automatically_silenced, user: user).message_params }
      include_examples 'common message params for group messages'
    end

    context 'spam_post_blocked' do
      subject { GroupMessage.new(moderators_group, :spam_post_blocked, user: user).message_params }
      include_examples 'common message params for group messages'
    end
  end

  describe 'methods that use redis' do
    let(:user)              { Fabricate.build(:user, id: 123123) }
    subject(:group_message) { GroupMessage.new(moderators_group, :user_automatically_silenced, user: user) }
    before do
      PostCreator.stubs(:create).returns(stub_everything)
      group_message.stubs(:sent_recently_key).returns('the_key')
    end

    describe 'sent_recently?' do
      it 'returns true if redis says so' 


      it 'returns false if redis returns nil' 


      it 'always returns false if limit_once_per is false' 

    end

    describe 'remember_message_sent' do
      it 'stores a key in redis that expires after 24 hours' 


      it 'can use a given expiry time' 


      it 'can be disabled' 

    end
  end
end

