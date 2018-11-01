require 'spec_helper'

describe Users::DestroyService do
  describe "Deletes a user and all their personal projects" do
    let!(:user)      { create(:user) }
    let!(:admin)     { create(:admin) }
    let!(:namespace) { user.namespace }
    let!(:project)   { create(:project, namespace: namespace) }
    let(:service)    { described_class.new(admin) }
    let(:gitlab_shell) { Gitlab::Shell.new }

    context 'no options are given' do
      it 'deletes the user' 


      it 'will delete the project' 

    end

    context 'projects in pending_delete' do
      before do
        project.pending_delete = true
        project.save
      end

      it 'destroys a project in pending_delete' 

    end

    context "a deleted user's issues" do
      let(:project) { create(:project) }

      before do
        project.add_developer(user)
      end

      context "for an issue the user was assigned to" do
        let!(:issue) { create(:issue, project: project, assignees: [user]) }

        before do
          service.execute(user)
        end

        it 'does not delete issues the user is assigned to' 


        it 'migrates the issue so that it is "Unassigned"' 

      end
    end

    context "a deleted user's merge_requests" do
      let(:project) { create(:project, :repository) }

      before do
        project.add_developer(user)
      end

      context "for an merge request the user was assigned to" do
        let!(:merge_request) { create(:merge_request, source_project: project, assignee: user) }

        before do
          service.execute(user)
        end

        it 'does not delete merge requests the user is assigned to' 


        it 'migrates the merge request so that it is "Unassigned"' 

      end
    end

    context "solo owned groups present" do
      let(:solo_owned)  { create(:group) }
      let(:member)      { create(:group_member) }
      let(:user)        { member.user }

      before do
        solo_owned.group_members = [member]
        service.execute(user)
      end

      it 'does not delete the user' 

    end

    context "deletions with solo owned groups" do
      let(:solo_owned)      { create(:group) }
      let(:member)          { create(:group_member) }
      let(:user)            { member.user }

      before do
        solo_owned.group_members = [member]
        service.execute(user, delete_solo_owned_groups: true)
      end

      it 'deletes solo owned groups' 


      it 'deletes the user' 

    end

    context "deletion permission checks" do
      it 'does not delete the user when user is not an admin' 


      it 'allows admins to delete anyone' 


      it 'allows users to delete their own account' 

    end

    context "migrating associated records" do
      let!(:issue)     { create(:issue, author: user) }

      it 'delegates to the `MigrateToGhostUser` service to move associated records to the ghost user' 


      it 'does not run `MigrateToGhostUser` if hard_delete option is given' 

    end

    describe "user personal's repository removal" do
      context 'storages' do
        before do
          perform_enqueued_jobs { service.execute(user) }
        end

        context 'legacy storage' do
          let!(:project) { create(:project, :empty_repo, :legacy_storage, namespace: user.namespace) }

          it 'removes repository' 

        end

        context 'hashed storage' do
          let!(:project) { create(:project, :empty_repo, namespace: user.namespace) }

          it 'removes repository' 

        end
      end

      context 'repository removal status is taken into account' do
        it 'raises exception' 

      end
    end

    describe "calls the before/after callbacks" do
      it 'of project_members' 


      it 'of group_members' 

    end
  end
end

