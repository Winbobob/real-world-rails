require 'feature_helper'

describe HealthCheck::SendGrid do
  let(:send_grid) { HealthCheck::SendGrid.new }
  let(:smtp)      { double Net::SMTP          }

  context '#available?' do
    it 'returns true if the component is available' 


    it 'returns false if the component is not available' 

  end

  context '#accessible?' do
    before(:each) do
      allow(Net::SMTP).to receive(:start).and_yield(smtp)
    end

    it 'returns true if the component is accessible with our credentials' 


    it 'returns false if the component is not accessible with our credentials' 

  end

  context '#error_messages' do
    it 'returns the exception messages if there is an error accessing the component' 


    it 'returns an error an backtrace for errors not specific to a component' 

  end
end

