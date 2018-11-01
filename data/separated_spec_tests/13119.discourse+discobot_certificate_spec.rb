require 'rails_helper'

describe "Discobot Certificate" do
  let(:user) { Fabricate(:user, name: 'Jeff Atwood') }

  let(:params) {
    {
      date: Time.zone.now.strftime("%b %d %Y"),
      user_id: user.id
    }
  }

  describe 'when viewing the certificate' do
    describe 'when no logged in' do
      it 'should return the right response' 

    end

    describe 'when logged in' do
      before do
        sign_in(user)
      end

      it 'should return the right text' 


      describe 'when params are missing' do
        it "should raise the right errors" 

      end
    end
  end
end

