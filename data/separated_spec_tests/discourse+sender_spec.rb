require 'rails_helper'
require 'email/sender'

describe Email::Sender do
  let(:post) { Fabricate(:post) }

  context "disable_emails is enabled" do
    let(:user) { Fabricate(:user) }
    let(:moderator) { Fabricate(:moderator) }

    context "disable_emails is enabled for everyone" do
      before { SiteSetting.disable_emails = "yes" }

      it "doesn't deliver mail when mails are disabled" 


      it "delivers mail when mails are disabled but the email_type is admin_login" 

    end

    context "disable_emails is enabled for non-staff users" do
      before { SiteSetting.disable_emails = "non-staff" }

      it "doesn't deliver mail to normal user" 


      it "delivers mail to staff user" 

    end
  end

  it "doesn't deliver mail when the message is of type NullMail" 


  it "doesn't deliver mail when the message is nil" 


  it "doesn't deliver when the to address is nil" 


  it "doesn't deliver when the body is nil" 


  context "host_for" do
    it "defaults to localhost" 


    it "returns localhost for a weird host" 


    it "parses hosts from urls" 


    it "downcases hosts" 


  end

  context 'with a valid message' do

    let(:reply_key) { "abcd" * 8 }

    let(:message) do
      message = Mail::Message.new to: 'eviltrout@test.domain',
                                  body: '**hello**'
      message.stubs(:deliver_now)
      message
    end

    let(:email_sender) { Email::Sender.new(message, :valid_type) }

    it 'calls deliver' 


    context "doesn't add return_path when no plus addressing" do
      before { SiteSetting.reply_by_email_address = '%{reply_key}@test.com' }

      it 'should not set the return_path' 

    end

    context "adds return_path with plus addressing" do
      before { SiteSetting.reply_by_email_address = 'replies+%{reply_key}@test.com' }

      it 'should set the return_path' 

    end

    context "adds a List-ID header to identify the forum" do
      let(:category) { Fabricate(:category, name: 'Name With Space') }
      let(:topic) { Fabricate(:topic, category: category) }
      let(:post) { Fabricate(:post, topic: topic) }

      before do
        message.header['X-Discourse-Post-Id']  = post.id
        message.header['X-Discourse-Topic-Id'] = topic.id
      end

      it 'should add the right header' 

    end

    context "adds a Message-ID header even when topic id is not present" do

      it 'should add the right header' 

    end

    context "adds Precedence header" do
      let(:topic) { Fabricate(:topic) }
      let(:post) { Fabricate(:post, topic: topic) }

      before do
        message.header['X-Discourse-Post-Id']  = post.id
        message.header['X-Discourse-Topic-Id'] = topic.id
      end

      it 'should add the right header' 

    end

    context "removes custom Discourse headers from topic notification mails" do
      let(:topic) { Fabricate(:topic) }
      let(:post) { Fabricate(:post, topic: topic) }

      before do
        message.header['X-Discourse-Post-Id']  = post.id
        message.header['X-Discourse-Topic-Id'] = topic.id
      end

      it 'should remove the right headers' 

    end

    context "removes custom Discourse headers from digest/registration/other mails" do
      it 'should remove the right headers' 

    end

    context "email threading" do
      let(:topic) { Fabricate(:topic) }

      let(:post_1) { Fabricate(:post, topic: topic, post_number: 1) }
      let(:post_2) { Fabricate(:post, topic: topic, post_number: 2) }
      let(:post_3) { Fabricate(:post, topic: topic, post_number: 3) }
      let(:post_4) { Fabricate(:post, topic: topic, post_number: 4) }

      let!(:post_reply_1_4) { PostReply.create(post: post_1, reply: post_4) }
      let!(:post_reply_2_4) { PostReply.create(post: post_2, reply: post_4) }
      let!(:post_reply_3_4) { PostReply.create(post: post_3, reply: post_4) }

      before { message.header['X-Discourse-Topic-Id'] = topic.id }

      it "doesn't set the 'In-Reply-To' and 'References' headers on the first post" 


      it "sets the 'In-Reply-To' header to the topic by default" 


      it "sets the 'In-Reply-To' header to the newest replied post" 


      it "sets the 'References' header to the topic and all replied posts" 


      it "uses the incoming_email message_id when available" 


    end

    context "merges custom mandrill header" do
      before do
        ActionMailer::Base.smtp_settings[:address] = "smtp.mandrillapp.com"
        message.header['X-MC-Metadata'] = { foo: "bar" }.to_json
      end

      it 'should set the right header' 

    end

    context "merges custom sparkpost header" do
      before do
        ActionMailer::Base.smtp_settings[:address] = "smtp.sparkpostmail.com"
        message.header['X-MSYS-API'] = { foo: "bar" }.to_json
      end

      it 'should set the right header' 

    end

    context 'email logs' do
      let(:email_log) { EmailLog.last }

      it 'should create the right log' 

    end

    context "email log with a post id and topic id" do
      let(:topic) { post.topic }

      before do
        message.header['X-Discourse-Post-Id'] = post.id
        message.header['X-Discourse-Topic-Id'] = topic.id
      end

      let(:email_log) { EmailLog.last }

      it 'should create the right log' 

    end

    context 'email parts' do
      it 'should contain the right message' 

    end
  end

  context 'with a deleted post' do

    it 'should skip sending the email' 


  end

  context 'with a user' do
    let(:message) do
      message = Mail::Message.new to: 'eviltrout@test.domain', body: 'test body'
      message.stubs(:deliver_now)
      message
    end

    let(:user) { Fabricate(:user) }
    let(:email_sender) { Email::Sender.new(message, :valid_type, user) }

    before do
      email_sender.send
      @email_log = EmailLog.last
    end

    it 'should have the current user_id' 


    describe "post reply keys" do
      let(:post) { Fabricate(:post) }

      before do
        message.header['X-Discourse-Post-Id'] = post.id
        message.header['Reply-To'] = "test-%{reply_key}@test.com"
      end

      describe 'when allow reply by email header is not present' do
        it 'should not create a post reply key' 

      end

      describe 'when allow reply by email header is present' do
        let(:header) { Email::MessageBuilder::ALLOW_REPLY_BY_EMAIL_HEADER }

        before do
          message.header[header] = "test-%{reply_key}@test.com"
        end

        it 'should create a post reply key' 

      end
    end
  end

end

