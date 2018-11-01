require 'spec_helper'

describe FileSizeValidator do
  let(:validator) { described_class.new(options) }
  let(:note) { create(:note) }
  let(:attachment) { AttachmentUploader.new(note) }

  describe 'options uses an integer' do
    let(:options) { { maximum: 10, attributes: { attachment: attachment } } }

    it 'attachment exceeds maximum limit' 


    it 'attachment under maximum limit' 

  end

  describe 'options uses a symbol' do
    let(:options) do
      {
        maximum: :max_attachment_size,
        attributes: { attachment: attachment }
      }
    end

    before do
      expect(note).to receive(:max_attachment_size) { 10 }
    end

    it 'attachment exceeds maximum limit' 


    it 'attachment under maximum limit' 

  end
end

