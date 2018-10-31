# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe RequestGameController do

  describe "GET play" do

    it "shows the game homepage" 


    it 'assigns three old unclassified requests' 


    it 'assigns the number of unclassified requests' 


    context 'there are no requests' do

      before do
        InfoRequest.destroy_all
      end

      it 'shows the game homepage' 


    end

    context 'there are no old unclassified requests' do

      before do
        InfoRequest.destroy_all
        FactoryBot.create(:info_request)
      end

      render_views

      let(:test_url) { help_credits_path(:anchor => "helpus") }
      let(:site_name) { AlaveteliConfiguration.site_name }

      it 'shows the game homepage' 


      it 'assigns the game_over template to the flash message' 


      it 'displays the flash message' 


    end

  end

end

