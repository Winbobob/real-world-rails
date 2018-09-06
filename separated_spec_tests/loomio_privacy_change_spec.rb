require 'rails_helper'

describe GroupService::PrivacyChange do
  describe 'getting private' do
    let(:group) { FactoryBot.create(:formal_group, group_privacy: 'open') }
    let(:subgroup) { create(:formal_group, parent: group, group_privacy: 'open') }
    let(:other_subgroup) { create(:formal_group, parent: group, group_privacy: 'open') }

    before do
      create(:discussion, group: group, private: false)
      # create a public discussion in that subgroup
      create(:discussion, group: subgroup, private: false)
      create(:discussion, group: other_subgroup, private: false)
    end

    describe 'is_visible_to_public changes to false' do
      before do
        group.is_visible_to_public = false
        privacy_change = GroupService::PrivacyChange.new(group)
        group.save!
        privacy_change.commit!
      end

      it "makes discussions in the group and subgroups private" 


      it "makes all public subgroups closed, visible to parent members" 

    end

    describe 'discussion_privacy_options changes to private_only' do
      before do
        group.group_privacy = 'closed'
        group.discussion_privacy_options = 'private_only'
        privacy_change = GroupService::PrivacyChange.new(group)
        group.save!
        privacy_change.commit!
      end

      it "makes discussions in the group private" 

    end
  end

  describe 'getting public' do
    let(:group) { FactoryBot.create(:formal_group, group_privacy: 'secret') }

    before do
      create(:discussion, group: group, private: true)
    end

    describe 'is_visible_to_public changes to true' do
      # do nothing I think
    end

    describe 'discussion_privacy_options changes to public_only' do
      before do
        group.group_privacy = 'open'
        privacy_change = GroupService::PrivacyChange.new(group)
        group.save!
        privacy_change.commit!
      end

      it "makes discussions in the group public" 

    end
  end
end

