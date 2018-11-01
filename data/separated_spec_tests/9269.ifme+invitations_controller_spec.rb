# frozen_string_literal: true

RSpec.describe ::Users::InvitationsController, type: :controller do
  let(:user) { create(:user, name: 'Jane') }
  let(:invitee1) { 'invitedfriend@gmail.com' }
  let(:invitee2) { 'otherfriend@gmail.com' }
  let(:invalid_email) { 'invalidemail.com' }

  describe '#create' do
    before(:all) { Devise.mailer.deliveries.clear }
    before(:each) { @request.env['devise.mapping'] = Devise.mappings[:user] }

    context 'when a user is not signed in' do
      before { post :create }
      it_behaves_like :with_no_logged_in_user
    end

    context 'when a user is signed in' do
      include_context :logged_in_user

      context 'when valid params are given' do
        let(:invite_one_friend) { post :create, params: { user: { email: invitee1.to_s } } }
        after(:each) { Devise.mailer.deliveries.clear }

        it 'creates a new user if the user does not exist' 


        it 'sends an invitation email to the invitee' 


        it 'redirects to invitations#new' 


        context 'when the user has invited multiple friends' do
          let(:friends_array) { [invitee1, invitee2] }
          before(:each) do
            post :create, params: { user: { email: "#{invitee1}, #{invitee2}" } }
          end

          it 'creates a new user for each supplied email address' 


          it 'sends an invitation email to each valid address' 


          it 'creates a unique token for each email' 

        end
      end

      context 'when invalid params are given' do
        let(:invalid_invite) { post :create, params: { user: { email: invalid_email.to_s } } }

        it 're-renders the invitation form' 


        it 'does not create a new user for an invalid email' 

      end

      context 'when both valid and invalid params are given' do
        before(:each) do
          post :create, params: { user: { email: "#{invitee1}, #{invalid_email}" } }
        end
        after(:each) { Devise.mailer.deliveries.clear }

        it 'only creates a new User for the valid email' 


        it 'only sends an invitation email to the valid email address' 

      end
    end
  end
end

