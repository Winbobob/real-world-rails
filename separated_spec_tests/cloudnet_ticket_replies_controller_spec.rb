require 'rails_helper'

describe TicketRepliesController do
  let (:reply) { FactoryGirl.create(:ticket_reply) }

  describe 'as a user not signed in' do
    it 'should redirect me to the sign in page' 

  end

  describe 'as a signed in user' do
    before(:each) { sign_in_onapp_user }

    describe 'creating a ticket reply' do
      before(:each) do
        AddTicketReply.jobs.clear
      end

      it 'should go to show page if ticket reply is fine' 


      it "should render failure if ticket isn't valid" 


      it 'should render failure if the ticket is already completed' 

    end
  end

end

