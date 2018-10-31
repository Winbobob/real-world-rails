require 'spec_helper'

describe API::V3::BroadcastMessages do
  set(:user)  { create(:user) }
  set(:admin) { create(:admin) }

  describe 'DELETE /broadcast_messages/:id' do
    set(:message) { create(:broadcast_message) }

    it 'returns a 401 for anonymous users' 


    it 'returns a 403 for users' 


    it 'deletes the broadcast message for admins' 

  end
end

