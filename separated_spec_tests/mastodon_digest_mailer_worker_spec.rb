# frozen_string_literal: true

require 'rails_helper'

describe DigestMailerWorker do
  describe 'perform' do
    let(:user) { Fabricate(:user, last_emailed_at: 3.days.ago) }

    context 'for a user who receives digests' do
      it 'sends the email' 

    end

    context 'for a user who does not receive digests' do
      it 'does not send the email' 

    end

    def update_user_digest_setting(value)
      user.settings['notification_emails'] = user.settings['notification_emails'].merge('digest' => value)
    end
  end
end

