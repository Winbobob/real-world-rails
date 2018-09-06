require 'spec_helper'

# Rollback DB to 10.5 (later than this was originally written for) because it still needs to work.
describe Gitlab::BackgroundMigration::PopulateUntrackedUploadsDependencies::UntrackedFile, :migration, schema: 20180208183958 do
  include MigrationsHelpers::TrackUntrackedUploadsHelpers

  let!(:appearances) { table(:appearances) }
  let!(:namespaces) { table(:namespaces) }
  let!(:projects) { table(:projects) }
  let!(:routes) { table(:routes) }
  let!(:uploads) { table(:uploads) }

  before(:all) do
    ensure_temporary_tracking_table_exists
  end

  describe '#upload_path' do
    def assert_upload_path(file_path, expected_upload_path)
      untracked_file = create_untracked_file(file_path)

      expect(untracked_file.upload_path).to eq(expected_upload_path)
    end

    context 'for an appearance logo file path' do
      it 'returns the file path relative to the CarrierWave root' 

    end

    context 'for an appearance header_logo file path' do
      it 'returns the file path relative to the CarrierWave root' 

    end

    context 'for a pre-Markdown Note attachment file path' do
      it 'returns the file path relative to the CarrierWave root' 

    end

    context 'for a user avatar file path' do
      it 'returns the file path relative to the CarrierWave root' 

    end

    context 'for a group avatar file path' do
      it 'returns the file path relative to the CarrierWave root' 

    end

    context 'for a project avatar file path' do
      it 'returns the file path relative to the CarrierWave root' 

    end

    context 'for a project Markdown attachment (notes, issues, MR descriptions) file path' do
      it 'returns the file path relative to the project directory in uploads' 

    end
  end

  describe '#uploader' do
    def assert_uploader(file_path, expected_uploader)
      untracked_file = create_untracked_file(file_path)

      expect(untracked_file.uploader).to eq(expected_uploader)
    end

    context 'for an appearance logo file path' do
      it 'returns AttachmentUploader as a string' 

    end

    context 'for an appearance header_logo file path' do
      it 'returns AttachmentUploader as a string' 

    end

    context 'for a pre-Markdown Note attachment file path' do
      it 'returns AttachmentUploader as a string' 

    end

    context 'for a user avatar file path' do
      it 'returns AvatarUploader as a string' 

    end

    context 'for a group avatar file path' do
      it 'returns AvatarUploader as a string' 

    end

    context 'for a project avatar file path' do
      it 'returns AvatarUploader as a string' 

    end

    context 'for a project Markdown attachment (notes, issues, MR descriptions) file path' do
      it 'returns FileUploader as a string' 

    end
  end

  describe '#model_type' do
    def assert_model_type(file_path, expected_model_type)
      untracked_file = create_untracked_file(file_path)

      expect(untracked_file.model_type).to eq(expected_model_type)
    end

    context 'for an appearance logo file path' do
      it 'returns Appearance as a string' 

    end

    context 'for an appearance header_logo file path' do
      it 'returns Appearance as a string' 

    end

    context 'for a pre-Markdown Note attachment file path' do
      it 'returns Note as a string' 

    end

    context 'for a user avatar file path' do
      it 'returns User as a string' 

    end

    context 'for a group avatar file path' do
      it 'returns Namespace as a string' 

    end

    context 'for a project avatar file path' do
      it 'returns Project as a string' 

    end

    context 'for a project Markdown attachment (notes, issues, MR descriptions) file path' do
      it 'returns Project as a string' 

    end
  end

  describe '#model_id' do
    def assert_model_id(file_path, expected_model_id)
      untracked_file = create_untracked_file(file_path)

      expect(untracked_file.model_id).to eq(expected_model_id)
    end

    context 'for an appearance logo file path' do
      it 'returns the ID as a string' 

    end

    context 'for an appearance header_logo file path' do
      it 'returns the ID as a string' 

    end

    context 'for a pre-Markdown Note attachment file path' do
      it 'returns the ID as a string' 

    end

    context 'for a user avatar file path' do
      it 'returns the ID as a string' 

    end

    context 'for a group avatar file path' do
      it 'returns the ID as a string' 

    end

    context 'for a project avatar file path' do
      it 'returns the ID as a string' 

    end

    context 'for a project Markdown attachment (notes, issues, MR descriptions) file path' do
      it 'returns the ID as a string' 

    end
  end

  describe '#file_size' do
    context 'for an appearance logo file path' do
      let(:appearance) { create_or_update_appearance(logo: true) }
      let(:untracked_file) { described_class.create!(path: get_uploads(appearance, 'Appearance').first.path) }

      it 'returns the file size' 

    end

    context 'for a project avatar file path' do
      let(:project) { create_project(avatar: true) }
      let(:untracked_file) { described_class.create!(path: get_uploads(project, 'Project').first.path) }

      it 'returns the file size' 

    end

    context 'for a project Markdown attachment (notes, issues, MR descriptions) file path' do
      let(:project) { create_project }
      let(:untracked_file) { create_untracked_file("/#{get_full_path(project)}/#{get_uploads(project, 'Project').first.path}") }

      before do
        add_markdown_attachment(project)
      end

      it 'returns the file size' 

    end
  end

  def create_untracked_file(path_relative_to_upload_dir)
    described_class.create!(path: "#{Gitlab::BackgroundMigration::PrepareUntrackedUploads::RELATIVE_UPLOAD_DIR}#{path_relative_to_upload_dir}")
  end
end

