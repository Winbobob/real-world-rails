# frozen_string_literal: true

describe NotificationService do
  describe "notification interrelation" do
    context "with mention in comment" do
      let(:status_message) {
        FactoryGirl.create(:status_message, public: true, author: alice.person).tap {|status_message|
          eve.comment!(status_message, "whatever")
        }
      }

      let(:comment) {
        FactoryGirl.create(
          :comment,
          author: bob.person,
          text:   text_mentioning(alice, eve),
          post:   status_message
        )
      }

      it "sends only mention notification" 


      context "with \"mentioned in comment\" email turned off" do
        before do
          alice.user_preferences.create(email_type: "mentioned_in_comment")
          eve.user_preferences.create(email_type: "mentioned_in_comment")
        end

        it "calls appropriate mail worker instead" 

      end
    end
  end
end

