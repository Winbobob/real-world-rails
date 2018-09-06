require 'spec_helper'
require Rails.root.join('db', 'post_migrate', '20170317162059_update_upload_paths_to_system.rb')

describe UpdateUploadPathsToSystem, :migration do
  let(:migration) { described_class.new }
  let(:uploads_table) { table(:uploads) }
  let(:base_upload_attributes) { { size: 42, uploader: 'John Doe' } }

  before do
    allow(migration).to receive(:say)
  end

  describe '#uploads_to_switch_to_new_path' do
    it 'contains only uploads with the old path for the correct models' 

  end

  describe '#uploads_to_switch_to_old_path' do
    it 'contains only uploads with the new path for the correct models' 

  end

  describe '#up' do
    it 'updates old upload records to the new path' 

  end

  describe '#down' do
    it 'updates the new system patsh to the old paths' 

  end

  def create_upload(type, path)
    uploads_table.create(base_upload_attributes.merge(model_type: type, path: path))
  end
end

