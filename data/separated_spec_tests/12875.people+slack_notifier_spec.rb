require 'spec_helper'

describe SlackNotifier do
  let(:slack_config) { OpenStruct.new(webhook_url: 'webhook_url', username: 'PeopleApp') }
  let(:notification) { Object.new }
  let(:response_ok) { Net::HTTPOK.new('1.1', 200, 'OK') }
  let(:notifier) { Slack::Notifier.new(slack_config.webhook_url, username: 'test_user') }

  describe '#new' do
    before do
      allow(AppConfig).to receive(:slack).and_return(slack_config)
    end

    it 'initializes with correct and default options' 


    it 'overwrites default options' 

  end

  describe '#ping' do
    before do
      allow(Slack::Notifier).to receive(:new).and_return(notifier)
    end

    it 'send a message via Slack::Notifier gem' 


    it 'will not call a ping method from Slack::Notifier if webhook_url is not present' 


    it "won't call a ping method from Slack::Notifier if message from notification object is nil" 

  end
end

