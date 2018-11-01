require 'spec_helper'

describe APIv2::Members do

  let(:member) do
    create(:verified_member).tap {|m|
      m.get_account(:btc).update_attributes(balance: 12.13,   locked: 3.14)
      m.get_account(:cny).update_attributes(balance: 2014.47, locked: 0)
    }
  end
  let(:token)  { create(:api_token, member: member) }

  describe "GET /members/me" do
    before { Currency.stubs(:codes).returns(%w(cny btc)) }

    it "should require auth params" 


    it "should require authentication" 


    it "should return current user profile with accounts info" 

  end

end

