require 'spec_helper'

describe SlackInviteJob do
  subject { SlackInviteJob.new }
  let(:email) { 'random@random.com' }
  before { expect(Slack).to receive_message_chain(:config, :token).and_return 'test' }

  it 'sends a post request to invite the user to slack and returns the proper response' 


  context 'when invite attempt fails notify admin' do
    let(:error) { StandardError.new 'boom!' }

    before do
      stub_request(:post, SlackInviteJob::SLACK_INVITE_URL).and_raise(error)
    end

    it 'sends the email later' 


    it 'includes information about user and error' 

  end

  context 'when slack response not ok should notify admin' do
    before do
      stub_request(:post, SlackInviteJob::SLACK_INVITE_URL)
          .to_return(body: '{"ok": false, "error": "already invited"}')
    end

    it 'sends the email later' 


    it 'includes information about user and error' 

  end
end

