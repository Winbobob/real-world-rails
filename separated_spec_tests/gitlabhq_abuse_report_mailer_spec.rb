require 'rails_helper'

describe AbuseReportMailer do
  include EmailSpec::Matchers

  describe '.notify' do
    context 'with admin_notification_email set' do
      before do
        stub_application_setting(admin_notification_email: 'admin@example.com')
      end

      it 'sends to the admin_notification_email' 


      it 'includes the user in the subject' 

    end

    context 'with no admin_notification_email set' do
      it 'returns early' 

    end
  end
end

