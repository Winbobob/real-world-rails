require 'rails_helper'

describe Groups::TransferService, :postgresql do
  let(:user) { create(:user) }
  let(:new_parent_group) { create(:group, :public) }
  let!(:group_member) { create(:group_member, :owner, group: group, user: user) }
  let(:transfer_service) { described_class.new(group, user) }

  shared_examples 'ensuring allowed transfer for a group' do
    context 'with other database than PostgreSQL' do
      before do
        allow(Group).to receive(:supports_nested_groups?).and_return(false)
      end

      it 'should return false' 


      it 'should add an error on group' 

    end

    context "when there's an exception on GitLab shell directories" do
      let(:new_parent_group) { create(:group, :public) }

      before do
        allow_any_instance_of(described_class).to receive(:update_group_attributes).and_raise(Gitlab::UpdatePathError, 'namespace directory cannot be moved')
        create(:group_member, :owner, group: new_parent_group, user: user)
      end

      it 'should return false' 


      it 'should add an error on group' 

    end
  end

  describe '#execute' do
    context 'when transforming a group into a root group' do
      let!(:group) { create(:group, :public, :nested) }

      it_behaves_like 'ensuring allowed transfer for a group'

      context 'when the group is already a root group' do
        let(:group) { create(:group, :public) }

        it 'should add an error on group' 

      end

      context 'when the user does not have the right policies' do
        let!(:group_member) { create(:group_member, :guest, group: group, user: user) }

        it "should return false" 


        it "should add an error on group" 

      end

      context 'when there is a group with the same path' do
        let!(:group) { create(:group, :public, :nested, path: 'not-unique') }

        before do
          create(:group, path: 'not-unique')
        end

        it 'should return false' 


        it 'should add an error on group' 

      end

      context 'when the group is a subgroup and the transfer is valid' do
        let!(:subgroup1) { create(:group, :private, parent: group) }
        let!(:subgroup2) { create(:group, :internal, parent: group) }
        let!(:project1) { create(:project, :repository, :private, namespace: group) }

        before do
          transfer_service.execute(nil)
          group.reload
        end

        it 'should update group attributes' 


        it 'should update group children path' 


        it 'should update group projects path' 

      end
    end

    context 'when transferring a subgroup into another group' do
      let(:group) { create(:group, :public, :nested) }

      it_behaves_like 'ensuring allowed transfer for a group'

      context 'when the new parent group is the same as the previous parent group' do
        let(:group) { create(:group, :public, :nested, parent: new_parent_group) }

        it 'should return false' 


        it 'should add an error on group' 

      end

      context 'when the user does not have the right policies' do
        let!(:group_member) { create(:group_member, :guest, group: group, user: user) }

        it "should return false" 


        it "should add an error on group" 

      end

      context 'when the parent has a group with the same path' do
        before do
          create(:group_member, :owner, group: new_parent_group, user: user)
          group.update_attribute(:path, "not-unique")
          create(:group, path: "not-unique", parent: new_parent_group)
        end

        it 'should return false' 


        it 'should add an error on group' 

      end

      context 'when the parent group has a project with the same path' do
        let!(:group) { create(:group, :public, :nested, path: 'foo') }

        before do
          create(:group_member, :owner, group: new_parent_group, user: user)
          create(:project, path: 'foo', namespace: new_parent_group)
          group.update_attribute(:path, 'foo')
        end

        it 'should return false' 


        it 'should add an error on group' 

      end

      context 'when the group is allowed to be transferred' do
        before do
          create(:group_member, :owner, group: new_parent_group, user: user)
          transfer_service.execute(new_parent_group)
        end

        context 'when the group has a lower visibility than the parent group' do
          let(:new_parent_group) { create(:group, :public) }
          let(:group) { create(:group, :private, :nested) }

          it 'should not update the visibility for the group' 

        end

        context 'when the group has a higher visibility than the parent group' do
          let(:new_parent_group) { create(:group, :private) }
          let(:group) { create(:group, :public, :nested) }

          it 'should update visibility level based on the parent group' 

        end

        it 'should update visibility for the group based on the parent group' 


        it 'should update parent group to the new parent ' 


        it 'should return the group as children of the new parent' 


        it 'should create a redirect for the group' 

      end

      context 'when transferring a group with group descendants' do
        let!(:subgroup1) { create(:group, :private, parent: group) }
        let!(:subgroup2) { create(:group, :internal, parent: group) }

        before do
          create(:group_member, :owner, group: new_parent_group, user: user)
          transfer_service.execute(new_parent_group)
        end

        it 'should update subgroups path' 


        it 'should create redirects for the subgroups' 


        context 'when the new parent has a higher visibility than the children' do
          it 'should not update the children visibility' 

        end

        context 'when the new parent has a lower visibility than the children' do
          let!(:subgroup1) { create(:group, :public, parent: group) }
          let!(:subgroup2) { create(:group, :public, parent: group) }
          let(:new_parent_group) { create(:group, :private) }

          it 'should update children visibility to match the new parent' 

        end
      end

      context 'when transferring a group with project descendants' do
        let!(:project1) { create(:project, :repository, :private, namespace: group) }
        let!(:project2) { create(:project, :repository, :internal, namespace: group) }

        before do
          TestEnv.clean_test_path
          create(:group_member, :owner, group: new_parent_group, user: user)
          transfer_service.execute(new_parent_group)
        end

        it 'should update projects path' 


        it 'should create permanent redirects for the projects' 


        context 'when the new parent has a higher visibility than the projects' do
          it 'should not update projects visibility' 

        end

        context 'when the new parent has a lower visibility than the projects' do
          let!(:project1) { create(:project, :repository, :public, namespace: group) }
          let!(:project2) { create(:project, :repository, :public, namespace: group) }
          let(:new_parent_group) { create(:group, :private) }

          it 'should update projects visibility to match the new parent' 

        end
      end

      context 'when transferring a group with subgroups & projects descendants' do
        let!(:project1) { create(:project, :repository, :private, namespace: group) }
        let!(:project2) { create(:project, :repository, :internal, namespace: group) }
        let!(:subgroup1) { create(:group, :private, parent: group) }
        let!(:subgroup2) { create(:group, :internal, parent: group) }

        before do
          TestEnv.clean_test_path
          create(:group_member, :owner, group: new_parent_group, user: user)
          transfer_service.execute(new_parent_group)
        end

        it 'should update subgroups path' 


        it 'should update projects path' 


        it 'should create redirect for the subgroups and projects' 

      end

      context 'when transfering a group with nested groups and projects' do
        let!(:group) { create(:group, :public) }
        let!(:project1) { create(:project, :repository, :private, namespace: group) }
        let!(:subgroup1) { create(:group, :private, parent: group) }
        let!(:nested_subgroup) { create(:group, :private, parent: subgroup1) }
        let!(:nested_project) { create(:project, :repository, :private, namespace: subgroup1) }

        before do
          TestEnv.clean_test_path
          create(:group_member, :owner, group: new_parent_group, user: user)
          transfer_service.execute(new_parent_group)
        end

        it 'should update subgroups path' 


        it 'should update projects path' 


        it 'should create redirect for the subgroups and projects' 

      end

      context 'when updating the group goes wrong' do
        let!(:subgroup1) { create(:group, :public, parent: group) }
        let!(:subgroup2) { create(:group, :public, parent: group) }
        let(:new_parent_group) { create(:group, :private) }
        let!(:project1) { create(:project, :repository, :public, namespace: group) }

        before do
          allow(group).to receive(:save!).and_raise(ActiveRecord::RecordInvalid.new(group))
          TestEnv.clean_test_path
          create(:group_member, :owner, group: new_parent_group, user: user)
          transfer_service.execute(new_parent_group)
        end

        it 'should restore group and projects visibility' 

      end
    end
  end
end

