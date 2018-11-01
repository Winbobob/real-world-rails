require 'rails_helper'

describe RecordsUploads do
  let!(:uploader) do
    class RecordsUploadsExampleUploader < GitlabUploader
      include RecordsUploads::Concern

      storage :file

      def dynamic_segment
        'co/fe/ee'
      end
    end

    RecordsUploadsExampleUploader.new(build_stubbed(:user))
  end

  def upload_fixture(filename)
    fixture_file_upload(File.join('spec', 'fixtures', filename))
  end

  describe 'callbacks' do
    let(:upload) { create(:upload) }

    before do
      uploader.upload = upload
    end

    it '#record_upload after `store`' 


    it '#destroy_upload after `remove`' 

  end

  describe '#record_upload callback' do
    it 'creates an Upload record after store' 


    it 'creates a new record and assigns size, path, model, and uploader' 


    it "does not create an Upload record when the file doesn't exist" 


    it 'does not create an Upload record if model is missing' 


    it 'it destroys Upload records at the same path before recording' 

  end

  describe '#destroy_upload callback' do
    it 'it destroys Upload records at the same path after removal' 

  end
end

