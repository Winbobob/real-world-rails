require 'spec_helper'

describe Projects::MoveDeployKeysProjectsService do
  let!(:user) { create(:user) }
  let!(:project_with_deploy_keys) { create(:project, namespace: user.namespace) }
  let!(:target_project) { create(:project, namespace: user.namespace) }

  subject { described_class.new(target_project, user) }

  describe '#execute' do
    before do
      create_list(:deploy_keys_project, 2, project: project_with_deploy_keys)
    end

    it 'moves the user\'s deploy keys from one project to another' 


    it 'does not link existent deploy_keys in the current project' 


    it 'rollbacks changes if transaction fails' 


    context 'when remove_remaining_elements is false' do
      let(:options) { { remove_remaining_elements: false } }

      it 'does not remove remaining deploy keys projects' 

    end
  end
end

