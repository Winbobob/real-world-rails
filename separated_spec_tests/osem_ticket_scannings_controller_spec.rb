# frozen_string_literal: true

require 'spec_helper'

describe Admin::TicketScanningsController do
  let(:admin) { create(:admin) }
  let(:conference) { create(:conference) }
  let(:user) { create(:user) }
  let!(:registration) { create(:registration, conference: conference, user: user) }
  let(:registration_ticket) { create(:registration_ticket, conference: conference) }
  let(:paid_ticket_purchase) { create(:ticket_purchase, conference: conference, user: user, ticket: registration_ticket, quantity: 1) }
  let(:physical_ticket) { create(:physical_ticket, ticket_purchase: paid_ticket_purchase) }

  context 'logged in as user with no role' do
    before :each do
      sign_in user
    end
    describe 'POST #create' do
      it 'does not create new ticket scanning' 


      it 'redirects to root' 

    end
  end

  context 'logged in as admin' do
    before :each do
      sign_in admin
    end
    describe 'POST #create' do
      context 'with valid physical_ticket' do
        it 'creates new ticket scanning' 


        it 'redirects to index' 

      end

      context 'with Invalid physical_ticket' do
        it 'raises exception' 

      end
    end
  end
end

