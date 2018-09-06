describe CommentMailer, :email do
  include MailerSpecHelper
  include EnvVarSpecHelper

  let(:user) { create(:user) }

  describe "#comment_added_notification" do
    it_behaves_like "a proposal email" do
      let(:proposal) { create(:proposal) }
      let(:comment) { create(:comment, proposal: proposal) }
      let(:mail) { CommentMailer.comment_added_notification(comment, user) }
    end

    it "sends to the receiver email" 


    it "sets the sender name as the commenter full name" 


    it "sets the sender full name if passed just an address" 


    it "includes the commenter full name in the email body" 

  end
end

