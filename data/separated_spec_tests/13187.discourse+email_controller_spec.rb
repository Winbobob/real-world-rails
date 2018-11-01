require 'rails_helper'

describe Admin::EmailController do
  let(:admin) { Fabricate(:admin) }
  let(:email_log) { Fabricate(:email_log) }

  before do
    sign_in(admin)
  end

  it "is a subclass of AdminController" 


  describe '#index' do
    before do
      Admin::EmailController.any_instance
        .expects(:action_mailer_settings)
        .returns(
          username: 'username',
          password: 'secret'
        )
    end

    it 'does not include the password in the response' 

  end

  describe '#sent' do
    let(:post) { Fabricate(:post) }
    let(:email_log) { Fabricate(:email_log, post: post) }

    let(:post_reply_key) do
      Fabricate(:post_reply_key, post: post, user: email_log.user)
    end

    it "should return the right response" 

  end

  describe '#skipped' do
    let(:user) { Fabricate(:user) }
    let!(:log1) { Fabricate(:skipped_email_log, user: user) }
    let!(:log2) { Fabricate(:skipped_email_log) }

    it "succeeds" 


    describe 'when filtered by username' do
      it 'should return the right response' 

    end
  end

  describe '#test' do
    it 'raises an error without the email parameter' 


    context 'with an email address' do
      it 'enqueues a test email job' 

    end

    context 'with SiteSetting.disable_emails' do
      let(:eviltrout) { Fabricate(:evil_trout) }
      let(:admin) { Fabricate(:admin) }

      it 'does not sends mail to anyone when setting is "yes"' 


      it 'sends mail to staff only when setting is "non-staff"' 


      it 'sends mail to everyone when setting is "no"' 

    end
  end

  describe '#preview_digest' do
    it 'raises an error without the last_seen_at parameter' 


    it "previews the digest" 

  end

  describe '#handle_mail' do
    it 'should enqueue the right job' 

  end

  describe '#rejected' do
    it 'should provide a string for a blank error' 

  end

  describe '#incoming' do
    it 'should provide a string for a blank error' 

  end
end

