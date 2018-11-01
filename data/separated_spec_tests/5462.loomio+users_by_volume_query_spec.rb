require 'rails_helper'

describe Queries::UsersByVolumeQuery do
  let(:user_with_reader_volume_loud) { FactoryBot.create :user }
  let(:user_with_membership_volume_loud) { FactoryBot.create :user }
  let(:user_with_reader_volume_normal) { FactoryBot.create :user }
  let(:user_with_membership_volume_normal) { FactoryBot.create :user }
  let(:user_with_reader_volume_quiet) { FactoryBot.create :user }
  let(:user_with_membership_volume_quiet) { FactoryBot.create :user }
  let(:user_with_reader_volume_mute) { FactoryBot.create :user }
  let(:user_with_membership_volume_mute) { FactoryBot.create :user }
  let(:user_with_archived_membership) { FactoryBot.create :user }

  let(:discussion) { FactoryBot.create :discussion }

  before do
    discussion.group.add_member!(user_with_membership_volume_loud).set_volume! :loud
    discussion.group.add_member!(user_with_membership_volume_normal).set_volume! :normal
    discussion.group.add_member!(user_with_membership_volume_quiet).set_volume! :quiet
    discussion.group.add_member!(user_with_membership_volume_mute).set_volume! :mute
    discussion.group.add_member!(user_with_archived_membership).set_volume! :normal
    discussion.group.membership_for(user_with_archived_membership).update(archived_at: 1.day.ago)

    discussion.group.add_member!(user_with_reader_volume_loud).set_volume! :mute
    discussion.group.add_member!(user_with_reader_volume_normal).set_volume! :mute
    discussion.group.add_member!(user_with_reader_volume_quiet).set_volume! :mute
    discussion.group.add_member!(user_with_reader_volume_mute).set_volume! :mute

    DiscussionReader.for(discussion: discussion, user: user_with_reader_volume_loud).set_volume! :loud
    DiscussionReader.for(discussion: discussion, user: user_with_reader_volume_normal).set_volume! :normal
    DiscussionReader.for(discussion: discussion, user: user_with_reader_volume_quiet).set_volume! :quiet
    DiscussionReader.for(discussion: discussion, user: user_with_reader_volume_mute).set_volume! :mute
  end

  it "loud" 


  it "normal or loud" 


  it "mute" 


  it 'accepts a group' 


  it 'deals with nils' 

end

