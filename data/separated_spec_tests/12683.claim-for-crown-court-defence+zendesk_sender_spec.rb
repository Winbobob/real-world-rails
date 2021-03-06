require 'rails_helper'

RSpec.describe ZendeskSender do

  let(:ticket_payload) { double 'ticket_payload', subject: 'Bug report', description: 'event - outcome - email address', referrer: '/claims', user_agent: 'chrome' }
  subject { ZendeskSender.new(ticket_payload) }

  before(:each) do
    allow(Rails).to receive(:host).and_return(double(env: 'test'))
    stub_request(:post, %r{\Ahttps://.*ministryofjustice.zendesk.com/api/v2/tickets\z}).
            with(
              :body => "{\"ticket\":{\"subject\":\"Bug report\",\"description\":\"event - outcome - email address\",\"custom_fields\":[{\"id\":\"26047167\",\"value\":\"/claims\"},{\"id\":\"23757677\",\"value\":\"advocate_defence_payments\"},{\"id\":\"23791776\",\"value\":\"chrome\"},{\"id\":\"32342378\",\"value\":\"test\"}]}}",
              :headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/json', 'User-Agent'=>'ZendeskAPI Ruby 1.12.1'}).
            to_return(:status => 201, :body => "", :headers => {})
  end

  describe '.send!' do
    it 'instantiates a new ZendeskSender object, with a payload and calls the instance method #send!' 


    describe '#send!' do
      it 'creates a new Zendesk Ticket' 


      it 'and a duck-typed ticket_payload is used via a common interface: #subject, #description, #referrer, #user_agent' 

    end

  end

end

