require 'spec_helper'

describe Groups::UpdateService do
  let!(:user) { create(:user) }
  let!(:private_group) { create(:group, :private) }
  let!(:internal_group) { create(:group, :internal) }
  let!(:public_group) { create(:group, :public) }

  describe "#execute" do
    context "project visibility_level validation" do
      context "public group with public projects" do
        let!(:service) { described_class.new(public_group, user, visibility_level: Gitlab::VisibilityLevel::INTERNAL) }

        before do
          public_group.add_user(user, Gitlab::Access::OWNER)
          create(:project, :public, group: public_group)

          expect(TodosDestroyer::GroupPrivateWorker).not_to receive(:perform_in)
        end

        it "does not change permission level" 


        it "returns false if save failed" 

      end

      context "internal group with internal project" do
        let!(:service) { described_class.new(internal_group, user, visibility_level: Gitlab::VisibilityLevel::PRIVATE) }

        before do
          internal_group.add_user(user, Gitlab::Access::OWNER)
          create(:project, :internal, group: internal_group)

          expect(TodosDestroyer::GroupPrivateWorker).not_to receive(:perform_in)
        end

        it "does not change permission level" 

      end

      context "internal group with private project" do
        let!(:service) { described_class.new(internal_group, user, visibility_level: Gitlab::VisibilityLevel::PRIVATE) }

        before do
          internal_group.add_user(user, Gitlab::Access::OWNER)
          create(:project, :private, group: internal_group)

          expect(TodosDestroyer::GroupPrivateWorker).to receive(:perform_in)
            .with(1.hour, internal_group.id)
        end

        it "changes permission level to private" 

      end
    end

    context "with parent_id user doesn't have permissions for" do
      let(:service) { described_class.new(public_group, user, parent_id: private_group.id) }

      before do
        service.execute
      end

      it 'does not update parent_id' 

    end
  end

  context "unauthorized visibility_level validation" do
    let!(:service) { described_class.new(internal_group, user, visibility_level: 99) }
    before do
      internal_group.add_user(user, Gitlab::Access::MAINTAINER)
    end

    it "does not change permission level" 

  end

  context 'rename group' do
    let!(:service) { described_class.new(internal_group, user, path: SecureRandom.hex) }

    before do
      internal_group.add_user(user, Gitlab::Access::MAINTAINER)
      create(:project, :internal, group: internal_group)
    end

    it 'returns true' 


    context 'error moving group' do
      before do
        allow(internal_group).to receive(:move_dir).and_raise(Gitlab::UpdatePathError)
      end

      it 'does not raise an error' 


      it 'returns false' 


      it 'has the right error' 


      it "hasn't changed the path" 

    end
  end

  context 'for a subgroup', :nested_groups do
    let(:subgroup) { create(:group, :private, parent: private_group) }

    context 'when the parent group share_with_group_lock is enabled' do
      before do
        private_group.update_column(:share_with_group_lock, true)
      end

      context 'for the parent group owner' do
        it 'allows disabling share_with_group_lock' 

      end

      context 'for a subgroup owner (who does not own the parent)' do
        it 'does not allow disabling share_with_group_lock' 

      end
    end
  end
end

