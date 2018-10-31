# frozen_string_literal: true
require 'rails_helper'

describe Gitlab::FileTypeDetection do
  def upload_fixture(filename)
    fixture_file_upload(File.join('spec', 'fixtures', filename))
  end

  describe '#image_or_video?' do
    context 'when class is an uploader' do
      let(:uploader) do
        example_uploader = Class.new(CarrierWave::Uploader::Base) do
          include Gitlab::FileTypeDetection

          storage :file
        end

        example_uploader.new
      end

      it 'returns true for an image file' 


      it 'returns true for a video file' 


      it 'returns false for other extensions' 


      it 'returns false if filename is blank' 

    end

    context 'when class is a regular class' do
      let(:custom_class) do
        custom_class = Class.new do
          include Gitlab::FileTypeDetection
        end

        custom_class.new
      end

      it 'returns true for an image file' 


      it 'returns true for a video file' 


      it 'returns false for other extensions' 


      it 'returns false if filename is blank' 

    end
  end
end

