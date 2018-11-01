require 'spec_helper'

describe Mailer do

  describe 'send_premium_payment_complete_message' do
    let(:plan) { instance_double(Plan, name: 'Premium', free_trial_length_days: 7, free_trial?: true, category: nil) }
    it 'sends payment complete message' 

  end


  describe '#send_welcome_message' do
    before(:each) do
      @user = User.new first_name: 'Email',
                       last_name: 'Sender',
                       email: 'candice@clemens.com',
                       password: '1234567890'
    end

    it 'should send welcome message' 

  end

  describe '#hire_me_contact_form' do
    let(:valid_params) { {name: 'Thomas', email: 'thomas@email.com', message: 'Want to hire you!'} }
    before(:each) do
      @user = User.new first_name: 'Marcelo',
                       last_name: 'Mr G',
                       email: 'marcelo@whatever.com',
                       password: '1234567890'

    end
    it 'should send hire_me message' 

  end
  describe '#alert_project_creator_about_new_member' do
    before(:each) do
        @user1 = FactoryBot.create(:user, first_name: 'Reva', last_name: 'Satterfield')
        @project = FactoryBot.create(:project, title: 'Title 1', user: @user1)
        @user2 = FactoryBot.create(:user, email: 'leif.kozey@bruen.org')
    end
    it 'sends an email to project creator about new member' 

end
end

