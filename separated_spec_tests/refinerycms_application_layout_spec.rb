require 'spec_helper'

module Refinery
  describe 'layout', :type => :feature do
    refinery_login

    let(:home_page) do
      FactoryBot.create :page, :title => 'Home', :link_url => '/'
    end

    describe 'body' do
      it "id is the page's canonical id" 

    end
  end
end

