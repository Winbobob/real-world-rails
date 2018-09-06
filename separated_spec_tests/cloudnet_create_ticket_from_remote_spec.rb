require 'rails_helper'

describe CreateTicketFromRemote do
  let(:ticket) { FactoryGirl.create(:ticket, reference: 'EXISTINGREF') }

  it 'should not do anything if the ticket reference exists' 


  it "should not create the ticket details if the user doesn't exist" 


  it 'should create the ticket if everything is fine' 

end

