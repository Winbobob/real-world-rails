require 'rails_helper'

describe 'read-only message' do
  set(:user) { create(:user) }

  before do
    sign_in(user)
  end

  it 'shows read-only banner when database is read-only' 


  it 'does not show read-only banner when database is able to read-write' 

end

