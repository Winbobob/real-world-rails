require 'rails_helper'
require 'jobs/regular/send_system_message'

describe Jobs::SendSystemMessage do

  it "raises an error without a user_id" 


  it "raises an error without a message_type" 


  context 'with valid parameters' do

    let(:user) { Fabricate(:user) }

    it "should call SystemMessage.create" 


    it "can send message parameters" 


  end

end

