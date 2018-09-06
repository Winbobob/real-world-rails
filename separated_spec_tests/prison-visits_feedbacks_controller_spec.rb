require 'rails_helper'

RSpec.describe FeedbacksController, type: :controller do
  include ActiveJobHelper

  before do
    ActionMailer::Base.deliveries.clear
    allow(ZendeskTicketsJob).to receive(:perform_later)
  end

  context 'new' do
    it 'responds with success' 


    it 'displays feedback form' 

  end

  context 'create' do
    context 'with a successful feedback submission' do
      let(:feedback_params) {
        { email: 'test@maildrop.dsd.io', text: 'feedback', referrer: 'ref' }
      }

      it 'redirects to show page' 


      it 'sends to ZenDesk' 


      it 'sends an email' 

    end

    context 'with no email address entered' do
      let(:feedback_params) {
        { email: '', text: 'feedback', referrer: 'ref' }
      }

      it 'redirects to feedback page' 


      it 'does not send to ZenDesk' 


      it 'sends an email' 

    end

    context 'with no text entered' do
      let(:feedback_params) {
        { email: 'test@maildrop.dsd.io', text: '', referrer: 'ref' }
      }

      it 'responds with success' 


      it 'does not send to ZenDesk' 


      it 'does not send an email' 


      it 're-renders the feedback template' 

    end

    context 'when an active booking session is present' do
      let(:feedback_params) {
        {
          email: 'test@maildrop.dsd.io',
          text: 'feedback',
          referrer: 'ref'
        }
      }

      before do
        session[:visit] =
          Visit.new(prisoner: Prisoner.new(prison_name: 'Rochester'))
      end

      it 'extracts the prison name from the session' 

    end
  end
end

