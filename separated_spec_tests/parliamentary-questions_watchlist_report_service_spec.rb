require 'spec_helper'

describe 'WatchlistReportService' do

  let!(:watchlist_one) { create(:watchlist_member, name: 'member 1', email: 'm1@ao.gov',  deleted: false) }
  let!(:watchlist_two) { create(:watchlist_member, name: 'member 2', email: 'm2@ao.gov', deleted: false) }
  let!(:watchlist_deleted) { create(:watchlist_member, name: 'member 3', email: 'm3@ao.gov', deleted: true) }
  let(:testid) { "watchlist-" + DateTime.now.to_s }

  before(:each) do
    @report_service               = WatchlistReportService.new
    ActionMailer::Base.deliveries = []
  end

  it 'should have generated a valid token' 


  it 'should send an email with the right data' 


  it 'should add the people from the Watchlist to the CC' 

end

