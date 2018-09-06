require "rails_helper"

describe UserNotifications do

  let(:user) { Fabricate(:admin) }

  describe "#get_context_posts" do
    it "does not include hidden/deleted/user_deleted posts in context" 


    it "allows users to control context" 


  end

  describe ".signup" do

    subject { UserNotifications.signup(user) }

    it "works" 


  end

  describe ".forgot_password" do

    subject { UserNotifications.forgot_password(user) }

    it "works" 


  end

  describe '.email_login' do
    let(:email_token) { user.email_tokens.create!(email: user.email).token }
    subject { UserNotifications.email_login(user, email_token: email_token) }

    it "generates the right email" 

  end

  describe '.digest' do

    subject { UserNotifications.digest(user) }

    context "without new topics" do

      it "doesn't send the email" 


    end

    context "with topics only from new users" do
      let!(:new_today)     { Fabricate(:topic, user: Fabricate(:user, trust_level: TrustLevel[0], created_at: 10.minutes.ago), title: "Hey everyone look at me") }
      let!(:new_yesterday) { Fabricate(:topic, user: Fabricate(:user, trust_level: TrustLevel[0], created_at: 25.hours.ago), created_at: 25.hours.ago, title: "This topic is of interest to you") }

      it "returns topics from new users if they're more than 24 hours old" 

    end

    context "with new topics" do

      before do
        Fabricate(:topic, user: Fabricate(:coding_horror), created_at: 1.hour.ago)
      end

      it "works" 


      it "includes email_prefix in email subject instead of site title" 


      it "excludes deleted topics and their posts" 


      it "excludes whispers and other post types that don't belong" 


      it "excludes deleted and hidden posts" 


      it "excludes posts that are newer than editing grace period" 


      it "uses theme color" 

    end

  end

  describe '.user_replied' do
    let(:response_by_user) { Fabricate(:user, name: "John Doe") }
    let(:category) { Fabricate(:category, name: 'India') }
    let(:topic) { Fabricate(:topic, category: category) }
    let(:post) { Fabricate(:post, topic: topic, raw: 'This is My super duper cool topic') }
    let(:response) { Fabricate(:post, reply_to_post_number: 1, topic: post.topic, user: response_by_user) }
    let(:user) { Fabricate(:user) }
    let(:notification) { Fabricate(:notification, user: user) }

    it 'generates a correct email' 


    it "doesn't include details when private_email is enabled" 

  end

  describe '.user_posted' do
    let(:response_by_user) { Fabricate(:user, name: "John Doe", username: "john") }
    let(:post) { Fabricate(:post) }
    let(:response) { Fabricate(:post, topic: post.topic, user: response_by_user) }
    let(:user) { Fabricate(:user) }
    let(:notification) { Fabricate(:notification, user: user, data: { original_username: response_by_user.username }.to_json) }

    it 'generates a correct email' 


    it "doesn't include details when private_email is enabled" 

  end

  describe '.user_private_message' do
    let(:response_by_user) { Fabricate(:user, name: "", username: "john") }
    let(:topic) { Fabricate(:private_message_topic) }
    let(:response) { Fabricate(:post, topic: topic, user: response_by_user) }
    let(:user) { Fabricate(:user) }
    let(:notification) { Fabricate(:notification, user: user, data: { original_username: response_by_user.username }.to_json) }

    it 'generates a correct email' 


    it "doesn't include details when private_email is enabled" 


    it "doesn't include group name in subject" 


    it "includes a list of participants, groups first with member lists" 


    context "when SiteSetting.group_name_in_subject is true" do
      before do
        SiteSetting.group_in_subject = true
      end

      let(:group) { Fabricate(:group, name: "my_group") }
      let(:mail) { UserNotifications.user_private_message(
        response.user,
        post: response,
        notification_type: notification.notification_type,
        notification_data_hash: notification.data_hash
      ) }

      shared_examples "includes first group name" do
        it "includes first group name in subject" 


        context "when first group has full name" do
          it "includes full name in subject" 

        end
      end

      context "one group in pm" do
        before do
          topic.allowed_groups = [ group ]
        end

        include_examples "includes first group name"
      end

      context "multiple groups in pm" do
        let(:group2) { Fabricate(:group) }

        before do
          topic.allowed_groups = [ group, group2 ]
        end

        include_examples "includes first group name"
      end

      context "no groups in pm" do
        it "includes %{optional_pm} in subject" 

      end
    end
  end

  it 'adds a warning when mail limit is reached' 


  def expects_build_with(condition)
    UserNotifications.any_instance.expects(:build_email).with(user.email, condition)
    mailer = UserNotifications.send(mail_type, user,
                                    notification_type: Notification.types[notification.notification_type],
                                    notification_data_hash: notification.data_hash,
                                    post: notification.post)
    mailer.message
  end

  shared_examples "supports reply by email" do
    context "reply_by_email" do
      it "should have allow_reply_by_email set when that feature is enabled" 

    end
  end

  shared_examples "no reply by email" do
    context "reply_by_email" do
      it "doesn't support reply by email" 

    end
  end

  shared_examples "respect for private_email" do
    context "private_email" do
      it "doesn't support reply by email" 

    end
  end

  # The parts of emails that are derived from templates are translated
  shared_examples "sets user locale" do
    context "set locale for translating templates" do
      it "sets the locale" 

    end
  end

  shared_examples "notification email building" do
    let(:post) { Fabricate(:post, user: user) }
    let(:mail_type) { "user_#{notification_type}" }
    let(:mail_template) { "user_notifications.#{mail_type}" }
    let(:username) { "walterwhite" }
    let(:notification) do
      Fabricate(:notification,
                user: user,
                topic: post.topic,
                notification_type: Notification.types[notification_type],
                post_number: post.post_number,
                data: { original_username: username }.to_json)
    end

    describe 'email building' do
      it "has a username" 


      it "has a url" 


      it "has a template" 


      it "overrides the html part" 


      it "has a message" 


      it "has a context" 


      it "has an unsubscribe link" 


      it "has an post_id" 


      it "has an topic_id" 


      it "should have user name as from_alias" 


      it "should not have user name as from_alias if display_name_on_posts is disabled" 


      it "should explain how to respond" 


      it "should not explain how to respond if the user is suspended" 


      context "when customized" do
        let(:custom_body) do
          body = <<~BODY
          You are now officially notified.
          %{header_instructions}
          %{message} %{respond_instructions}
          %{topic_title_url_encoded}
          %{site_title_url_encoded}
          BODY

          body << "%{context}" if notification_type != :invited_to_topic
          body
        end

        before do
          TranslationOverride.upsert!(
            "en",
            "#{mail_template}.text_body_template",
            custom_body
          )
        end

        it "shouldn't use the default html_override" 

      end
    end
  end

  describe "user mentioned email" do
    include_examples "notification email building" do
      let(:notification_type) { :mentioned }
      include_examples "respect for private_email"
      include_examples "supports reply by email"
      include_examples "sets user locale"
    end
  end

  describe "user replied" do
    include_examples "notification email building" do
      let(:notification_type) { :replied }
      include_examples "respect for private_email"
      include_examples "supports reply by email"
      include_examples "sets user locale"
    end
  end

  describe "user quoted" do
    include_examples "notification email building" do
      let(:notification_type) { :quoted }
      include_examples "respect for private_email"
      include_examples "supports reply by email"
      include_examples "sets user locale"
    end
  end

  describe "user posted" do
    include_examples "notification email building" do
      let(:notification_type) { :posted }
      include_examples "respect for private_email"
      include_examples "supports reply by email"
      include_examples "sets user locale"
    end
  end

  describe "user invited to a private message" do
    include_examples "notification email building" do
      let(:notification_type) { :invited_to_private_message }
      let(:post) { Fabricate(:private_message_post) }
      let(:user) { post.user }
      let(:mail_template) { "user_notifications.user_#{notification_type}_pm" }

      include_examples "respect for private_email"
      include_examples "no reply by email"
      include_examples "sets user locale"
    end
  end

  describe "group invited to a private message" do
    include_examples "notification email building" do
      let(:notification_type) { :invited_to_private_message }
      let(:post) { Fabricate(:private_message_post) }
      let(:user) { post.user }
      let(:group) { Fabricate(:group) }
      let(:mail_template) { "user_notifications.user_#{notification_type}_pm_group" }

      before do
        notification.data_hash[:group_id] = group.id
        notification.save!
      end

      it "should include the group name" 


      include_examples "respect for private_email"
      include_examples "no reply by email"
      include_examples "sets user locale"
    end
  end

  describe "user invited to a topic" do
    include_examples "notification email building" do
      let(:notification_type) { :invited_to_topic }
      include_examples "respect for private_email"
      include_examples "no reply by email"
      include_examples "sets user locale"
    end
  end

  describe "watching first post" do
    include_examples "notification email building" do
      let(:notification_type) { :invited_to_topic }
      include_examples "respect for private_email"
      include_examples "no reply by email"
      include_examples "sets user locale"
    end
  end

  # notification emails derived from templates are translated into the user's locale
  shared_examples "notification derived from template" do
    let(:user) { Fabricate(:user, locale: locale) }
    let(:mail_type) { mail_type }
    let(:notification) { Fabricate(:notification, user: user) }
  end

  describe "notifications from template" do

    context "user locale has been set" do

      %w(signup signup_after_approval confirm_old_email notify_old_email confirm_new_email
         forgot_password admin_login account_created).each do |mail_type|
        include_examples "notification derived from template" do
          SiteSetting.default_locale = "en"
          let(:locale) { "fr" }
          let(:mail_type) { mail_type }
          it "sets the locale" 

        end
      end
    end

    context "user locale has not been set" do
      %w(signup signup_after_approval notify_old_email confirm_old_email confirm_new_email
         forgot_password admin_login account_created).each do |mail_type|
        include_examples "notification derived from template" do
          SiteSetting.default_locale = "en"
          let(:locale) { nil }
          let(:mail_type) { mail_type }
          it "sets the locale" 

        end
      end
    end

    context "user locale is an empty string" do
      %w(signup signup_after_approval notify_old_email confirm_new_email confirm_old_email
         forgot_password admin_login account_created).each do |mail_type|
        include_examples "notification derived from template" do
          SiteSetting.default_locale = "en"
          let(:locale) { "" }
          let(:mail_type) { mail_type }
          it "sets the locale" 

        end
      end
    end

  end
end

