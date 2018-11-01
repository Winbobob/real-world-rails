# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Course::Mailer, type: :mailer do
  subject { mail }

  let(:instance) { Instance.default }
  with_tenant(:instance) do
    let(:course) { create(:course) }
    let(:text) { mail.body.parts.find { |part| part.content_type.start_with?('text/plain') }.to_s }
    let(:html) { mail.body.parts.find { |part| part.content_type.start_with?('text/html') }.to_s }

    describe '#user_invitation_email' do
      let(:invitation) { create(:course_user_invitation, course: course) }
      let(:mail) { Course::Mailer.user_invitation_email(invitation) }

      it 'sends to the correct person' 


      it 'sets the correct subject' 


      it 'provides the invitation key' 

    end

    describe '#user_added_email' do
      let(:course_user) { create(:course_user, course: course) }
      let(:mail) { Course::Mailer.user_added_email(course_user) }

      it 'sends to the correct person' 


      it 'sets the correct subject' 

    end

    describe '#user_enrol_requested_email' do
      let(:enrol_request) { create(:course_enrol_request, course: course) }
      let(:mail) { Course::Mailer.user_enrol_requested_email(enrol_request) }

      it 'sends to the course staff' 


      it 'sets the correct subject' 


      context 'when email notification for new enrol request is disabled' do
        before do
          context = OpenStruct.new(key: Course::UsersComponent.key, current_course: course)
          Course::Settings::UsersComponent.new(context).
            update_email_setting('key' => 'new_enrol_request', 'enabled' => false)
          course.save!
        end

        it 'does not send an email notification' 

      end
    end
  end
end

