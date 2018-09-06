require 'rails_helper'

describe 'user signin' do
  skip "DEPRECATED" do
    let(:user) { build(:user) }

    it 'allows signin with valid credentials' 


    it 'does not allow signin with invalid credentials' 


    it 'does not allow user to sign in on a subdomain he is not a member of'

    it 'allows to swich from one subdomain to another when logged in' 


    it 'allows user to sign out' 


  end
end

