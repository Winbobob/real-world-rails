require 'spec_helper'

describe Gitlab::ImportExport::LfsSaver do
  let(:shared) { project.import_export_shared }
  let(:export_path) { "#{Dir.tmpdir}/project_tree_saver_spec" }
  let(:project) { create(:project) }

  subject(:saver) { described_class.new(project: project, shared: shared) }

  before do
    allow_any_instance_of(Gitlab::ImportExport).to receive(:storage_path).and_return(export_path)
    FileUtils.mkdir_p(shared.export_path)
  end

  after do
    FileUtils.rm_rf(shared.export_path)
  end

  describe '#save' do
    context 'when the project has LFS objects locally stored' do
      let(:lfs_object) { create(:lfs_object, :with_file) }

      before do
        project.lfs_objects << lfs_object
      end

      it 'does not cause errors' 


      it 'copies the file in the correct location when there is an lfs object' 

    end

    context 'when the LFS objects are stored in object storage' do
      let(:lfs_object) { create(:lfs_object, :object_storage) }

      before do
        allow(LfsObjectUploader).to receive(:object_store_enabled?).and_return(true)
        allow(lfs_object.file).to receive(:url).and_return('http://my-object-storage.local')
        project.lfs_objects << lfs_object
      end

      it 'downloads the file to include in an archive' 

    end
  end
end

