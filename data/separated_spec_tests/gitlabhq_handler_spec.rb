require 'spec_helper'

describe Gitlab::Email::Handler do
  describe '.for' do
    it 'picks issue handler if there is not merge request prefix' 


    it 'picks merge request handler if there is merge request key' 


    it 'returns nil if no handler is found' 

  end

  describe 'regexps are set properly' do
    let(:addresses) do
      %W(sent_notification_key#{Gitlab::IncomingEmail::UNSUBSCRIBE_SUFFIX} sent_notification_key path/to/project+merge-request+user_email_token path/to/project+user_email_token)
    end

    it 'picks each handler at least once' 


    it 'can pick exactly one handler for each address' 

  end

  def ce_handlers
    @ce_handlers ||= Gitlab::Email::Handler::HANDLERS.reject do |handler|
      handler.name.start_with?('Gitlab::Email::Handler::EE::')
    end
  end
end

