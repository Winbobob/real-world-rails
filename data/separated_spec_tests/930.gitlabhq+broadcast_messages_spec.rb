require 'spec_helper'

describe API::BroadcastMessages do
  set(:user)  { create(:user) }
  set(:admin) { create(:admin) }
  set(:message) { create(:broadcast_message) }

  describe 'GET /broadcast_messages' do
    it 'returns a 401 for anonymous users' 


    it 'returns a 403 for users' 


    it 'returns an Array of BroadcastMessages for admins' 

  end

  describe 'GET /broadcast_messages/:id' do
    it 'returns a 401 for anonymous users' 


    it 'returns a 403 for users' 


    it 'returns the specified message for admins' 

  end

  describe 'POST /broadcast_messages' do
    it 'returns a 401 for anonymous users' 


    it 'returns a 403 for users' 


    context 'as an admin' do
      it 'requires the `message` parameter' 


      it 'defines sane default start and end times' 


      it 'accepts a custom background and foreground color' 

    end
  end

  describe 'PUT /broadcast_messages/:id' do
    it 'returns a 401 for anonymous users' 


    it 'returns a 403 for users' 


    context 'as an admin' do
      it 'accepts new background and foreground colors' 


      it 'accepts new start and end times' 


      it 'accepts a new message' 

    end
  end

  describe 'DELETE /broadcast_messages/:id' do
    it 'returns a 401 for anonymous users' 


    it 'returns a 403 for users' 


    it_behaves_like '412 response' do
      let(:request) { api("/broadcast_messages/#{message.id}", admin) }
    end

    it 'deletes the broadcast message for admins' 

  end
end

