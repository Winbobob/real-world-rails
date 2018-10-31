require 'rails_helper'

describe PensionEmailSender do
  def expect_email_sender_to_be_called_with(params)
    expect(EmailSender).to receive(:run)
      .with(hash_including(params))
  end

  let(:page) { create(:page, title: 'Foo Bar', slug: 'foo-bar') }
  let(:registered_email) { create(:registered_email_address) }
  let!(:plugin) {
    create(:email_pension, page: page, from_email_address: registered_email)
  }

  it 'calls EmailSender forwarding valid params' 


  it "sets the 'to' field to the plugin test_email if present" 


  context 'given use_member_email is true' do
    before { plugin.update! use_member_email: true }
    it 'sends the email from the members email address' 


    it 'sets the reply_to to both the member and the plugin from_email_address' 

  end

  context 'given use_member_email is false' do
    it 'sends it from the plugin from_email_address' 


    it 'sets the reply_to to the plugin from_email_address' 

  end

  it 'sets the id to the page_slug' 

end

