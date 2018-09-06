# frozen_string_literal: true
require 'rails_helper'
require 'carrierwave/test/matchers'

RSpec.describe ImageUploader, type: :model do
  include CarrierWave::Test::Matchers
  let(:instance) { Instance.default }

  with_tenant(:instance) do
    let(:course) { create(:course) }
    let(:uploader) { ImageUploader.new(course, :logo) }

    before do
      ImageUploader.enable_processing = true

      File.open(File.join(Rails.root, '/spec/fixtures/files/picture.jpg'), 'rb') do |f|
        uploader.store!(f)
      end
    end

    after do
      ImageUploader.enable_processing = false
      uploader.remove!
    end

    context 'the thumb version' do
      it 'scales down a landscape image to be exactly 64 by 64 pixels' 

    end

    context 'the small version' do
      it 'scales down a landscape image to be exactly 100 by 100 pixels' 

    end

    context 'the medium version' do
      it 'scales down a landscape image to be exactly 200 by 200 pixels' 

    end

    context 'when the image format is invalid' do
      it 'raises an error' 

    end
  end
end

