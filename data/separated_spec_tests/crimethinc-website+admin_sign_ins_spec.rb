require 'rails_helper'

describe 'Signing in as an admin' do
  before do
    create(:user, username: 'user1', password: 'c' * 31)
  end

  let(:other_user) { create(:user, username: 'user2', password: 'Na' * 30) }

  it 'Signing in with correct credentials' 


  it 'Signing in with invalid password' 

end

