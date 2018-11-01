require 'spec_helper'

describe Private::FundSourcesController do
  let(:member) { create(:member) }
  before { session[:member_id] = member.id }

  describe 'POST create' do
    it "should not create fund_source with blank extra" 


    it "should not create fund_source with blank uid" 


    it "should create fund_source successful" 

  end

  describe 'UPDATE' do
    let!(:fund_source) { create(:fund_source, member: member, currency: :btc) }
    let(:account) { member.accounts.with_currency(:btc).first }

    it 'update default_withdraw_fund_source_id to account' 

  end

  describe 'DELETE' do
    let!(:fund_source) { create(:fund_source, member: member) }

    it "should delete fund_source" 

  end

end

describe 'routes for FundSources', type: :routing do
  it { expect(post: '/fund_sources').to be_routable }
  it { expect(put: '/fund_sources/1').to be_routable }
  it { expect(delete: '/fund_sources/1').to be_routable }
end

