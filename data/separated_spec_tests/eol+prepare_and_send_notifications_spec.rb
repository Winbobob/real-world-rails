;require "spec_helper"

describe PrepareAndSendNotifications do

  it 'uses notification queue' 


  describe '.perform' do

    context 'after notifications already sent' do

      before do
        allow(PendingNotification).to receive(:send_notifications)
        allow(NotificationEmailerSettings).to receive(:last_daily_emails_sent) { Time.now }
        allow(NotificationEmailerSettings).to receive(:last_weekly_emails_sent) { Time.now }
      end

      it 'send immediate notifications' 


      it 'does NOT send daily notifications' 


      it 'does NOT send weekly notifications' 


    end

    context 'after daily already sent' do

      before do
        allow(PendingNotification).to receive(:send_notifications)
        allow(NotificationEmailerSettings).to receive(:last_daily_emails_sent) { Time.now }
        allow(NotificationEmailerSettings).to receive(:last_weekly_emails_sent) { 3.weeks.ago }
      end

      it 'send immediate notifications' 


      it 'does NOT send daily notifications' 


      it 'sends weekly notifications' 


    end

    context 'after weekly already sent' do

      before do
        allow(PendingNotification).to receive(:send_notifications)
        allow(NotificationEmailerSettings).to receive(:last_daily_emails_sent) { 2.days.ago }
        allow(NotificationEmailerSettings).to receive(:last_weekly_emails_sent) { Time.now }
      end

      it 'send immediate notifications' 


      it 'sends daily notifications' 


      it 'does NOT send weekly notifications' 


    end

  end

end

