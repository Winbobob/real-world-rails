require 'spec_helper'

# Rollback DB to 10.5 (later than this was originally written for) because it still needs to work.
describe Gitlab::BackgroundMigration::PopulateUntrackedUploads, :sidekiq, :migration, schema: 20180208183958 do
  include MigrationsHelpers::TrackUntrackedUploadsHelpers

  subject { described_class.new }

  let!(:appearances) { table(:appearances) }
  let!(:namespaces) { table(:namespaces) }
  let!(:notes) { table(:notes) }
  let!(:projects) { table(:projects) }
  let!(:routes) { table(:routes) }
  let!(:untracked_files_for_uploads) { table(:untracked_files_for_uploads) }
  let!(:uploads) { table(:uploads) }
  let!(:users) { table(:users) }

  before do
    ensure_temporary_tracking_table_exists
    uploads.delete_all
  end

  context 'with untracked files and tracked files in untracked_files_for_uploads' do
    let!(:appearance) { create_or_update_appearance(logo: true, header_logo: true) }
    let!(:user1) { create_user(avatar: true) }
    let!(:user2) { create_user(avatar: true) }
    let!(:project1) { create_project(avatar: true) }
    let!(:project2) { create_project(avatar: true) }

    before do
      add_markdown_attachment(project1)
      add_markdown_attachment(project2)

      # File records created by PrepareUntrackedUploads
      untracked_files_for_uploads.create!(path: get_uploads(appearance, 'Appearance').first.path)
      untracked_files_for_uploads.create!(path: get_uploads(appearance, 'Appearance').last.path)
      untracked_files_for_uploads.create!(path: get_uploads(user1, 'User').first.path)
      untracked_files_for_uploads.create!(path: get_uploads(user2, 'User').first.path)
      untracked_files_for_uploads.create!(path: get_uploads(project1, 'Project').first.path)
      untracked_files_for_uploads.create!(path: get_uploads(project2, 'Project').first.path)
      untracked_files_for_uploads.create!(path: "#{legacy_project_uploads_dir(project1).sub("#{MigrationsHelpers::TrackUntrackedUploadsHelpers::PUBLIC_DIR}/", '')}/#{get_uploads(project1, 'Project').last.path}")
      untracked_files_for_uploads.create!(path: "#{legacy_project_uploads_dir(project2).sub("#{MigrationsHelpers::TrackUntrackedUploadsHelpers::PUBLIC_DIR}/", '')}/#{get_uploads(project2, 'Project').last.path}")

      # Untrack 4 files
      get_uploads(user2, 'User').delete_all
      get_uploads(project2, 'Project').delete_all # 2 files: avatar and a Markdown upload
      get_uploads(appearance, 'Appearance').where("path like '%header_logo%'").delete_all
    end

    it 'adds untracked files to the uploads table' 


    it 'deletes rows after processing them' 


    it 'does not create duplicate uploads of already tracked files' 


    it 'uses the start and end batch ids [only 1st half]' 


    it 'uses the start and end batch ids [only 2nd half]' 


    it 'does not drop the temporary tracking table after processing the batch, if there are still untracked rows' 


    it 'drops the temporary tracking table after processing the batch, if there are no untracked rows left' 


    it 'does not block a whole batch because of one bad path' 


    it 'an unparseable path is shown in error output' 

  end

  context 'with no untracked files' do
    it 'does not add to the uploads table (and does not raise error)' 

  end

  describe 'upload outcomes for each path pattern' do
    shared_examples_for 'non_markdown_file' do
      let!(:expected_upload_attrs) { model_uploads.first.attributes.slice('path', 'uploader', 'size', 'checksum') }
      let!(:untracked_file) { untracked_files_for_uploads.create!(path: expected_upload_attrs['path']) }

      before do
        model_uploads.delete_all
      end

      it 'creates an Upload record' 

    end

    context 'for an appearance logo file path' do
      let(:model) { create_or_update_appearance(logo: true) }
      let(:model_uploads) { get_uploads(model, 'Appearance') }

      it_behaves_like 'non_markdown_file'
    end

    context 'for an appearance header_logo file path' do
      let(:model) { create_or_update_appearance(header_logo: true) }
      let(:model_uploads) { get_uploads(model, 'Appearance') }

      it_behaves_like 'non_markdown_file'
    end

    context 'for a pre-Markdown Note attachment file path' do
      let(:model) { create_note(attachment: true) }
      let!(:expected_upload_attrs) { get_uploads(model, 'Note').first.attributes.slice('path', 'uploader', 'size', 'checksum') }
      let!(:untracked_file) { untracked_files_for_uploads.create!(path: expected_upload_attrs['path']) }

      before do
        get_uploads(model, 'Note').delete_all
      end

      # Can't use the shared example because Note doesn't have an `uploads` association
      it 'creates an Upload record' 

    end

    context 'for a user avatar file path' do
      let(:model) { create_user(avatar: true) }
      let(:model_uploads) { get_uploads(model, 'User') }

      it_behaves_like 'non_markdown_file'
    end

    context 'for a group avatar file path' do
      let(:model) { create_group(avatar: true) }
      let(:model_uploads) { get_uploads(model, 'Namespace') }

      it_behaves_like 'non_markdown_file'
    end

    context 'for a project avatar file path' do
      let(:model) { create_project(avatar: true) }
      let(:model_uploads) { get_uploads(model, 'Project') }

      it_behaves_like 'non_markdown_file'
    end

    context 'for a project Markdown attachment (notes, issues, MR descriptions) file path' do
      let(:model) { create_project }

      before do
        # Upload the file
        add_markdown_attachment(model)

        # Create the untracked_files_for_uploads record
        untracked_files_for_uploads.create!(path: "#{Gitlab::BackgroundMigration::PrepareUntrackedUploads::RELATIVE_UPLOAD_DIR}/#{get_full_path(model)}/#{get_uploads(model, 'Project').first.path}")

        # Save the expected upload attributes
        @expected_upload_attrs = get_uploads(model, 'Project').first.attributes.slice('path', 'uploader', 'size', 'checksum')

        # Untrack the file
        get_uploads(model, 'Project').delete_all
      end

      it 'creates an Upload record' 

    end
  end
end

