require 'spec_helper'

describe API::Keys do
  let(:user)  { create(:user) }
  let(:admin) { create(:admin) }
  let(:key)   { create(:key, user: user) }
  let(:email) { create(:email, user: user) }

  describe 'GET /keys/:uid' do
    context 'when unauthenticated' do
      it 'returns authentication error' 

    end

    context 'when authenticated' do
      it 'returns 404 for non-existing key' 


      it 'returns single ssh key with user information' 


      it "does not include the user's `is_admin` flag" 

    end
  end
end

