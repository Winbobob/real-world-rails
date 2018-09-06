require 'rails_helper'

describe AddTicketReply do
  let!(:ticket) { FactoryGirl.create(:ticket) }
  let(:ticket_reply) { FactoryGirl.create(:ticket_reply, ticket: ticket) }

  it 'should attempt to add the reply to helpdesk' 

end

