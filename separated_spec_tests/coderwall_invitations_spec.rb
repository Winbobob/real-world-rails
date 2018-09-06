require 'spec_helper'

RSpec.describe 'Viewing an invitation', type: :request, skip: true do

  before :each do
    @user = Fabricate(:user)
    @team = Fabricate(:team)
  end

  describe 'when logged in' do

    def sign_in
      allow(User).to receive(:find_with_oauth).and_return(@user)
      post '/sessions'
    end

    it 'should render invitation page for logged in user' 


  end

  describe 'when logged out' do
    it 'should show invitation page asking user to sign in' 


  end

end

