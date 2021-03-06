require 'rails_helper'

RSpec.describe MailUtilities::SmokeTestEmailCheck do
  subject { described_class.new email_address }

  describe '#matches?' do
    context 'a smoke test email address with a uuid' do
      let(:email_address) { "user+#{SecureRandom.uuid}@example.com" }

      specify { expect(subject.matches?).to be_truthy }
    end

    context 'a regular email address' do
      let(:email_address) { "some-email@gmail.com" }

      specify { expect(subject.matches?).to be_falsey }
    end
  end
end

