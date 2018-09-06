require 'spec_helper'

describe APIv2::Deposits do

  let(:member) { create(:member) }
  let(:other_member) { create(:member) }
  let(:token)  { create(:api_token, member: member) }

  describe "GET /api/v2/deposits" do

    before do
      create(:deposit, member: member, currency: 'btc')
      create(:deposit, member: member, currency: 'cny')
      create(:deposit, member: member, currency: 'cny', txid: 1, amount: 520)
      create(:deposit, member: member, currency: 'btc', created_at: 2.day.ago,  txid: 'test', amount: 111)
      create(:deposit, member: other_member, currency: 'cny', txid: 10)
    end

    it "should require deposits authentication" 


    it "login deposits" 


    it "deposits num" 


    it "should return limited deposits" 


    it "should filter deposits by state" 


    it "deposits currency cny" 


    it "should return 404 if txid not exist" 


    it "should return 404 if txid not belongs_to you " 


    it "should ok txid if exist" 


    it "should return deposit no time limit " 

  end
end

