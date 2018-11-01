require 'spec_helper'

describe UsersFinder do
  describe '#execute' do
    let!(:user1) { create(:user, username: 'johndoe') }
    let!(:user2) { create(:user, :blocked, username: 'notsorandom') }
    let!(:external_user) { create(:user, :external) }
    let!(:omniauth_user) { create(:omniauth_user, provider: 'twitter', extern_uid: '123456') }

    context 'with a normal user' do
      let(:user) { create(:user) }

      it 'returns all users' 


      it 'filters by username' 


      it 'filters by username (case insensitive)' 


      it 'filters by search' 


      it 'filters by blocked users' 


      it 'filters by active users' 


      it 'returns no external users' 


      it 'filters by created_at' 


      it 'does not filter by custom attributes' 

    end

    context 'with an admin user' do
      let(:admin) { create(:admin) }

      it 'filters by external users' 


      it 'returns all users' 


      it 'filters by custom attributes' 

    end
  end
end

