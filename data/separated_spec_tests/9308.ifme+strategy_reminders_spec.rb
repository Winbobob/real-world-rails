# frozen_string_literal: true

require 'spec_helper'

describe StrategyReminders do
  let(:deliveries) { ActionMailer::Base.deliveries }

  before { ActionMailer::Base.deliveries = [] }

  describe '#send_perform_strategy_reminder_emails' do
    context 'no reminders' do
      it 'sends no emails' 

    end

    context 'reminders exist' do
      let!(:user) { create(:user1) }
      let!(:strategy) { create(:strategy, :with_daily_reminder, user_id: user.id) }
      let!(:reminder) { strategy.perform_strategy_reminder }

      context 'perform strategy reminder is active' do
        it 'sends an email' 

      end

      context 'perform strategy reminder is not active' do
        it "doesn't send an email" 

      end
    end
  end
end

