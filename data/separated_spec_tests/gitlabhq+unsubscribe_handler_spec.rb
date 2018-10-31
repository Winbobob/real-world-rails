# frozen_string_literal: true

require 'spec_helper'

describe Gitlab::Email::Handler::UnsubscribeHandler do
  include_context :email_shared_context

  before do
    stub_incoming_email_setting(enabled: true, address: 'reply+%{key}@appmail.adventuretime.ooo')
    stub_config_setting(host: 'localhost')
  end

  let(:email_raw) { fixture_file('emails/valid_reply.eml').gsub(mail_key, "#{mail_key}+unsubscribe") }
  let(:project) { create(:project, :public) }
  let(:user) { create(:user) }
  let(:noteable) { create(:issue, project: project) }

  let!(:sent_notification) { SentNotification.record(noteable, user.id, mail_key) }

  context 'when notification concerns a commit' do
    let(:commit) { create(:commit, project: project) }
    let!(:sent_notification) { SentNotification.record(commit, user.id, mail_key) }

    it 'handler does not raise an error' 

  end

  context 'user is unsubscribed' do
    it 'leaves user unsubscribed' 

  end

  context 'user is subscribed' do
    before do
      noteable.subscribe(user)
    end

    it 'unsubscribes user from notable' 

  end

  context 'when the noteable could not be found' do
    before do
      noteable.destroy
    end

    it 'raises a NoteableNotFoundError' 

  end

  context 'when no sent notification for the mail key could be found' do
    let(:email_raw) { fixture_file('emails/wrong_mail_key.eml') }

    it 'raises a SentNotificationNotFoundError' 

  end
end

