require 'spec_helper'

describe 'Spree OAuth', type: :request do
  let!(:user) { create(:user, email: 'new@user.com', password: 'secret', password_confirmation: 'secret') }

  describe 'get token' do
    context 'by password' do
      before do
        allow(Spree.user_class).to receive(:find_for_database_authentication).with(hash_including(:email)) { user }
        allow(user).to receive(:valid_for_authentication?).and_return(true)
        post '/spree_oauth/token?grant_type=password&username=new@user.com&password=secret'
      end

      it 'returns new token' 

    end
  end
end

