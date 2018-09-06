require 'rails_helper'
require_dependency 'jobs/base'

describe Jobs::UserEmail do

  before do
    SiteSetting.email_time_window_mins = 10
  end

  let(:user) { Fabricate(:user, last_seen_at: 11.minutes.ago) }
  let(:staged) { Fabricate(:user, staged: true, last_seen_at: 11.minutes.ago) }
  let(:suspended) { Fabricate(:user, last_seen_at: 10.minutes.ago, suspended_at: 5.minutes.ago, suspended_till: 7.days.from_now) }
  let(:anonymous) { Fabricate(:anonymous, last_seen_at: 11.minutes.ago) }
  let(:mailer) { Mail::Message.new(to: user.email) }

  it "raises an error when there is no user" 


  it "raises an error when there is no type" 


  it "raises an error when the type doesn't exist" 


  it "doesn't call the mailer when the user is missing" 


  it "doesn't call the mailer when the user is staged" 


  context "bounce score" do

    it "always sends critical emails when bounce score threshold has been reached" 


  end

  context 'to_address' do
    it 'overwrites a to_address when present' 

  end

  context "recently seen" do
    let(:post) { Fabricate(:post, user: user) }

    it "doesn't send an email to a user that's been recently seen" 


    it "does send an email to a user that's been recently seen but has email_always set" 

  end

  context "email_log" do

    before do
      SiteSetting.editing_grace_period = 0
      Fabricate(:post)
    end

    it "creates an email log when the mail is sent (via Email::Sender)" 


    it "creates an email log when the mail is skipped" 


  end

  context 'args' do

    it 'passes a token as an argument when a token is present' 


    context "post" do
      let(:post) { Fabricate(:post, user: user) }

      it 'passes a post as an argument when a post_id is present' 


      it "doesn't send the email if you've seen the post" 


      it "doesn't send the email if the user deleted the post" 


      it "doesn't send the email if user of the post has been deleted" 


      context 'user is suspended' do
        it "doesn't send email for a pm from a regular user" 


        it "does send an email for a pm from a staff user" 

      end

      context 'user is anonymous' do
        before { SiteSetting.allow_anonymous_posting = true }

        it "doesn't send email for a pm from a regular user" 


        it "doesn't send email for a pm from a staff user" 

      end
    end

    context 'notification' do
      let(:post) { Fabricate(:post, user: user) }
      let!(:notification) {
        Fabricate(:notification,
                    user: user,
                    topic: post.topic,
                    post_number: post.post_number,
                    data: {
                      original_post_id: post.id
                    }.to_json
                 )
      }

      it "doesn't send the email if the notification has been seen" 


      it "does send the email if the notification has been seen but the user is set for email_always" 


      it "does send the email if the user is using daily mailing list mode" 


      context 'max_emails_per_day_per_user limit is reached' do
        before do
          SiteSetting.max_emails_per_day_per_user = 2
          2.times { Fabricate(:email_log, user: user, email_type: 'blah', to_address: user.email) }
        end

        it "does not send notification if limit is reached" 


        it "sends critical email" 

      end

      it "does not send notification if bounce threshold is reached" 


      it "doesn't send the mail if the user is using individual mailing list mode" 


      it "doesn't send the mail if the user is using individual mailing list mode with no echo" 


      it "doesn't send the email if the post has been user deleted" 


      context 'user is suspended' do
        it "doesn't send email for a pm from a regular user" 


        context 'pm from staff' do
          before do
            @pm_from_staff = Fabricate(:post, user: Fabricate(:moderator))
            @pm_from_staff.topic.topic_allowed_users.create!(user_id: suspended.id)
            @pm_notification = Fabricate(:notification,
                                            user: suspended,
                                            topic: @pm_from_staff.topic,
                                            post_number: @pm_from_staff.post_number,
                                            data: { original_post_id: @pm_from_staff.id }.to_json
                                        )
          end

          let :sent_message do
            Jobs::UserEmail.new.message_for_email(
                suspended,
                @pm_from_staff,
                :user_private_message,
                @pm_notification
            )
          end

          it "sends an email" 


          it "sends an email even if user was last seen recently" 

        end
      end

      context 'user is anonymous' do
        before { SiteSetting.allow_anonymous_posting = true }

        it "doesn't send email for a pm from a regular user" 


        it "doesn't send email for a pm from staff" 

      end
    end

  end

end

