require 'rails_helper'

describe EmailToolSender do
  let(:page) { create(:page, title: 'Foo Bar', slug: 'foo-bar') }
  let(:registered_email) { create(:registered_email_address) }
  let(:targets) { build_list(:email_tool_target, 2) }

  let!(:plugin) do
    create(:email_tool,
           page: page,
           from_email_address: registered_email,
           targets: targets)
  end

  let(:params) do
    { from_email: 'john@email.com',
      from_name: 'John',
      body: 'Suspendisse vestibulum dolor et libero sollicitudin aliquam eu eu purus. Phasellus eget diam in felis
gravida mollis a vitae velit. Duis tempus dolor non finibus convallis. In in ipsum lacinia, pulvinar lectus nec,
condimentum sapien. Nunc non dui dolor. Ut ornare pretium nunc sed ornare. Praesent at risus a felis lacinia pretium
et a neque. Nam non mi in eros sollicitudin imperdiet.',
      subject: 'Some subject',
      country: 'US' }
  end

  before { allow(EmailSender).to receive(:run) }

  def expect_email_sender_to_be_called_with(params)
    expect(EmailSender).to receive(:run)
      .with(hash_including(params))
  end

  it 'calls EmailSender passing the page slug as id' 


  it 'calls EmailSender forwarding the body and subject params' 


  context 'if use_member_email is true' do
    before { plugin.update! use_member_email: true }
    it 'sends the email from the members email address' 


    it 'sets the reply_to to both the member and the plugin from_email_address' 

  end

  context 'if use_member_email is false' do
    it 'sends it from the plugin from_email_address' 


    it 'sets the reply_to to the plugin from_email_address' 

  end

  describe 'targeting' do
    it 'sends it to the test email if present' 


    it 'sends it to the selected target if target_id is present' 


    it 'sends it to all targets if neither the test email nor the target_id are present' 

  end

  it 'creates an action and member with the correct params (not-EEA country)' 


  describe 'Validations' do
    it "fails if the plugin doesn't have a from_email_address configured" 


    it "fails if the plugins doesn't have at least a target" 


    it 'validates the presence of following fields: from_name, from_email, body and subject' 


    it 'validates the format of from_email' 


    it 'checks if the target_id is valid' 


    it 'validates the presence of country' 

  end
end

