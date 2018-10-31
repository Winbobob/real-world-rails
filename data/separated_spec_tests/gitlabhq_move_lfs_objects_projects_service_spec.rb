require 'spec_helper'

describe Projects::MoveLfsObjectsProjectsService do
  let!(:user) { create(:user) }
  let!(:project_with_lfs_objects) { create(:project, namespace: user.namespace) }
  let!(:target_project) { create(:project, namespace: user.namespace) }

  subject { described_class.new(target_project, user) }

  before do
    create_list(:lfs_objects_project, 3, project: project_with_lfs_objects)
  end

  describe '#execute' do
    it 'links the lfs objects from existent in source project' 


    it 'does not link existent lfs_object in the current project' 


    it 'rollbacks changes if transaction fails' 


    context 'when remove_remaining_elements is false' do
      let(:options) { { remove_remaining_elements: false } }

      it 'does not remove remaining lfs objects' 

    end
  end
end

