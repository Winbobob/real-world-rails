require 'spec_helper'

describe ObjectStorage::DirectUpload do
  let(:credentials) do
    {
      provider: 'AWS',
      aws_access_key_id: 'AWS_ACCESS_KEY_ID',
      aws_secret_access_key: 'AWS_SECRET_ACCESS_KEY'
    }
  end

  let(:storage_url) { 'https://uploads.s3.amazonaws.com/' }

  let(:bucket_name) { 'uploads' }
  let(:object_name) { 'tmp/uploads/my-file' }
  let(:maximum_size) { 1.gigabyte }

  let(:direct_upload) { described_class.new(credentials, bucket_name, object_name, has_length: has_length, maximum_size: maximum_size) }

  before do
    Fog.unmock!
  end

  describe '#has_length' do
    context 'is known' do
      let(:has_length) { true }
      let(:maximum_size) { nil }

      it "maximum size is not required" 

    end

    context 'is unknown' do
      let(:has_length) { false }

      context 'and maximum size is specified' do
        let(:maximum_size) { 1.gigabyte }

        it "does not raise an error" 

      end

      context 'and maximum size is not specified' do
        let(:maximum_size) { nil }

        it "raises an error" 

      end
    end
  end

  describe '#to_hash' do
    subject { direct_upload.to_hash }

    shared_examples 'a valid upload' do
      it "returns valid structure" 

    end

    shared_examples 'a valid upload with multipart data' do
      before do
        stub_object_storage_multipart_init(storage_url, "myUpload")
      end

      it_behaves_like 'a valid upload'

      it "returns valid structure" 


      it 'uses only strings in query parameters' 

    end

    shared_examples 'a valid upload without multipart data' do
      it_behaves_like 'a valid upload'

      it "returns valid structure" 

    end

    context 'when AWS is used' do
      context 'when length is known' do
        let(:has_length) { true }

        it_behaves_like 'a valid upload without multipart data'
      end

      context 'when length is unknown' do
        let(:has_length) { false }

        it_behaves_like 'a valid upload with multipart data' do
          context 'when maximum upload size is 10MB' do
            let(:maximum_size) { 10.megabyte }

            it 'returns only 2 parts' 


            it 'part size is mimimum, 5MB' 

          end

          context 'when maximum upload size is 12MB' do
            let(:maximum_size) { 12.megabyte }

            it 'returns only 3 parts' 


            it 'part size is rounded-up to 5MB' 

          end

          context 'when maximum upload size is 49GB' do
            let(:maximum_size) { 49.gigabyte }

            it 'returns maximum, 100 parts' 


            it 'part size is rounded-up to 5MB' 

          end
        end
      end
    end

    context 'when Google is used' do
      let(:credentials) do
        {
          provider: 'Google',
          google_storage_access_key_id: 'GOOGLE_ACCESS_KEY_ID',
          google_storage_secret_access_key: 'GOOGLE_SECRET_ACCESS_KEY'
        }
      end

      let(:storage_url) { 'https://storage.googleapis.com/uploads/' }

      context 'when length is known' do
        let(:has_length) { true }

        it_behaves_like 'a valid upload without multipart data'
      end

      context 'when length is unknown' do
        let(:has_length) { false }

        it_behaves_like 'a valid upload without multipart data'
      end
    end
  end
end

