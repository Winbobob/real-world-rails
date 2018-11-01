require "rails_helper"
require "email/processor"

describe Email::Processor do
  after do
    $redis.flushall
  end

  let(:from) { "foo@bar.com" }

  context "when reply via email is too short" do
    let(:mail) { file_from_fixtures("chinese_reply.eml", "emails").read }
    let(:post) { Fabricate(:post) }
    let(:user) { Fabricate(:user, email: 'discourse@bar.com') }

    let!(:post_reply_key) do
      Fabricate(:post_reply_key,
        user: user,
        post: post,
        reply_key: '4f97315cc828096c9cb34c6f1a0d6fe8'
      )
    end

    before do
      SiteSetting.email_in = true
      SiteSetting.reply_by_email_address = "reply+%{reply_key}@bar.com"
      SiteSetting.min_post_length = 1000
    end

    it "rejects reply and sends an email with custom error message" 

  end

  describe "rate limits" do

    let(:mail) { "From: #{from}\nTo: bar@foo.com\nSubject: FOO BAR\n\nFoo foo bar bar?" }
    let(:limit_exceeded) { RateLimiter::LimitExceeded.new(10) }

    before do
      Email::Receiver.any_instance.expects(:process!).raises(limit_exceeded)
    end

    it "enqueues a background job by default" 


    it "doesn't enqueue a background job when retry is disabled" 


  end

  context "known error" do

    let(:mail) { "From: #{from}\nTo: bar@foo.com" }
    let(:mail2) { "From: #{from}\nTo: foo@foo.com" }
    let(:mail3) { "From: #{from}\nTo: foobar@foo.com" }

    it "only sends one rejection email per day" 

  end

  context "unrecognized error" do

    let(:mail) { "From: #{from}\nTo: bar@foo.com\nSubject: FOO BAR\n\nFoo foo bar bar?" }
    let(:mail2) { "From: #{from}\nTo: foo@foo.com\nSubject: BAR BAR\n\nBar bar bar bar?" }

    it "sends a rejection email on an unrecognized error" 


    it "sends more than one rejection email per day" 


  end

  context "from reply to email address" do

    let(:mail) { "From: reply@bar.com\nTo: reply@bar.com\nSubject: FOO BAR\n\nFoo foo bar bar?" }

    it "ignores the email" 


  end

  context "mailinglist mirror" do
    before do
      SiteSetting.email_in = true
      Fabricate(:mailinglist_mirror_category)
    end

    it "does not send rejection email" 

  end

  describe 'when replying to a post that is too old' do
    let(:mail) { file_from_fixtures("old_destination.eml", "emails").read }

    it 'rejects the email with the right response' 

  end
end

