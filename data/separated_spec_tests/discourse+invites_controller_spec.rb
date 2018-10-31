require 'rails_helper'

describe InvitesController do
  context 'show' do
    let(:invite) { Fabricate(:invite) }
    let(:user) { Fabricate(:coding_horror) }

    it "returns error if invite not found" 


    it "renders the accept invite page if invite exists" 


    it "returns error if invite has already been redeemed" 

  end

  context '#destroy' do
    it 'requires you to be logged in' 


    context 'while logged in' do
      let!(:user) { sign_in(Fabricate(:user))      }
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

  context '#create_invite_link' do
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

  context '#perform_accept_invitation' do
    context 'with an invalid invite id' do
      it "redirects to the root and doesn't change the session" 

    end

    context 'with a deleted invite' do
      let(:topic) { Fabricate(:topic) }
      let(:invite) { topic.invite_by_email(topic.user, "iceking@adventuretime.ooo") }
      before do
        invite.destroy
      end

      it "redirects to the root" 

    end

    context 'with a valid invite id' do
      let(:topic) { Fabricate(:topic) }
      let(:invite) { topic.invite_by_email(topic.user, "iceking@adventuretime.ooo") }

      it 'redeems the invite' 


      context 'when redeem returns a user' do
        let(:user) { Fabricate(:coding_horror) }

        context 'success' do
          it 'logs in the user' 


          it 'redirects to the first topic the user was invited to' 

        end

        context 'failure' do
          it "doesn't log in the user if there's a validation error" 

        end

        context '.post_process_invite' do
          before do
            SiteSetting.queue_jobs = true
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
      let(:topic) { Fabricate(:topic) }
      let(:invite) { topic.invite_by_email(topic.user, "iceking@adventuretime.ooo") }
      let!(:user) { sign_in(Fabricate(:user)) }

      it "doesn't redeem the invite" 

    end
  end

  context '#resend_invite' do
    it 'requires you to be logged in' 


    context 'while logged in' do
      let!(:user) { sign_in(Fabricate(:user)) }
      let!(:invite) { Fabricate(:invite, invited_by: user) }
      let(:another_invite) { Fabricate(:invite, email: 'last_name@example.com') }

      it 'raises an error when the email is missing' 


      it "raises an error when the email cannot be found" 


      it 'raises an error when the invite is not yours' 


      it "resends the invite" 

    end
  end

  context '#upload_csv' do
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

