require "rails_helper"

describe InviteMailer do

  describe "send_invite" do

    context "invite to site" do

      context "default invite message" do
        let(:invite) { Fabricate(:invite) }
        let(:invite_mail) { InviteMailer.send_invite(invite) }

        it 'renders the invitee email' 


        it 'renders the subject' 


        it 'renders site domain name in subject' 


        it 'renders the body' 


        it 'renders the inviter email' 


        it 'renders invite link' 

      end

      context "custom invite message" do
        let(:invite) { Fabricate(:invite, custom_message: "Hey, you should join this forum!") }

        context "custom message includes invite link" do
          let(:custom_invite_mail) { InviteMailer.send_invite(invite) }

          it 'renders the invitee email' 


          it 'renders the subject' 


          it 'renders site domain name in subject' 


          it 'renders the body' 


          it 'renders custom_message' 


          it 'renders the inviter email' 


          it 'renders invite link' 


        end
      end
    end

    context "invite to topic" do
      let(:trust_level_2) { build(:user, trust_level: 2) }
      let(:topic) { Fabricate(:topic, excerpt: "Topic invite support is now available in Discourse!", user: trust_level_2) }

      context "default invite message" do
        let(:invite) do
          topic.invite(topic.user, 'name@example.com')
          Invite.find_by(invited_by_id: topic.user.id)
        end

        let(:invite_mail) { InviteMailer.send_invite(invite) }

        it 'renders the invitee email' 


        it 'renders the subject' 


        it 'renders topic title in subject' 


        it 'renders site domain name in subject' 


        it 'renders the body' 


        it 'renders the inviter email' 


        it 'renders invite link' 


        it 'renders topic title' 


        it "respects the private_email setting" 

      end

      context "custom invite message" do
        let(:invite) do
          topic.invite(
            topic.user,
            'name@example.com',
            nil,
            "Hey, I thought you might enjoy this topic!"
          )

          Invite.find_by(invited_by_id: topic.user.id)
        end
        let(:custom_invite_mail) { InviteMailer.send_invite(invite) }

        it 'renders custom_message' 


        it 'renders invite link' 

      end
    end
  end

end

