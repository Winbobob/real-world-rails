require 'spec_helper'

describe EmailsOnPushWorker, :mailer do
  include RepoHelpers
  include EmailSpec::Matchers

  let(:project) { create(:project, :repository) }
  let(:user) { create(:user) }
  let(:data) { Gitlab::DataBuilder::Push.build_sample(project, user) }
  let(:recipients) { user.email }
  let(:perform) { subject.perform(project.id, recipients, data.stringify_keys) }
  let(:email) { ActionMailer::Base.deliveries.last }

  subject { described_class.new }

  describe "#perform" do
    context "when push is a new branch" do
      before do
        data_new_branch = data.stringify_keys.merge("before" => Gitlab::Git::BLANK_SHA)

        subject.perform(project.id, recipients, data_new_branch)
      end

      it "sends a mail with the correct subject" 


      it "sends the mail to the correct recipient" 

    end

    context "when push is a deleted branch" do
      before do
        data_deleted_branch = data.stringify_keys.merge("after" => Gitlab::Git::BLANK_SHA)

        subject.perform(project.id, recipients, data_deleted_branch)
      end

      it "sends a mail with the correct subject" 


      it "sends the mail to the correct recipient" 

    end

    context "when push is a force push to delete commits" do
      before do
        data_force_push = data.stringify_keys.merge(
          "after"  => data[:before],
          "before" => data[:after]
        )

        subject.perform(project.id, recipients, data_force_push)
      end

      it "sends a mail with the correct subject" 


      it "mentions force pushing in the body" 


      it "sends the mail to the correct recipient" 

    end

    context "when there are no errors in sending" do
      before do
        perform
      end

      it "sends a mail with the correct subject" 


      it "does not mention force pushing in the body" 


      it "sends the mail to the correct recipient" 

    end

    context "when there is an SMTP error" do
      before do
        allow(Notify).to receive(:repository_push_email).and_raise(Net::SMTPFatalError)
        allow(subject).to receive_message_chain(:logger, :info)
        perform
      end

      it "gracefully handles an input SMTP error" 

    end

    context "when there are multiple recipients" do
      let(:recipients) do
        1.upto(5).map { |i| user.email.sub('@', "+#{i}@") }.join("\n")
      end

      before do
        # This is a hack because we modify the mail object before sending, for efficency,
        # but the TestMailer adapter just appends the objects to an array. To clone a mail
        # object, create a new one!
        #   https://github.com/mikel/mail/issues/314#issuecomment-12750108
        allow_any_instance_of(Mail::TestMailer).to receive(:deliver!).and_wrap_original do |original, mail|
          original.call(Mail.new(mail.encoded))
        end
      end

      it "sends the mail to each of the recipients" 


      it "only generates the mail once" 

    end
  end
end

