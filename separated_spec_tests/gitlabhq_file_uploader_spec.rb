require 'spec_helper'

describe FileUploader do
  let(:group) { create(:group, name: 'awesome') }
  let(:project) { create(:project, :legacy_storage, namespace: group, name: 'project') }
  let(:uploader) { described_class.new(project) }
  let(:upload)  { double(model: project, path: 'secret/foo.jpg') }

  subject { uploader }

  shared_examples 'builds correct legacy storage paths' do
    include_examples 'builds correct paths',
                     store_dir: %r{awesome/project/\h+},
                     upload_path: %r{\h+/<filename>},
                     absolute_path: %r{#{described_class.root}/awesome/project/secret/foo.jpg}
  end

  context 'legacy storage' do
    it_behaves_like 'builds correct legacy storage paths'

    context 'uses hashed storage' do
      context 'when rolled out attachments' do
        let(:project) { build_stubbed(:project, namespace: group, name: 'project') }

        include_examples 'builds correct paths',
                         store_dir: %r{@hashed/\h{2}/\h{2}/\h+},
                         upload_path: %r{\h+/<filename>}
      end

      context 'when only repositories are rolled out' do
        let(:project) { build_stubbed(:project, namespace: group, name: 'project', storage_version: Project::HASHED_STORAGE_FEATURES[:repository]) }

        it_behaves_like 'builds correct legacy storage paths'
      end
    end
  end

  context 'object store is remote' do
    before do
      stub_uploads_object_storage
    end

    include_context 'with storage', described_class::Store::REMOTE

    # always use hashed storage path for remote uploads
    it_behaves_like 'builds correct paths',
                     store_dir: %r{@hashed/\h{2}/\h{2}/\h+},
                     upload_path: %r{@hashed/\h{2}/\h{2}/\h+/\h+/<filename>}
  end

  describe 'initialize' do
    let(:uploader) { described_class.new(double, secret: 'secret') }

    it 'accepts a secret parameter' 

  end

  describe 'callbacks' do
    describe '#prune_store_dir after :remove' do
      before do
        uploader.store!(fixture_file_upload('spec/fixtures/doc_sample.txt'))
      end

      def store_dir
        File.expand_path(uploader.store_dir, uploader.root)
      end

      it 'is called' 


      it 'prune the store directory' 

    end
  end

  describe '#secret' do
    it 'generates a secret if none is provided' 

  end

  describe "#migrate!" do
    before do
      uploader.store!(fixture_file_upload(Rails.root.join('spec/fixtures/dk.png')))
      stub_uploads_object_storage
    end

    it_behaves_like "migrates", to_store: described_class::Store::REMOTE
    it_behaves_like "migrates", from_store: described_class::Store::REMOTE, to_store: described_class::Store::LOCAL
  end

  describe '#upload=' do
    let(:secret) { SecureRandom.hex }
    let(:upload) { create(:upload, :issuable_upload, secret: secret, filename: 'file.txt') }

    it 'handles nil' 


    it 'extract the uploader context from it' 

  end
end

