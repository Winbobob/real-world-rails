# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe AlaveteliPro::DashboardController do
  describe "#index" do
    let(:user) { FactoryBot.create(:pro_user) }

    before do
      session[:user_id] = user.id
    end

    it "exists" 


    it "sets @user" 


    it 'assigns @page to 1 by default' 


    it 'does not set new_pro_user in flash' 


    context 'if a page param is passed' do

      it 'assigns @page a numerical page param' 


      it 'does not assign a non-numerical page param' 

    end

    it 'assigns @per_page' 


    it 'assigns @activity_list' 


  end
end

