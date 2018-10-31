require 'rails_helper'

describe AutoTopup do

  before :each do
    @user = FactoryGirl.create :user
    @account = @user.account
    @payments = double(Payments, auth_charge: { charge_id: 12_345 }, capture_charge: { charge_id: 12_345 })
    allow(Payments).to receive_messages(new: @payments)
  end

  it 'should topup Wallet' 


  it 'should not topup Wallet because account is not fraud safe' 


  it 'shoul not topup Wallet because there are no active servers' 


  it 'shoul not topup Wallet because there are no processable cards' 


  it 'should not topup Wallet because there are enough Wallet balance' 


  it 'should not topup Wallet because Auto top-up is not enabled' 


end

