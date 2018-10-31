require 'spec_helper'
require "#{Rails.root}/spec/support/features/session_helpers"

describe WatchlistDashboardController, type: :controller do

  describe 'GET index' do

    let(:entity)  { 'watchlist-20/05/2015 11:37' }
    let(:token)   { FactoryBot.create :token, entity: entity }

    it 'should mark the token as accepted if not already acknowledged' 

  end


end


def params
  {
    "entity"=>"watchlist-20/05/2015 11:37",
    "amp"=>nil,
    "token"=>"_pC_wpsCpudnsYPbo_6f",
    "controller"=>"watchlist_dashboard",
    "action"=>"index"
  }
end

