require 'spec_helper'

describe Groups::CreateService, '#execute' do
  let!(:user) { create(:user) }
  let!(:group_params) { { path: "group_path", visibility_level: Gitlab::VisibilityLevel::PUBLIC } }

  subject { service.execute }

  describe 'visibility level restrictions' do
    let!(:service) { described_class.new(user, group_params) }

    context "create groups without restricted visibility level" do
      it { is_expected.to be_persisted }
    end

    context "cannot create group with restricted visibility level" do
      before do
        allow_any_instance_of(ApplicationSetting).to receive(:restricted_visibility_levels).and_return([Gitlab::VisibilityLevel::PUBLIC])
      end

      it { is_expected.not_to be_persisted }
    end
  end

  describe 'creating a top level group' do
    let(:service) { described_class.new(user, group_params) }

    context 'when user can create a group' do
      before do
        user.update_attribute(:can_create_group, true)
      end

      it { is_expected.to be_persisted }
    end

    context 'when user can not create a group' do
      before do
        user.update_attribute(:can_create_group, false)
      end

      it { is_expected.not_to be_persisted }
    end
  end

  describe 'creating subgroup', :nested_groups do
    let!(:group) { create(:group) }
    let!(:service) { described_class.new(user, group_params.merge(parent_id: group.id)) }

    context 'as group owner' do
      before do
        group.add_owner(user)
      end

      it { is_expected.to be_persisted }

      context 'when nested groups feature is disabled' do
        it 'does not save group and returns an error' 

      end
    end

    context 'when nested groups feature is enabled' do
      before do
        allow(Group).to receive(:supports_nested_groups?).and_return(true)
      end

      context 'as guest' do
        it 'does not save group and returns an error' 

      end

      context 'as owner' do
        before do
          group.add_owner(user)
        end

        it { is_expected.to be_persisted }
      end
    end
  end

  describe 'creating a mattermost team' do
    let!(:params) { group_params.merge(create_chat_team: "true") }
    let!(:service) { described_class.new(user, params) }

    before do
      stub_mattermost_setting(enabled: true)
    end

    it 'create the chat team with the group' 

  end
end

