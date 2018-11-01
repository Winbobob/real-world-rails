require "spec_helper"

describe Gitlab::Email::AttachmentUploader do
  describe "#execute" do
    let(:project) { create(:project) }
    let(:message_raw) { fixture_file("emails/attachment.eml") }
    let(:message) { Mail::Message.new(message_raw) }

    it "uploads all attachments and returns their links" 

  end
end

