require "spec_helper"

RSpec.describe UserMailer, type: :mailer do

  describe "we_miss_you_reminder" do
    let(:reminder) { user.build_reminder }
    let(:central) { create(:organization, name: 'central') }
    let(:user) { build :user, last_organization: central, last_submission_date: days_since_last_submission.days.ago, last_reminded_date: days_since_last_reminded.days.ago }

    let(:days_since_last_submission) { 9 }
    let(:days_since_last_reminded) { 8 }


    it "renders the headers" 


    context 'last reminded over 1 week ago' do
      let(:days_since_last_reminded) { 8 }

      context "last submission this week" do
        let(:days_since_last_submission) { 3 }

        it { expect(user.should_send_reminder?).to be false }
      end

      context "last submission 1 week ago" do
        it { expect(user.should_send_reminder?).to be true }
        it { expect(reminder.body.encoded).to include("Keep learning") }
      end

      context "last submission 2 weeks ago" do
        let(:days_since_last_submission) { 16 }

        it { expect(user.should_send_reminder?).to be true }
        it { expect(reminder.body.encoded).to include("Keep learning") }
      end

      context "last submission 3 weeks ago" do
        let(:days_since_last_submission) { 26 }

        it { expect(user.should_send_reminder?).to be true }
        it { expect(reminder.body.encoded).to include("Keep learning") }
      end

      context "last submission 4 weeks ago" do
        let(:days_since_last_submission) { 30 }

        it { expect(user.should_send_reminder?).to be false }
      end
    end

    context 'last reminded this week' do
      let(:days_since_last_reminded) { 2 }

      context "last submission this week" do
        let(:days_since_last_submission) { 3 }

        it { expect(user.should_send_reminder?).to be false }
      end

      context "last submission 1 week ago" do
        it { expect(user.should_send_reminder?).to be false }
      end
    end
  end
end

