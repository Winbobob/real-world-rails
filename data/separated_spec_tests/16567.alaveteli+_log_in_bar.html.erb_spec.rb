# -*- encoding : utf-8 -*-
require 'spec_helper'

describe 'general/_log_in_bar.html.erb' do
  let(:user) { FactoryBot.create(:user) }
  let(:pro_user) { FactoryBot.create(:pro_user) }

  def render_view
    render :partial => 'general/log_in_bar'
  end

  describe 'user menu links', feature: :alaveteli_pro do
    before do
      # The view uses request.fullpath to set return links
      allow(view.request).to receive(:fullpath).and_return('/test/fullpath')
    end

    context 'when a pro user is logged in' do
      before do
        assign :user, pro_user
        allow(controller).to receive(:current_user).and_return(pro_user)
      end

      context 'and pro features are not enabled' do

        it 'does not show "pro" next to the user name' 


        it 'shows a "My requests" link' 


      end

      it 'shows "pro" next to the user name' 


      it 'does not show a "My requests" link' 


      context 'and the page is in the pro area' do
        before do
          assign :in_pro_area, true
        end

        it 'does not set a return path' 

      end

      context 'and the page is not in the pro area' do
        before do
          assign :in_pro_area, false
        end

        it 'sets the return path to the current page' 

      end
    end

    context 'when a normal user is logged in' do
      before do
        assign :user, user
        allow(controller).to receive(:current_user).and_return(user)
      end

      it 'does not show "pro" next to the user name' 


      it 'shows a "My requests" link' 


      it 'sets the return path to the current page' 

    end
  end
end

