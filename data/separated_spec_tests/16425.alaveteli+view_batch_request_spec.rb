# -*- encoding : utf-8 -*-
require 'spec_helper'
require 'integration/alaveteli_dsl'
require 'support/shared_examples_for_viewing_requests'

describe 'viewing requests that are part of a batch in alaveteli_pro' do
  let(:pro_user) { FactoryBot.create(:pro_user) }
  let!(:pro_user_session) { login(pro_user) }

  let(:batch) do
    FactoryBot.create(:info_request_batch, :sent, user: pro_user)
  end

  let(:info_request) { batch.info_requests.first }
  let(:embargo) { info_request.embargo }

  context 'a pro user viewing one of their own requests' do

    it 'allows the user to view the request' 


    include_examples 'allows annotations'

    context 'the request is not embargoed' do

      it 'does not show an embargo end date' 


      it 'does not prompt the user to publish their request' 


      context 'the user does not have a pro account' do

        before do
          pro_user.remove_role(:pro)
        end

        it 'does not show the privacy sidebar' 


        include_examples 'prevents setting an embargo'

      end

    end

    context 'the request is embargoed' do

      let(:batch) do
        FactoryBot.create(:info_request_batch, :sent, :embargoed,
                          user: pro_user)
      end

      it 'shows the privacy sidebar' 


      it 'shows an embargo end date' 


      it 'does not show the option to add an embargo' 


      it 'does not allow the user to link to individual messages' 


      include_examples 'allows the embargo to be lifted'
      include_examples 'allows followups'

      context 'the embargo is expiring soon' do

        before do
          embargo.update_attribute(:publish_at, embargo.publish_at - 88.days)
          info_request.reload
        end

        it 'shows the option to extend the embargo' 


      end

      context 'the embargo is not expiring soon' do

        it 'does not show the option to extend the embargo' 


        it 'displays a message to say when the embargo can be extended' 


      end

      context 'the user does not have pro status' do

        before do
          pro_user.remove_role(:pro)
        end

        it 'does not show the option to extend the embargo' 


      end

      context 'the request has received a response' do
        it_behaves_like 'a request with response'
      end

    end

  end

end

