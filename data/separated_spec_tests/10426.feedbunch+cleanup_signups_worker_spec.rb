require 'rails_helper'

describe CleanupSignupsWorker do

  before :each do
    # During the tests, Time.zone.now will always return "2001-01-01 10:00:00"
    @time_now = Time.zone.parse('2000-01-01 10:00:00')
    allow_any_instance_of(ActiveSupport::TimeZone).to receive(:now).and_return @time_now

    # @user is an unconfirmed user. The confirmation_sent_at date will be different for different tests.
    @user = FactoryBot.create :user, confirmed_at: nil
  end

  context 'discard old unconfirmed signups' do

    before :each do
      discard_unconfirmed_signups_after = Feedbunch::Application.config.discard_unconfirmed_signups_after
      # Unconfirmed signups from before this time are considered "old" and will be destroyed.
      @time_signups_old = @time_now - discard_unconfirmed_signups_after
    end

    it 'destroys old unconfirmed signups' 


    it 'does not destroy newer unconfirmed signups' 


    it 'does not destroy old confirmed signups' 


    it 'does not destroy newer confirmed signups' 

  end

  context 'confirmation reminder emails' do

    context 'first reminder email' do

      before :each do
        first_confirmation_reminder_after = Feedbunch::Application.config.first_confirmation_reminder_after
        # Unconfirmed signups from before this time will be sent a reminder email
        @time_first_confirmation_reminder = @time_now - first_confirmation_reminder_after
      end

      it 'sends reminder to old unconfirmed signups' 


      it 'does not send reminder to newer signups' 


      it 'does not send this reminder a second time' 


      it 'does not send reminder to confirmed users' 

    end

    context 'second reminder email' do

      before :each do
        second_confirmation_reminder_after = Feedbunch::Application.config.second_confirmation_reminder_after
        # Unconfirmed signups from before this time will be sent a reminder email
        @time_second_confirmation_reminder = @time_now - second_confirmation_reminder_after
        # User has already been sent the first reminder, we're testing the second reminder here
        @user.update first_confirmation_reminder_sent: true
      end

      it 'sends reminder to old unconfirmed signups' 


      it 'does not send reminder to newer signups' 


      it 'does not send this reminder a second time' 


      it 'does not send reminder to confirmed users' 


    end
  end
end

