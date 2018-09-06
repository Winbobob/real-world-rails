# frozen_string_literal: true

require 'feature_spec_helper'

describe 'Contact form:', type: :feature do
  let(:email)         { 'archivist1@example.com' }
  let(:email_subject) { 'My Subject is Cool' }
  let(:user)          { create(:user, email: email) }
  let(:sent_messages) { ActionMailer::Base.deliveries }
  let(:admin_message) {
    sent_messages.find do |message|
      message.to == ['scholarsphere@servicedesk.css.psu.edu', 'umg-up.its.scholarsphere-support@groups.ucs.psu.edu']
    end
  }
  let(:thank_you_message) {
    sent_messages.find do |message|
      message.to == [email]
    end
  }
  let(:plaintext_message) {
    admin_message.body.parts.find do |p|
      p.content_type.match(/plain/)
    end
  }
  let(:html_message) {
    admin_message.body.parts.find do |p|
      p.content_type.match(/html/)
    end
  }

  before { sign_in(user) }

  it 'sends emails to the service desk and confirmations to the user' 

end

