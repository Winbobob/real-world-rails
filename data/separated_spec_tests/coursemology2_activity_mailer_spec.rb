# frozen_string_literal: true
require 'rails_helper'

RSpec.describe ActivityMailer, type: :mailer do
  let(:instance) { Instance.default }

  with_tenant(:instance) do
    let(:template) { 'activity_mailer/test_email' }
    let(:user) { create(:user, name: 'tester') }
    let(:activity) { create(:activity, object: user) }
    let(:notification) { create(:user_notification, activity: activity) }
    let(:mail) do
      ActivityMailer.email(recipient: user, notification: notification, view_path: template)
    end
    let(:text) { mail.body.parts.find { |part| part.content_type.start_with?('text/plain') }.to_s }
    let(:html) { mail.body.parts.find { |part| part.content_type.start_with?('text/html') }.to_s }

    context 'with default mailer layout' do
      it 'sets the correct headers' 


      it 'renders the layout' 


      it 'sends a multipart email' 


      it 'provides views with the given object' 

    end

    context 'with no greeting mailer layout' do
      let(:mail) do
        ActivityMailer.email(recipient: user, notification: notification,
                             view_path: template, layout_path: 'no_greeting_mailer')
      end

      it 'does not render salutation and sign-off' 

    end
  end
end

