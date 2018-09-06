require "rails_helper"
require "email/receiver"

describe Email::Receiver do

  before do
    SiteSetting.email_in = true
    SiteSetting.reply_by_email_address = "reply+%{reply_key}@bar.com"
    SiteSetting.alternative_reply_by_email_addresses = "alt+%{reply_key}@bar.com"
  end

  def process(email_name)
    Email::Receiver.new(email(email_name)).process!
  end

  it "raises an EmptyEmailError when 'mail_string' is blank" 


  it "raises a ScreenedEmailError when email address is screened" 


  it "raises EmailNotAllowed when email address is not on whitelist" 


  it "raises EmailNotAllowed when email address is on blacklist" 


  it "raises an UserNotFoundError when staged users are disabled" 


  it "raises an AutoGeneratedEmailError when the mail is auto generated" 


  it "raises a NoBodyDetectedError when the body is blank" 


  it "raises a NoSenderDetectedError when the From header is missing" 


  it "raises an InactiveUserError when the sender is inactive" 


  it "raises a SilencedUserError when the sender has been silenced" 


  it "doesn't raise an InactiveUserError when the sender is staged" 


  it "raises a BadDestinationAddress when destinations aren't matching any of the incoming emails" 


  it "raises an OldDestinationError when notification is too old" 


  it "raises a BouncerEmailError when email is a bounced email" 


  it "logs a blank error" 


  context "bounces to VERP" do

    let(:bounce_key) { "14b08c855160d67f2e0c2f8ef36e251e" }
    let(:bounce_key_2) { "b542fb5a9bacda6d28cc061d18e4eb83" }
    let!(:user) { Fabricate(:user, email: "foo@bar.com") }
    let!(:email_log) { Fabricate(:email_log, user: user, bounce_key: bounce_key) }
    let!(:email_log_2) { Fabricate(:email_log, user: user, bounce_key: bounce_key_2) }

    it "deals with soft bounces" 


    it "deals with hard bounces" 


    it "automatically deactive users once they reach the 'bounce_score_threshold_deactivate' threshold" 


  end

  context "reply" do

    let(:reply_key) { "4f97315cc828096c9cb34c6f1a0d6fe8" }
    let(:category) { Fabricate(:category) }
    let(:user) { Fabricate(:user, email: "discourse@bar.com") }
    let(:topic) { create_topic(category: category, user: user) }
    let(:post) { create_post(topic: topic, user: user) }
    let!(:email_log) { Fabricate(:email_log, reply_key: reply_key, user: user, topic: topic, post: post) }

    it "uses MD5 of 'mail_string' there is no message_id" 


    it "raises a ReplyUserNotMatchingError when the email address isn't matching the one we sent the notification to" 


    it "raises a TopicNotFoundError when the topic was deleted" 


    it "raises a TopicClosedError when the topic was closed" 


    it "does not raise TopicClosedError when performing a like action" 


    it "raises an InvalidPost when there was an error while creating the post" 


    it "raises an InvalidPost when there are too may mentions" 


    it "raises an InvalidPostAction when they aren't allowed to like a post" 


    it "works" 


    it "automatically elides gmail quotes" 


    it "doesn't process email with same message-id more than once" 


    it "handles different encodings correctly" 


    it "prefers text over html when site setting is disabled" 


    it "prefers html over text when site setting is enabled" 


    it "uses text when prefer_html site setting is enabled but no html is available" 


    it "removes the 'on <date>, <contact> wrote' quoting line" 


    it "removes the 'Previous Replies' marker" 


    it "handles multiple paragraphs" 


    it "handles invalid from header" 


    it "raises a NoSenderDetectedError when the From header doesn't contain an email address" 


    it "doesn't raise an AutoGeneratedEmailError when the mail is auto generated but is whitelisted" 


    it "doesn't raise an AutoGeneratedEmailError when block_auto_generated_emails is disabled" 


    it "allows staged users to reply to a restricted category" 


    describe 'Unsubscribing via email' do
      let(:last_email) { ActionMailer::Base.deliveries.last }

      describe 'unsubscribe_subject.eml' do
        it 'sends an email asking the user to confirm the unsubscription' 


        it 'does nothing unless unsubscribe_via_email is turned on' 

      end

      describe 'unsubscribe_body.eml' do
        it 'sends an email asking the user to confirm the unsubscription' 


        it 'does nothing unless unsubscribe_via_email is turned on' 

      end

      it "raises an UnsubscribeNotAllowed and does not send an unsubscribe email" 

    end

    it "handles inline reply" 


    it "retrieves the first part of multiple replies" 


    it "strips mobile/webmail signatures" 


    it "strips 'original message' context" 


    it "add the 'elided' part of the original message only for private messages" 


    it "doesn't include the 'elided' part of the original message when always_show_trimmed_content is disabled" 


    it "adds the 'elided' part of the original message for public replies when always_show_trimmed_content is enabled" 


    it "supports attached images in TEXT part" 


    it "supports attached images in HTML part" 


    it "supports attachments" 


    it "supports emails with just an attachment" 


    it "supports liking via email" 


    it "ensures posts aren't dated in the future" 


    it "accepts emails with wrong reply key if the system knows about the forwarded email" 

  end

  context "new message to a group" do

    let!(:group) { Fabricate(:group, incoming_email: "team@bar.com|meat@bar.com") }

    it "handles encoded display names" 


    it "handles email with no subject" 


    it "invites everyone in the chain but emails configured as 'incoming' (via reply, group or category)" 


    it "cap the number of staged users created per email" 


    it "associates email replies using both 'In-Reply-To' and 'References' headers when 'find_related_post_with_key' is disabled" 


    it "supports any kind of attachments when 'allow_all_attachments_for_group_messages' is enabled" 


    context "with forwarded emails enabled" do
      before { SiteSetting.enable_forwarded_emails = true }

      it "handles forwarded emails" 


      it "handles weirdly forwarded emails" 


      # Who thought this was a good idea?!
      it "doesn't blow up with localized email headers" 


    end

    context "when message sent to a group has no key and find_related_post_with_key is enabled" do
      let!(:topic) do
        SiteSetting.find_related_post_with_key = true
        process(:email_reply_1)
        Topic.last
      end

      it "creates a reply when the sender and referenced message id are known" 


      it "creates a new topic when the sender is not known" 


      it "creates a new topic when the referenced message id is not known" 

    end
  end

  context "new topic in a category" do

    let!(:category) { Fabricate(:category, email_in: "category@bar.com|category@foo.com", email_in_allow_strangers: false) }

    it "raises a StrangersNotAllowedError when 'email_in_allow_strangers' is disabled" 


    it "raises an InsufficientTrustLevelError when user's trust level isn't enough" 


    it "works" 


    it "adds the 'elided' part of the original message when always_show_trimmed_content is enabled" 


    it "works when approving is enabled" 


    it "ignores by case-insensitive title" 

  end

  context "new topic in a category that allows strangers" do

    let!(:category) { Fabricate(:category, email_in: "category@bar.com|category@foo.com", email_in_allow_strangers: true) }

    it "lets an email in from a stranger" 


    it "lets an email in from a high-TL user" 


    it "fails on email from a low-TL user" 


  end

  context "#reply_by_email_address_regex" do

    before do
      SiteSetting.reply_by_email_address = nil
      SiteSetting.alternative_reply_by_email_addresses = nil
    end

    it "is empty by default" 


    it "uses 'reply_by_email_address' site setting" 


    it "uses 'alternative_reply_by_email_addresses' site setting" 


    it "combines both 'reply_by_email' settings" 


  end

  context "check_address" do
    before do
      SiteSetting.reply_by_email_address = "foo+%{reply_key}@bar.com"
    end

    it "returns nil when the key is invalid" 


    context "with a valid reply" do
      it "returns the destination when the key is valid" 

    end
  end

  context "staged users" do
    before do
      SiteSetting.enable_staged_users = true
    end

    shared_examples "no staged users" do |email_name, expected_exception|
      it "does not create staged users" 

    end

    context "when email address is screened" do
      before do
        ScreenedEmail.expects(:should_block?).with("screened@mail.com").returns(true)
      end

      include_examples "no staged users", :screened_email, Email::Receiver::ScreenedEmailError
    end

    context "when the mail is auto generated" do
      include_examples "no staged users", :auto_generated_header, Email::Receiver::AutoGeneratedEmailError
    end

    context "when email is a bounced email" do
      include_examples "no staged users", :bounced_email, Email::Receiver::BouncedEmailError
    end

    context "when the body is blank" do
      include_examples "no staged users", :no_body, Email::Receiver::NoBodyDetectedError
    end

    context "when unsubscribe via email is not allowed" do
      include_examples "no staged users", :unsubscribe_new_user, Email::Receiver::UnsubscribeNotAllowed
    end

    context "when From email address is not on whitelist" do
      before do
        SiteSetting.email_domains_whitelist = "example.com|bar.com"
      end

      include_examples "no staged users", :blacklist_whitelist_email, Email::Receiver::EmailNotAllowed
    end

    context "when From email address is on blacklist" do
      before do
        SiteSetting.email_domains_blacklist = "email.com|mail.com"
      end

      include_examples "no staged users", :blacklist_whitelist_email, Email::Receiver::EmailNotAllowed
    end

    context "blacklist and whitelist for To and Cc" do
      before do
        Fabricate(:group, incoming_email: "some_group@bar.com")
      end

      it "does not create staged users for email addresses not on whitelist" 


      it "does not create staged users for email addresses on blacklist" 

    end

    context "when destinations aren't matching any of the incoming emails" do
      include_examples "no staged users", :bad_destinations, Email::Receiver::BadDestinationAddress
    end

    context "when email is sent to category" do
      context "when email is sent by a new user and category does not allow strangers" do
        let!(:category) { Fabricate(:category, email_in: "category@foo.com", email_in_allow_strangers: false) }

        include_examples "no staged users", :new_user, Email::Receiver::StrangersNotAllowedError
      end

      context "when email has no date" do
        let!(:category) { Fabricate(:category, email_in: "category@foo.com", email_in_allow_strangers: true) }

        include_examples "no staged users", :no_date, Email::Receiver::InvalidPost
      end
    end

    context "email is a reply" do
      let(:reply_key) { "4f97315cc828096c9cb34c6f1a0d6fe8" }
      let(:category) { Fabricate(:category) }
      let(:user) { Fabricate(:user, email: "discourse@bar.com") }
      let(:topic) { create_topic(category: category, user: user) }
      let(:post) { create_post(topic: topic, user: user) }
      let!(:email_log) { Fabricate(:email_log, reply_key: reply_key, user: user, topic: topic, post: post) }

      context "when the email address isn't matching the one we sent the notification to" do
        include_examples "no staged users", :reply_user_not_matching, Email::Receiver::ReplyUserNotMatchingError
      end
    end

    context "replying without key is allowed" do
      let!(:group) { Fabricate(:group, incoming_email: "team@bar.com") }
      let!(:topic) do
        SiteSetting.find_related_post_with_key = false
        process(:email_reply_1)
        Topic.last
      end

      context "when the topic was deleted" do
        before do
          topic.update_columns(deleted_at: 1.day.ago)
        end

        include_examples "no staged users", :email_reply_staged, Email::Receiver::TopicNotFoundError
      end

      context "when the topic was closed" do
        before do
          topic.update_columns(closed: true)
        end

        include_examples "no staged users", :email_reply_staged, Email::Receiver::TopicClosedError
      end

      context "when they aren't allowed to like a post" do
        before do
          topic.update_columns(archived: true)
        end

        include_examples "no staged users", :email_reply_like, Email::Receiver::InvalidPostAction
      end
    end

    it "does not remove the incoming email record when staged users are deleted" 

  end

  context "mailing list mirror" do
    let!(:category) { Fabricate(:mailinglist_mirror_category) }

    before do
      SiteSetting.block_auto_generated_emails = true
      SiteSetting.find_related_post_with_key = true
    end

    it "should allow creating topic even when email is autogenerated" 


    it "should allow replying without reply key" 


    it "should skip validations for staged users" 


    it "should skip validations for regular users" 


    context "read-only category" do
      before do
        category.set_permissions(everyone: :readonly)
        category.save

        Fabricate(:user, email: "alice@foo.com")
        Fabricate(:user, email: "bob@bar.com")
      end

      it "should allow creating topic within read-only category" 


      it "should allow replying within read-only category" 

    end
  end

  it "tries to fix unparsable email addresses in To and CC headers" 

end
