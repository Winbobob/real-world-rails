require 'rails_helper'

describe InvitesController do

  context '.destroy' do

    it 'requires you to be logged in' 


    context 'while logged in' do
      let!(:user) { log_in }
      let!(:invite) { Fabricate(:invite, invited_by: user) }
      let(:another_invite) { Fabricate(:invite, email: 'anotheremail@address.com') }

      it 'raises an error when the email is missing' 


      it "raises an error when the email cannot be found" 


      it 'raises an error when the invite is not yours' 


      it "destroys the invite" 


    end

  end

  context '#create' do
    it 'requires you to be logged in' 


    context 'while logged in' do
      let(:email) { 'jake@adventuretime.ooo' }

      it "fails if you can't invite to the forum" 


      it "fails for normal user if invite email already exists" 


      it "allows admins to invite to groups" 


      it 'allows group owners to invite to groups' 


      it "allows admin to send multiple invites to same email" 


      it "responds with error message in case of validation failure" 

    end

  end

  context '.create_invite_link' do
    it 'requires you to be logged in' 


    context 'while logged in' do
      let(:email) { 'jake@adventuretime.ooo' }

      it "fails if you can't invite to the forum" 


      it "fails for normal user if invite email already exists" 


      it "verifies that inviter is authorized to invite new user to a group-private topic" 


      it "allows admins to invite to groups" 


      it "allows multiple group invite" 

    end
  end

  context '.perform_accept_invitation' do

    context 'with an invalid invite id' do
      before do
        put :perform_accept_invitation, params: { id: "doesn't exist" }, format: :json
      end

      it "redirects to the root" 


      it "should not change the session" 

    end

    context 'with a deleted invite' do
      let(:topic) { Fabricate(:topic) }
      let(:invite) { topic.invite_by_email(topic.user, "iceking@adventuretime.ooo") }
      let(:deleted_invite) { invite.destroy; invite }
      before do
        put :perform_accept_invitation, params: { id: deleted_invite.invite_key }, format: :json
      end

      it "redirects to the root" 


      it "should not change the session" 

    end

    context 'with a valid invite id' do
      let(:topic) { Fabricate(:topic) }
      let(:invite) { topic.invite_by_email(topic.user, "iceking@adventuretime.ooo") }

      it 'redeems the invite' 


      context 'when redeem returns a user' do
        let(:user) { Fabricate(:coding_horror) }

        context 'success' do
          subject { put :perform_accept_invitation, params: { id: invite.invite_key }, format: :json }

          before do
            Invite.any_instance.expects(:redeem).returns(user)
          end

          it 'logs in the user' 


          it 'redirects to the first topic the user was invited to' 

        end

        context 'failure' do
          subject { put :perform_accept_invitation, params: { id: invite.invite_key }, format: :json }

          it "doesn't log in the user if there's a validation error" 

        end

        context '.post_process_invite' do
          before do
            Invite.any_instance.stubs(:redeem).returns(user)
            Jobs.expects(:enqueue).with(:invite_email, has_key(:invite_id))
            user.password_hash = nil
          end

          it 'sends a welcome message if set' 


          it "sends password reset email if password is not set" 


          it "does not send password reset email if sso is enabled" 


          it "does not send password reset email if local login is disabled" 


          it 'sends an activation email if password is set' 

        end
      end
    end

    context 'new registrations are disabled' do
      let(:topic) { Fabricate(:topic) }
      let(:invite) { topic.invite_by_email(topic.user, "iceking@adventuretime.ooo") }
      before { SiteSetting.allow_new_registrations = false }

      it "doesn't redeem the invite" 

    end

    context 'user is already logged in' do
      let!(:user) { log_in }
      let(:topic) { Fabricate(:topic) }
      let(:invite) { topic.invite_by_email(topic.user, "iceking@adventuretime.ooo") }

      it "doesn't redeem the invite" 

    end
  end

  context '.resend_invite' do

    it 'requires you to be logged in' 


    context 'while logged in' do
      let!(:user) { log_in }
      let!(:invite) { Fabricate(:invite, invited_by: user) }
      let(:another_invite) { Fabricate(:invite, email: 'last_name@example.com') }

      it 'raises an error when the email is missing' 


      it "raises an error when the email cannot be found" 


      it 'raises an error when the invite is not yours' 


      it "resends the invite" 


    end

  end

  context '.upload_csv' do
    it 'requires you to be logged in' 


    context 'while logged in' do
      let(:csv_file) { File.new("#{Rails.root}/spec/fixtures/csv/discourse.csv") }

      let(:file) do
        Rack::Test::UploadedFile.new(File.open(csv_file))
      end

      let(:filename) { 'discourse.csv' }

      it "fails if you can't bulk invite to the forum" 


      it "allows admin to bulk invite" 

    end

  end

end

