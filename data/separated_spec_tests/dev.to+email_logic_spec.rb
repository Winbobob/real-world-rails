require "rails_helper"

RSpec.describe EmailLogic do
  let(:user) { create(:user) }

  # TODO: improve this test suite, and improve it's speed

  describe "#analyze" do
    context "when user is brand new with no-follow" do
      it "returns 0.5 for open_percentage" 


      it "provides top 3 articles" 


      it "marks as not ready if there isn't atleast 3 articles" 

      it "marks as not ready if there isn't at least 3 email-digest-eligible articles" 

    end

    context "when a user's open_percentage is low " do
      before do
        author = create(:user)
        user.follow(author)
        create_list(:article, 3, user_id: author.id, positive_reactions_count: 20)
        10.times do
          Ahoy::Message.create(mailer: "DigestMailer#digest_email",
                               user_id: user.id, sent_at: Time.current.utc)
        end
      end

      it "will not send email when user shouldn't receive any" 

    end

    context "when a user's open_percentage is high" do
      before do
        10.times do
          Ahoy::Message.create(mailer: "DigestMailer#digest_email", user_id: user.id,
                               sent_at: Time.current.utc, opened_at: Time.current.utc)
          author = create(:user)
          user.follow(author)
          create_list(:article, 3, user_id: author.id, positive_reactions_count: 40)
        end
      end

      it "evaluates that user is ready to receive an email" 

    end
  end

  describe "#should_receive_email?" do
    it "refelcts @ready_to_receive_email" 

  end
end

