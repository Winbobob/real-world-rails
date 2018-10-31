require 'spec_helper'

describe Gitlab::UserAccess do
  include ProjectForksHelper

  let(:access) { described_class.new(user, project: project) }
  let(:project) { create(:project, :repository) }
  let(:user) { create(:user) }

  describe '#can_push_to_branch?' do
    describe 'push to none protected branch' do
      it 'returns true if user is a master' 


      it 'returns true if user is a developer' 


      it 'returns false if user is a reporter' 

    end

    describe 'push to empty project' do
      let(:empty_project) { create(:project_empty_repo) }
      let(:project_access) { described_class.new(user, project: empty_project) }

      it 'returns true for admins' 


      it 'returns true if user is master' 


      it 'returns false if user is developer and project is fully protected' 


      it 'returns false if user is developer and it is not allowed to push new commits but can merge into branch' 


      it 'returns true if user is developer and project is unprotected' 


      it 'returns true if user is developer and project grants developers permission' 

    end

    describe 'push to protected branch' do
      let(:branch) { create :protected_branch, project: project, name: "test" }
      let(:not_existing_branch) { create :protected_branch, :developers_can_merge, project: project }

      it 'returns true for admins' 


      it 'returns true if user is a master' 


      it 'returns false if user is a developer' 


      it 'returns false if user is a reporter' 


      it 'returns false if branch does not exist' 

    end

    describe 'push to protected branch if allowed for developers' do
      before do
        @branch = create :protected_branch, :developers_can_push, project: project
      end

      it 'returns true if user is a master' 


      it 'returns true if user is a developer' 


      it 'returns false if user is a reporter' 

    end

    describe 'allowing pushes to maintainers of forked projects' do
      let(:canonical_project) { create(:project, :public, :repository) }
      let(:project) { fork_project(canonical_project, create(:user), repository: true) }

      before do
        create(
          :merge_request,
          target_project: canonical_project,
          source_project: project,
          source_branch: 'awesome-feature',
          allow_maintainer_to_push: true
        )
      end

      it 'allows users that have push access to the canonical project to push to the MR branch' 


      it 'does not allow the user to push to other branches' 


      it 'does not allow the user to push if he does not have push access to the canonical project' 

    end

    describe 'merge to protected branch if allowed for developers' do
      before do
        @branch = create :protected_branch, :developers_can_merge, project: project
      end

      it 'returns true if user is a master' 


      it 'returns true if user is a developer' 


      it 'returns false if user is a reporter' 

    end
  end

  describe '#can_create_tag?' do
    describe 'push to none protected tag' do
      it 'returns true if user is a master' 


      it 'returns true if user is a developer' 


      it 'returns false if user is a reporter' 

    end

    describe 'push to protected tag' do
      let(:tag) { create(:protected_tag, project: project, name: "test") }
      let(:not_existing_tag) { create :protected_tag, project: project }

      it 'returns true if user is a master' 


      it 'returns false if user is a developer' 


      it 'returns false if user is a reporter' 

    end

    describe 'push to protected tag if allowed for developers' do
      before do
        @tag = create(:protected_tag, :developers_can_create, project: project)
      end

      it 'returns true if user is a master' 


      it 'returns true if user is a developer' 


      it 'returns false if user is a reporter' 

    end
  end

  describe '#can_delete_branch?' do
    describe 'delete unprotected branch' do
      it 'returns true if user is a master' 


      it 'returns true if user is a developer' 


      it 'returns false if user is a reporter' 

    end

    describe 'delete protected branch' do
      let(:branch) { create(:protected_branch, project: project, name: "test") }

      it 'returns true if user is a master' 


      it 'returns false if user is a developer' 


      it 'returns false if user is a reporter' 

    end
  end
end

