require 'spec_helper'

describe CustomerMailer do
  let(:user) { FactoryGirl.create(:user) }

  describe 'welcome_email' do
    it 'renders an email' 

  end

  describe 'confirmation_email' do
    it 'renders email' 

  end

  describe 'password_reset_email' do
    it 'renders email' 

  end

  describe 'additional_email_confirmation' do
    let(:user_email) { FactoryGirl.create(:user_email) }
    it 'renders email' 

  end

  describe 'invoice_email' do
    context 'donation' do
      let(:payment) { FactoryGirl.create(:payment, user: user) }
      it 'renders email' 

    end
    context 'payment' do
      let(:payment) { FactoryGirl.create(:payment, user: user, is_payment: true) }
      it 'renders email' 

    end
  end

  describe 'stolen_bike_alert_email' do
    let!(:ownership) { FactoryGirl.create(:ownership, bike: stolen_record.bike) }
    let(:stolen_record) { FactoryGirl.create(:stolen_record) }
    let(:notification_hash) do
      {
        notification_type: 'stolen_twitter_alerter',
        bike_id: stolen_record.bike.id,
        tweet_id: 69,
        tweet_string: 'STOLEN - something special',
        tweet_account_screen_name: 'bikeindex',
        tweet_account_name: 'Bike Index',
        tweet_account_image: 'https://pbs.twimg.com/profile_images/3384343656/33893b31d39d69fb4b85912489c497b0_bigger.png',
        location: 'Everywhere',
        retweet_screen_names: %w(someother_screename and_another)
      }
    end
    let(:customer_contact) { FactoryGirl.create(:customer_contact, info_hash: notification_hash, title: 'CUSTOM CUSTOMER contact Title', bike: stolen_record.bike) }
    it 'renders email' 

  end

  describe 'recovered_from_link' do
    let(:cycle_type) { FactoryGirl.create(:cycle_type, name: 'Sikk Trike') }
    let(:bike) { FactoryGirl.create(:stolen_bike, cycle_type: cycle_type) }
    let(:stolen_record) { bike.current_stolen_record }
    let!(:ownership) { FactoryGirl.create(:ownership, bike: stolen_record.bike) }
    let(:recovered_description) { 'Bike Index helped me find my stolen bike and get it back!' }
    before { stolen_record.add_recovery_information(recovered_description: recovered_description) }
    it 'renders email' 

  end

  describe 'admin_contact_stolen_email' do
    let!(:ownership) { FactoryGirl.create(:ownership, bike: stolen_record.bike) }
    let(:stolen_record) { FactoryGirl.create(:stolen_record) }
    let(:user) { FactoryGirl.create(:admin, email: 'something@stuff.com') }
    let(:customer_contact) do
      CustomerContact.create(user_email: stolen_record.bike.owner_email,
                             creator_email: user.email,
                             body: 'some message',
                             contact_type: 'stolen_contact',
                             bike_id: stolen_record.bike.id,
                             title: 'some title')
    end
    it 'renders email' 

  end

  describe 'stolen_notification_email' do
    let(:stolen_record) { FactoryGirl.create(:stolen_record) }
    let!(:ownership) { FactoryGirl.create(:ownership, bike: stolen_record.bike) }
    let(:stolen_notification) { FactoryGirl.create(:stolen_notification, message: 'Test Message', reference_url: 'something.com', bike: stolen_record.bike) }
    it 'renders email and update sent_dates' 

  end

  describe 'updated_terms_email' do
    let(:user) { FactoryGirl.create(:user) }
    it 'renders email' 

  end
end

