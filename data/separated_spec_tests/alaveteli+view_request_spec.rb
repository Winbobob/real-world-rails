# -*- encoding : utf-8 -*-
require 'spec_helper'
require 'integration/alaveteli_dsl'
require 'support/shared_examples_for_viewing_requests'

describe "viewing requests in alaveteli_pro" do
  let(:pro_user) { FactoryBot.create(:pro_user) }
  let(:info_request) { FactoryBot.create(:info_request, user: pro_user) }
  let!(:pro_user_session) { login(pro_user) }

  context 'a pro user viewing one of their own requests' do

    it 'allows the user to view the request' 


    include_examples 'allows annotations'

    context 'the request is not embargoed' do

      it 'shows the privacy sidebar' 


      it 'does not show an embargo end date' 


      it 'does not prompt the user to publish their request' 


      it 'shows the option to add an embargo' 


      context 'the user does not have a pro account' do

        before do
          pro_user.remove_role(:pro)
        end

        it 'does not show the privacy sidebar' 


        it 'does not show the option to add an embargo' 


      end

    end

    context 'the request is embargoed' do

      let!(:embargo) do
        FactoryBot.create(:embargo, info_request: info_request)
      end

      it 'shows the privacy sidebar' 


      it 'does not show the option to add an embargo' 


      it 'does not allow the user to link to individual messages' 


      include_examples 'allows the embargo to be lifted'

      context 'the user does not have pro status' do

        before do
          pro_user.remove_role(:pro)
        end

        include_examples 'prevents setting an embargo'

      end

      include_examples 'allows followups'

      context 'the embargo is expiring soon' do

        before do
          embargo.update_attribute(:publish_at, embargo.publish_at - 88.days)
          info_request.reload
        end

        it 'allows the user to extend an embargo' 


        context 'the user does not have pro status' do

          before do
            pro_user.remove_role(:pro)
          end

          it 'does not show the option to extend the embargo' 


        end

      end

      context 'the embargo is not expiring soon' do

        it 'does not show the user the extend embargo section' 


        it 'displays a message to say when the embargo can be extended' 


        context 'the user does not have pro status' do

          before do
            pro_user.remove_role(:pro)
          end

          it 'does not display a message to say when the embargo can be extended' 


        end

      end

      context 'the request has received a response' do
        it_behaves_like 'a request with response'
      end

    end

  end

end

