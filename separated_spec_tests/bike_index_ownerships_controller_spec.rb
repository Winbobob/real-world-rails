require 'spec_helper'

describe OwnershipsController do
  describe 'show' do
    it 'sets the flash with absent user for create account' 


    it 'sets the flash with sign in for owner exists' 


    describe 'user present' do
      before :each do
        @user = FactoryGirl.create(:confirmed_user)
        @ownership = FactoryGirl.create(:ownership)
        set_current_user(@user)
      end

      it 'redirects and not change the ownership' 


      it "redirects and not change the ownership if it isn't current" 


      it 'redirects and mark current based on fuzzy find' 

    end
  end
end

