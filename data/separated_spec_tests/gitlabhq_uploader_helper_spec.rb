require 'rails_helper'

describe UploaderHelper do
  let(:uploader) do
    example_uploader = Class.new(CarrierWave::Uploader::Base) do
      include UploaderHelper

      storage :file
    end

    example_uploader.new
  end

  def upload_fixture(filename)
    fixture_file_upload(Rails.root.join('spec', 'fixtures', filename))
  end

  describe '#image_or_video?' do
    it 'returns true for an image file' 


    it 'it returns true for a video file' 


    it 'returns false for other extensions' 

  end
end

