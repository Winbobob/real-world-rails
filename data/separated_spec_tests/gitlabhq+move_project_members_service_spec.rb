require 'spec_helper'

describe Projects::MoveProjectMembersService do
  let!(:user) { create(:user) }
  let(:project_with_users) { create(:project, namespace: user.namespace) }
  let(:target_project) { create(:project, namespace: user.namespace) }
  let(:maintainer_user) { create(:user) }
  let(:reporter_user) { create(:user) }
  let(:developer_user) { create(:user) }

  subject { described_class.new(target_project, user) }

  describe '#execute' do
    before do
      project_with_users.add_maintainer(maintainer_user)
      project_with_users.add_developer(developer_user)
      project_with_users.add_reporter(reporter_user)
    end

    it 'moves the members from one project to another' 


    it 'does not move existent members to the current project' 


    it 'rollbacks changes if transaction fails' 


    context 'when remove_remaining_elements is false' do
      let(:options) { { remove_remaining_elements: false } }

      it 'does not remove remaining project members' 

    end
  end
end

