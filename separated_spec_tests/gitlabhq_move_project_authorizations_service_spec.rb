require 'spec_helper'

describe Projects::MoveProjectAuthorizationsService do
  let!(:user) { create(:user) }
  let(:project_with_users) { create(:project, namespace: user.namespace) }
  let(:target_project) { create(:project, namespace: user.namespace) }
  let(:master_user) { create(:user) }
  let(:reporter_user) { create(:user) }
  let(:developer_user) { create(:user) }

  subject { described_class.new(target_project, user) }

  describe '#execute' do
    before do
      project_with_users.add_master(master_user)
      project_with_users.add_developer(developer_user)
      project_with_users.add_reporter(reporter_user)
    end

    it 'moves the authorizations from one project to another' 


    it 'does not move existent authorizations to the current project' 


    context 'when remove_remaining_elements is false' do
      let(:options) { { remove_remaining_elements: false } }

      it 'does not remove remaining project authorizations' 

    end
  end
end

