# frozen_string_literal: true

require 'rails_helper'

describe CourseSubmissionMailer do
  let(:course) { create(:course, title: 'Foo Course') }
  let(:instructor) { create(:user, email: 'karen@example.edu') }

  describe '.send_submission_confirmation' do
    let(:mail) { described_class.send_submission_confirmation(course, instructor) }
    it 'delivers an email with course details' 

  end
end

