require 'spec_helper'

describe AdminMailer do
  describe 'feedback_notification_email' do
    before :each do
      @feedback = FactoryGirl.create(:feedback)
      @mail = AdminMailer.feedback_notification_email(@feedback)
    end
    it 'renders email' 

  end

  describe 'special_feedback_notification_email' do
    before :each do
      @bike = FactoryGirl.create(:bike)
      @feedback = FactoryGirl.create(:feedback, feedback_hash: { bike_id: @bike.id })
    end
    it 'sends a delete request email' 

    it 'sends a recovery email' 

    it 'sends a stolen_information email' 

    it 'sends a serial update email' 

    it 'sends a new org email' 

  end

  context 'user_hidden bike' do
    let(:ownership) { FactoryGirl.create(:ownership, user_hidden: true) }
    let(:bike) { ownership.bike }
    let(:feedback) { FactoryGirl.create(:feedback, feedback_hash: { bike_id: bike.id }, feedback_type: 'bike_delete_request') }
    it "doesn't explode" 

  end

  describe 'no_admins_notification_email' do
    before :each do
      @organization = FactoryGirl.create(:organization)
      @mail = AdminMailer.no_admins_notification_email(@organization)
    end

    it 'renders email' 

  end

  describe 'blocked_stolen_notification_email' do
    before :each do
      @stolen_notification = FactoryGirl.create(:stolen_notification, message: 'Test Message', subject: 'Test subject')
      @mail = AdminMailer.blocked_stolen_notification_email(@stolen_notification)
    end

    it 'renders email' 

  end
end

