# frozen_string_literal: true

require 'rails_helper'

describe CourseApprovalMailer do
  let(:course) { create(:course, title: 'Foo Course') }
  let(:instructor) { create(:user, email: 'karen@example.edu') }

  describe '.send_approval_notification' do
    let(:mail) { described_class.send_approval_notification(course, instructor) }

    it 'delivers an email with an enrollment link' 

  end
end
