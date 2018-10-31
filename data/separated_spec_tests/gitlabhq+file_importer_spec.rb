require 'spec_helper'

describe Gitlab::ImportExport::FileImporter do
  let(:shared) { Gitlab::ImportExport::Shared.new(nil) }
  let(:storage_path) { "#{Dir.tmpdir}/file_importer_spec" }
  let(:valid_file) { "#{shared.export_path}/valid.json" }
  let(:symlink_file) { "#{shared.export_path}/invalid.json" }
  let(:hidden_symlink_file) { "#{shared.export_path}/.hidden" }
  let(:subfolder_symlink_file) { "#{shared.export_path}/subfolder/invalid.json" }
  let(:evil_symlink_file) { "#{shared.export_path}/.\nevil" }

  before do
    stub_const('Gitlab::ImportExport::FileImporter::MAX_RETRIES', 0)
    stub_uploads_object_storage(FileUploader)

    allow_any_instance_of(Gitlab::ImportExport).to receive(:storage_path).and_return(storage_path)
    allow_any_instance_of(Gitlab::ImportExport::CommandLineUtil).to receive(:untar_zxf).and_return(true)
    allow_any_instance_of(Gitlab::ImportExport::Shared).to receive(:relative_archive_path).and_return('test')
    allow(SecureRandom).to receive(:hex).and_return('abcd')
    setup_files
  end

  after do
    FileUtils.rm_rf(storage_path)
  end

  context 'normal run' do
    before do
      described_class.import(project: build(:project), archive_file: '', shared: shared)
    end

    it 'removes symlinks in root folder' 


    it 'removes hidden symlinks in root folder' 


    it 'removes evil symlinks in root folder' 


    it 'removes symlinks in subfolders' 


    it 'does not remove a valid file' 


    it 'creates the file in the right subfolder' 

  end

  context 'error' do
    before do
      allow_any_instance_of(described_class).to receive(:wait_for_archived_file).and_raise(StandardError)
      described_class.import(project: build(:project), archive_file: '', shared: shared)
    end

    it 'removes symlinks in root folder' 


    it 'removes hidden symlinks in root folder' 


    it 'removes symlinks in subfolders' 


    it 'does not remove a valid file' 

  end

  def setup_files
    FileUtils.mkdir_p("#{shared.export_path}/subfolder/")
    FileUtils.touch(valid_file)
    FileUtils.ln_s(valid_file, symlink_file)
    FileUtils.ln_s(valid_file, subfolder_symlink_file)
    FileUtils.ln_s(valid_file, hidden_symlink_file)
    FileUtils.ln_s(valid_file, evil_symlink_file)
  end
end

