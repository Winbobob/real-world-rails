require 'rails_helper'

describe 'signing out' do
  before do
    user = create_user!
    actually_sign_in_as(user)
    visit root_path
  end
  
  it "can sign out" 

end

