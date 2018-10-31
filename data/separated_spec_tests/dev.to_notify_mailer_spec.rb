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

    describe "#new_report_email" do
      it "renders proper subject" 


      it "renders proper receiver" 

    end
  end
end

