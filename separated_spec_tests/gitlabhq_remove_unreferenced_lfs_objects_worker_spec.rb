require 'spec_helper'

describe RemoveUnreferencedLfsObjectsWorker do
  let(:worker) { described_class.new }

  describe '#perform' do
    let!(:unreferenced_lfs_object1) { create(:lfs_object, oid: '1') }
    let!(:unreferenced_lfs_object2) { create(:lfs_object, oid: '2') }
    let!(:project1) { create(:project, lfs_enabled: true) }
    let!(:project2) { create(:project, lfs_enabled: true) }
    let!(:referenced_lfs_object1) { create(:lfs_object, oid: '3') }
    let!(:referenced_lfs_object2) { create(:lfs_object, oid: '4') }
    let!(:lfs_objects_project1_1) do
      create(:lfs_objects_project,
                project: project1,
                lfs_object: referenced_lfs_object1
            )
    end
    let!(:lfs_objects_project2_1) do
      create(:lfs_objects_project,
                project: project2,
                lfs_object: referenced_lfs_object1
            )
    end
    let!(:lfs_objects_project1_2) do
      create(:lfs_objects_project,
                project: project1,
                lfs_object: referenced_lfs_object2
            )
    end

    it 'removes unreferenced lfs objects' 


    it 'leaves referenced lfs objects' 


    it 'removes unreferenced lfs objects after project removal' 

  end
end

