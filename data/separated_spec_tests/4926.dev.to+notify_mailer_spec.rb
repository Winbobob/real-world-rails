require "rails_helper"

RSpec.describe NotifyMailer, type: :mailer do
  describe "notify" do
    let(:user)      { create(:user) }
    let(:user2)     { create(:user) }
    let(:article)   { create(:article, user_id: user.id) }
    let(:comment)   { create(:comment, user_id: user.id, commentable_id: article.id) }

    describe "#new_reply_email" do
      it "renders proper subject" 


      it "renders proper receiver" 

    end

    describe "#new_follower_email" do
      it "renders proper subject" 


      it "renders proper receiver" 

    end

    describe "#new_mention_email" do
      it "renders proper subject" 


      it "renders proper receiver" 

    end

    describe "#new_badge_email" do
      let(:badge) { create(:badge) }

      def create_badge_achievement(user, badge, rewarder)
        BadgeAchievement.create(
          user_id: user.id,
          badge_id: badge.id,
          rewarder_id: rewarder.id,
          rewarding_context_message_markdown: "Hello [Yoho](/hey)",
        )
      end

      it "renders proper subject" 


      it "renders proper receiver" 

    end

    describe "#new_feedback_message_resolution_email" do
      def params(user_email, feedback_message_id)
        {
          email_to: user_email,
          email_subject: "DEV Report Status Update",
          email_body: "You've violated our code of conduct",
          email_type: "Reporter",
          feedback_message_id: feedback_message_id
        }
      end

      it "renders proper subject" 


      it "renders proper receiver" 

    end

    describe "#account_deleted_email" do
      let(:user) { create(:user) }

      it "renders proper subject" 


      it "renders proper receiver" 

    end

    describe "#mentee_email" do
      let(:mentee) { create(:user) }
      let(:mentor) { create(:user) }

      it "renders proper subject" 

      it "renders proper from" 

    end

    describe "#mentor_email" do
      let(:mentee) { create(:user) }
      let(:mentor) { create(:user) }

      it "renders proper subject" 

      it "renders proper subject" 

    end
  end
end

