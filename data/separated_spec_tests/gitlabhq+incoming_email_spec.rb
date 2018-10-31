require "spec_helper"

describe Gitlab::IncomingEmail do
  describe "self.enabled?" do
    context "when reply by email is enabled" do
      before do
        stub_incoming_email_setting(enabled: true)
      end

      it 'returns true' 

    end

    context "when reply by email is disabled" do
      before do
        stub_incoming_email_setting(enabled: false)
      end

      it "returns false" 

    end
  end

  describe 'self.supports_wildcard?' do
    context 'address contains the wildcard placeholder' do
      before do
        stub_incoming_email_setting(address: 'replies+%{key}@example.com')
      end

      it 'confirms that wildcard is supported' 

    end

    context "address doesn't contain the wildcard placeholder" do
      before do
        stub_incoming_email_setting(address: 'replies@example.com')
      end

      it 'returns that wildcard is not supported' 

    end

    context 'address is not set' do
      before do
        stub_incoming_email_setting(address: nil)
      end

      it 'returns that wildcard is not supported' 

    end
  end

  context 'self.unsubscribe_address' do
    before do
      stub_incoming_email_setting(address: 'replies+%{key}@example.com')
    end

    it 'returns the address with interpolated reply key and unsubscribe suffix' 

  end

  context "self.reply_address" do
    before do
      stub_incoming_email_setting(address: "replies+%{key}@example.com")
    end

    it "returns the address with an interpolated reply key" 

  end

  context "self.key_from_address" do
    before do
      stub_incoming_email_setting(address: "replies+%{key}@example.com")
    end

    it "returns reply key" 


    it 'does not match emails with extra bits' 

  end

  context 'self.key_from_fallback_message_id' do
    it 'returns reply key' 

  end

  context 'self.scan_fallback_references' do
    let(:references) do
      '<issue_1@localhost>' +
        ' <reply-59d8df8370b7e95c5a49fbf86aeb2c93@localhost>' +
        ',<exchange@microsoft.com>'
    end

    it 'returns reply key' 

  end
end

