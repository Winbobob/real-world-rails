require 'rails_helper'

describe Notification do

  subject(:user) { FactoryBot.create(:user, email_frequency: 'daily') }
  subject(:notification)  { Notification.new(user) }

  describe '#send_email' do

    it 'does not email an unconfirmed user' 


    context 'sends notifications' do
      let(:mailer) { double(:reminder_mailer, deliver_now: nil, weekly: nil) }

      before do
        user.confirm!
      end

      context '#daily' do
        it 'sends an email' 


        it 'once per day' 

      end

      context '#weekly' do
        before do
          user.update_attribute(:email_frequency, 'weekly')
        end

        it 'sends an email' 


        it 'once per week' 

      end
    end
  end
end

