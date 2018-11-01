# frozen_string_literal: true
require 'spec_helper'

describe Gitlab::Cleanup::RemoteUploads do
  context 'when object_storage is enabled' do
    let(:connection) { double }
    let(:directory) { double }
    let!(:uploads) do
      [
        create(:upload, path: 'dir/file1', store: ObjectStorage::Store::REMOTE),
        create(:upload, path: 'dir/file2', store: ObjectStorage::Store::LOCAL)
      ]
    end
    let(:remote_files) do
      [
        double(key: 'dir/file1'),
        double(key: 'dir/file2'),
        double(key: 'dir/file3'),
        double(key: 'lost_and_found/dir/file3')
      ]
    end

    before do
      stub_uploads_object_storage(FileUploader)

      expect(::Fog::Storage).to receive(:new).and_return(connection)

      expect(connection).to receive(:directories).and_return(double(get: directory))
      expect(directory).to receive(:files).and_return(remote_files)
    end

    context 'when dry_run is set to false' do
      subject { described_class.new.run!(dry_run: false) }

      it 'moves files that are not in uploads table' 

    end

    context 'when dry_run is set to true' do
      subject { described_class.new.run!(dry_run: true) }

      it 'does not move filese' 

    end
  end

  context 'when object_storage is not enabled' do
    it 'does not connect to any storage' 

  end
end
