require 'spec_helper'

describe Projects::HashedStorage::MigrateAttachmentsService do
  subject(:service) { described_class.new(project) }
  let(:project) { create(:project, :legacy_storage) }
  let(:legacy_storage) { Storage::LegacyProject.new(project) }
  let(:hashed_storage) { Storage::HashedProject.new(project) }

  let!(:upload) { Upload.find_by(path: file_uploader.upload_path) }
  let(:file_uploader) { build(:file_uploader, project: project) }
  let(:old_path) { File.join(base_path(legacy_storage), upload.path) }
  let(:new_path) { File.join(base_path(hashed_storage), upload.path) }

  context '#execute' do
    context 'when succeeds' do
      it 'moves attachments to hashed storage layout' 

    end

    context 'when original folder does not exist anymore' do
      before do
        FileUtils.rm_rf(base_path(legacy_storage))
      end

      it 'skips moving folders and go to next' 

    end

    context 'when target folder already exists' do
      before do
        FileUtils.mkdir_p(base_path(hashed_storage))
      end

      it 'raises AttachmentMigrationError' 

    end
  end

  def base_path(storage)
    File.join(FileUploader.root, storage.disk_path)
  end
end

