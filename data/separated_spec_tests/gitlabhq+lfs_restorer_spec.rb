require 'spec_helper'

describe Gitlab::ImportExport::LfsRestorer do
  include UploadHelpers

  let(:export_path) { "#{Dir.tmpdir}/lfs_object_restorer_spec" }
  let(:project) { create(:project) }
  let(:shared) { project.import_export_shared }
  subject(:restorer) { described_class.new(project: project, shared: shared) }

  before do
    allow_any_instance_of(Gitlab::ImportExport).to receive(:storage_path).and_return(export_path)
    FileUtils.mkdir_p(shared.export_path)
  end

  after do
    FileUtils.rm_rf(shared.export_path)
  end

  describe '#restore' do
    context 'when the archive contains lfs files' do
      let(:dummy_lfs_file_path) { File.join(shared.export_path, 'lfs-objects', 'dummy') }

      def create_lfs_object_with_content(content)
        dummy_lfs_file = Tempfile.new('existing')
        File.write(dummy_lfs_file.path, content)
        size = dummy_lfs_file.size
        oid = LfsObject.calculate_oid(dummy_lfs_file.path)
        LfsObject.create!(oid: oid, size: size, file: dummy_lfs_file)
      end

      before do
        FileUtils.mkdir_p(File.dirname(dummy_lfs_file_path))
        File.write(dummy_lfs_file_path, 'not very large')
        allow(restorer).to receive(:lfs_file_paths).and_return([dummy_lfs_file_path])
      end

      it 'creates an lfs object for the project' 


      it 'assigns the file correctly' 


      it 'links an existing LFS object if it existed' 


      it 'succeeds' 


      it 'stores the upload' 

    end

    context 'without any LFS-objects' do
      it 'succeeds' 

    end
  end
end

