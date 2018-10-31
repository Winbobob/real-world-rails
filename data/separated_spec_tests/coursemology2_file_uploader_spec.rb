# frozen_string_literal: true
require 'rails_helper'
require 'carrierwave/test/matchers'

RSpec.describe FileUploader, type: :model do
  include CarrierWave::Test::Matchers

  let(:attachment) { create(:attachment) }

  before do
    @uploader = FileUploader.new(attachment, :file_upload)

    File.open(File.join(Rails.root, '/spec/fixtures/files/text.txt')) do |f|
      @uploader.store!(f)
    end
  end

  it 'uploads the file' 


  it 'sets the correct permission' 

end

