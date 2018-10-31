require 'rails_helper'

describe FeedbunchAuth::InvitationsController, type: :controller do

  before :each do
    @user = FactoryBot.create :user
    @friend_email = 'friends.will.be.friends@righttotheend.com'
    login_user_for_unit @user
  end

  context 'POST create' do

    context 'validations' do

      it 'returns 409 if user already exists and has not been invited' 


      it 'returns 400 if user has no invitations left' 


      it 'returns success regardless of invitations sent if no invitations limit is set' 


      it 'returns success regardless of invitations limit if user is an admin' 


    end

    context 'successful invitation' do

      it 'returns success' 


      it 'invites user with the passed email' 


      it 'initially assigns the inviter locale and timezone to the invited' 

    end

    context 'already invited user' do

      before :each do
        @date_now = Time.zone.parse '2000-01-01'
        @invitation_token = 'abc'
        @unencrypted_invitation_token = 'def'
        @invited_user = FactoryBot.create :user, email: @friend_email,
                                          confirmed_at: nil, invitation_token: @invitation_token,
                                          unencrypted_invitation_token: @unencrypted_invitation_token,
                                          invitation_created_at: @date_now, invitation_sent_at: @date_now
        # Delete from the mail queue any email notifications sent when creating @invited_user
        ActionMailer::Base.deliveries.clear
      end

      it 'returns 202 and resends invitation if user is already invited and unconfirmed' 


      it 'does not resend invitation if inviter has no invitations left' 


    it 'returns success regardless of invitations sent if no invitations limit is set' 
      it 'resends invitation regardless of invitations limit if user is an admin' 


    end

  end
end

