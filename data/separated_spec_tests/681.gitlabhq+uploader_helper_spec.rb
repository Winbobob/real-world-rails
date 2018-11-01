require 'rails_helper'

describe UploaderHelper do
  let(:uploader) do
    example_uploader = Class.new(CarrierWave::Uploader::Base) do
      include UploaderHelper

      storage :file
    end

    example_uploader.new
  end

  describe '#extension_match?' do
    it 'returns false if file does not exists' 

  end
end

