require 'rails_helper'

RSpec.describe UnsubscribeService, type: :service do
  let(:account) { Fabricate(:account, username: 'bob', domain: 'example.com', hub_url: 'http://hub.example.com') }
  subject { UnsubscribeService.new }

  it 'removes the secret and resets expiration on account' 


  it 'logs error on subscription failure' 


  it 'logs error on connection failure' 


  def stub_logger
    double(debug: nil).tap do |logger|
      allow(Rails).to receive(:logger).and_return(logger)
    end
  end
end

