require 'spec_helper'

describe Projects::LfsPointers::LfsLinkService do
  let!(:project) { create(:project, lfs_enabled: true) }
  let!(:lfs_objects_project) { create_list(:lfs_objects_project, 2, project: project) }
  let(:new_oids) { { 'oid1' => 123, 'oid2' => 125 } }
  let(:all_oids) { LfsObject.pluck(:oid, :size).to_h.merge(new_oids) }
  let(:new_lfs_object) { create(:lfs_object) }
  let(:new_oid_list) { all_oids.merge(new_lfs_object.oid => new_lfs_object.size) }

  subject { described_class.new(project) }

  before do
    allow(project).to receive(:lfs_enabled?).and_return(true)
  end

  describe '#execute' do
    it 'links existing lfs objects to the project' 


    it 'returns linked oids' 

  end
end

