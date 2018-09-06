require 'rails_helper'

describe DashboardsController, type: :controller do
  describe 'GET resend_confirmation_email' do
    let(:confirmation_message) do
      'Confirmation email sent. Please check your inbox.'
    end

    before do
      user = instance_double('User', send_confirmation_email: true, email_frequency: 'daily')
      allow(controller).to receive(:current_user).and_return(user)
    end

    it 'Redirect when referer is set' 


    it 'Redirect to dashboard when no referer is set' 

  end
end

