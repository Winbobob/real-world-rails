# frozen_string_literal: true

require 'rails_helper'

describe WikiEmailMailer do
  let(:user) { create(:user, email: 'newbie@example.edu') }

  describe '.send_email_warning' do
    let(:mail) { described_class.send_email_warning(user) }

    it 'delivers an email with a pointer to Wikipedia preferences' 

  end
end

