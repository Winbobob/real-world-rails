require 'rails_helper'

describe TicketsController do
  describe 'as a user not signed in' do
    it 'should redirect me to the sign in page' 

  end

  describe 'as a signed in user' do
    before(:each) { sign_in_onapp_user }

    describe 'going to the index page' do
      it 'should be on the tickets index page' 


      it 'should assign @tickets to display for the current user' 

    end

    describe 'going to the ticket create page' do
      it 'should be on the new page' 


      it 'should create a new ticket model' 

    end

    describe 'going to the ticket show page' do
      let(:ticket) { FactoryGirl.create(:ticket, user: @current_user) }

      it 'should render the show template' 


      it 'should show information about the ticket' 

    end

    describe 'creating a ticket' do
      before(:each) do
        CreateTicket.jobs.clear
      end

      let (:ticket) { FactoryGirl.create(:ticket) }

      it 'should go to show page if ticket is fine' 


      it "should render failure if ticket isn't valid" 

    end

    describe 'closing a ticket' do
      before(:each) do
        CloseTicket.jobs.clear
      end

      let(:ticket) { FactoryGirl.create(:ticket, user: @current_user) }

      it 'should close a ticket' 


      it "should not close a ticket again if it's already closed or solved" 

    end

    describe 'ticket response pushing' do
      before(:each) do
        ProcessTicketResponse.jobs.clear
      end

      it 'should request HTTP basic credentials for the page' 


      it 'should return a 204 success if the correct HTTP auth is provided' 


      it 'should return a 401 if the wrong auth is provided' 

    end

    describe 'ticket create pushing' do
      before(:each) do
        CreateTicketFromRemote.jobs.clear
      end

      it 'should request HTTP basic credentials for the page' 


      it 'should return a 204 success if the correct HTTP auth is provided' 


      it 'should return a 401 if the wrong auth is provided' 

    end

    describe 'ticket reopening' do
      before(:each) do
        ReopenTicket.jobs.clear
      end

      let (:ticket) { FactoryGirl.create(:ticket, user: @current_user) }

      it 'should allow reopening only if ticket is solved' 


      it 'should not allow reopening if ticket is not solved' 

    end
  end
end

