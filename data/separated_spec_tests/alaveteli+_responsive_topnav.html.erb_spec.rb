# -*- encoding : utf-8 -*-
require 'spec_helper'

describe 'general/_responsive_topnav.html.erb' do
  let(:user) { FactoryBot.create(:user) }
  let(:pro_user) { FactoryBot.create(:pro_user) }

  def render_view
    render :partial => 'general/responsive_topnav'
  end

  describe 'showing the Dashboard link', feature: :alaveteli_pro do

    context 'when a pro user is logged in' do
      before do
        assign :user, pro_user
        allow(controller).to receive(:current_user).and_return(pro_user)
      end

      it 'shows a Dashboard link' 


      context 'and pro features are not enabled' do

        it 'shows "pro" next to the user name' 


        it 'does not show a Dashboard link' 


      end

    end

    context 'when a normal user is logged in' do
      before do
        assign :user, user
        allow(controller).to receive(:current_user).and_return(user)
      end

      it 'does not show a Dashboard link' 


    end

  end

end

