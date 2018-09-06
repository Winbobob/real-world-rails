require 'rails_helper'

describe AccountsController, type: :controller do
  it 'should allow session role to become student or teacher but not staff' 


  context 'referral feature' do
    describe 'on create' do
      before(:each) do
        @previous_users_count = User.count
        @previous_referrals_users_count = ReferralsUser.count
      end

      it 'should not create a ReferralsUser if a student is signing up' 


      it 'should not create a ReferralsUser if there is no referral code' 


      it 'should not create a ReferralsUser if the referral code does not exist' 


      it 'should create a ReferralsUser' 

    end
  end
end

