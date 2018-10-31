# frozen_string_literal: true

require 'spec_helper'
include EnvHelpers

shared_examples_for 'valid user email' do
  it 'sends to the reserver' 

  it 'sends an email' 

  # FIXME: Workaround for #398 disables this functionality for RSpec testing
  # it "is from the admin" do
  #   expect(@mail.from.size).to eq(1)
  #   expect(@mail.from.first).to eq(AppConfig.check :admin_email)
  # end
end

shared_examples_for 'contains reservation' do
  it 'has reservation link' 

end

describe UserMailer, type: :mailer do
  before(:each) do
    @ac = mock_app_config(admin_email: 'admin@email.com',
                          disable_user_emails: false)
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []
    @res = FactoryGirl.create(:valid_reservation,
                              reserver: reserver,
                              start_date: Time.zone.today + 1)
  end
  let!(:reserver) { FactoryGirl.create(:user) }

  describe 'reservation_status_update' do
    it 'sends to the reserver' 


    it 'sends an email' 


    it 'logs if the env is set' 


    it "doesn't log if the env is not set" 


    it 'sends denied notifications' 


    it 'sends approved request notifications' 


    it 'sends approved request notifications for requests starting today' 


    it 'sends expired request notifications' 


    it 'sends reminders to check-out' 


    it 'sends missed notifications' 


    it 'sends check-out receipts' 


    it "doesn't sends check-out receipts if not checked out" 


    it 'sends check-out receipts for reservations due today' 


    it 'sends check-out receipts for overdue reservations' 


    it 'sends reminders to check-in' 


    it 'sends check-in receipts' 


    it 'sends overdue equipment reminders' 


    it 'sends fine emails for overdue equipment' 


    it "doesn't send fine emails when there is no late fee" 


    it "doesn't send at all if disable_user_emails is set" 

  end
end

