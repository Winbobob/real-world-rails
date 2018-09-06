# frozen_string_literal: true

require 'spec_helper'

shared_examples_for 'a valid admin email' do
  it 'sends to the admin' 

  it "is from no-reply@#{ActionMailer::Base.default_url_options[:host]}" 

  it 'should actually send the email' 

end

describe AdminMailer, type: :mailer do
  before(:each) do
    mock_app_config(admin_email: 'admin@email.com')
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []
  end
  let!(:admin) { FactoryGirl.create(:admin) }

  describe 'notes_reservation_notification' do
    before do
      @out = FactoryGirl.create(:checked_out_reservation)
      @in = FactoryGirl.create(:checked_in_reservation)
      @mail =
        AdminMailer.notes_reservation_notification([@out], [@in]).deliver_now
    end
    it 'renders the subject' 

    it_behaves_like 'a valid admin email'
  end
  describe 'overdue_checked_in_fine_admin' do
    before do
      @model = FactoryGirl.create(:equipment_model)
      @item = FactoryGirl.create(:equipment_item, equipment_model: @model)
      @res1 = FactoryGirl.build(:checked_in_reservation,
                                equipment_model: @model,
                                equipment_item: @item)
      @res1.save(validate: false)
      @mail = AdminMailer.overdue_checked_in_fine_admin(@res1).deliver_now
    end
    it_behaves_like 'a valid admin email'
    it 'renders the subject' 

  end
  describe 'overdue_checked_in_fine_admin with no fine' do
    before do
      @em = FactoryGirl.create(:equipment_model, late_fee: 0)
      @res = FactoryGirl.build(:checked_in_reservation,
                               equipment_model_id: @em.id)
      @res.save(validate: false)
      @mail = AdminMailer.overdue_checked_in_fine_admin(@res).deliver_now
    end
    it 'doesn\'t send an email' 

  end
  describe 'reservation_created_admin' do
    before do
      @res = FactoryGirl.create(:valid_reservation)
      @mail = AdminMailer.reservation_created_admin(@res).deliver_now
    end
    it_behaves_like 'a valid admin email'
    it 'renders the subject' 

  end
end

