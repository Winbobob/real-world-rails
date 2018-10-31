require 'rails_helper'

describe CleanupInvitationsWorker do

  before :each do
    @user = FactoryBot.create :user

    # During the tests, Time.zone.now will always return "2001-01-01 10:00:00"
    @time_now = Time.zone.parse('2000-01-01 10:00:00')
    allow_any_instance_of(ActiveSupport::TimeZone).to receive(:now).and_return @time_now

    @friend_email_1 = 'some_friend_1@email.com'
    @friend_email_2 = 'some_friend_2@email.com'
    @friend_name_1 = 'some friend_1'
    @friend_name_2 = 'some friend_2'
  end

  context 'discard old unaccepted invitations' do

    before :each do
      discard_unaccepted_invitations_after = Feedbunch::Application.config.discard_unaccepted_invitations_after
      # Unaccepted invitations sent before this time are considered "old" and will be destroyed.
      @time_invitations_old = @time_now - discard_unaccepted_invitations_after
    end

    it 'destroys old unaccepted invitations' 


    it 'does not destroy newer unaccepted invitations' 


    it 'does not destroy old accepted invitations' 


    it 'does not destroy newer accepted invitations' 


    it 'does not destroy users who signed up instead of being invited' 


    it 'does not destroy users who signed up but did not confirm their email address' 

  end

  context 'set daily invitations limit' do

    before :each do
      @daily_invitations_limit = Feedbunch::Application.config.daily_invitations_limit
    end

    it 'sets invitation limit for users that do not have it' 


    it 'sets invitation limit for users that have the wrong limit' 

  end

  context 'reset daily invitations count' do

    it 'resets the invitation count of a user if more than one day has passed since last reset' 


    it 'resets the invitation count of a user if exactly one day has passed since last reset' 


    it 'resets the invitation count of a user that has never had his counter reset' 


    it 'does not reset the invitation count of a user if less than one day has passed since last reset' 


    it 'does not reset the invitation count of a user whose current invitations count is zero' 


  end

  context 'invitation reminder emails' do

    context 'first reminder email' do

      before :each do
        first_invitation_reminder_after = Feedbunch::Application.config.first_confirmation_reminder_after
        # Unaccepted invitation from before this time will be sent a reminder email
        @time_first_invitation_reminder = @time_now - first_invitation_reminder_after

        invitation_params_1 = {email: @friend_email_1,
                              name: @friend_name_1,
                              locale: @user.locale,
                              timezone: @user.timezone}
        @invited_user = User.invite! invitation_params_1, @user
      end

      it 'sends reminder to users with old unaccepted invitations' 


      it 'does not send reminder to users with newer unaccepted invitations' 


      it 'does not send this reminder a second time' 


      it 'does not send reminder to users who accepted the invitation' 

    end

    context 'second reminder email' do

      before :each do
        second_invitation_reminder_after = Feedbunch::Application.config.second_confirmation_reminder_after
        # Unaccepted invitations from before this time will be sent a reminder email
        @time_second_confirmation_reminder = @time_now - second_invitation_reminder_after

        invitation_params_1 = {email: @friend_email_1,
                               name: @friend_name_1,
                               locale: @user.locale,
                               timezone: @user.timezone}
        @invited_user = User.invite! invitation_params_1, @user
        # User has already been sent the first reminder, we're testing the second reminder here
        @invited_user.update first_confirmation_reminder_sent: true
      end

      it 'sends reminder to users with old unaccepted invitations' 


      it 'does not send reminder to users with newer invitations' 


      it 'does not send this reminder a second time' 


      it 'does not send reminder to users who accepted the invitation' 

    end
  end

end

