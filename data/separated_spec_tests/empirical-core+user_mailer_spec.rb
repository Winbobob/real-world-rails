require 'rails_helper'

describe UserMailer do

  describe 'welcome_email' do
    let(:user) { build(:user) }
    let(:mail) { described_class.welcome_email(user) }

    it 'should set the subject, receiver and the sender' 

  end

  describe 'invitation_to_non_existing_user' do
    let(:invitation_hash) { { "inviter_name" => "test", "inviter_email" => "inviter@test.com", "invitee_email" => "invitee@test.com", classroom_names: ["classroom1"] } }
    let(:mail) { described_class.invitation_to_non_existing_user(invitation_hash) }

    it 'should set the subject, reply_to, receiver and the sender' 

  end

  describe 'invitation_to_existing_user' do
    let(:invitation_hash) { { "inviter_name" => "test", "inviter_email" => "inviter@test.com", "invitee_email" => "invitee@test.com", classroom_names: ["classroom1"] } }
    let(:mail) { described_class.invitation_to_existing_user(invitation_hash) }

    it 'should set the subject, reply_to, receiver and the sender' 

  end

  describe 'password_reset_email' do
    let!(:user) { create(:user) }

    it 'should set the subject, receiver and the sender' 

  end

  describe 'account_created_email' do
    let(:user) { build(:user) }
    let(:mail) { described_class.account_created_email(user, "test123", "admin") }

    it 'should set the subject, receiver and the sender' 

  end

  describe 'join_school_email' do
    let(:user) { build(:user) }
    let(:school) { build(:school) }
    let(:mail) { described_class.join_school_email(user, school) }

    it 'should set the subject, receiver and the sender' 

  end

  describe 'lesson_plan_email' do
    let(:user) { build(:user) }
    let(:lesson) { build(:lesson) }
    let(:unit) { build(:unit) }
    let(:mail) { described_class.lesson_plan_email(user, [lesson], unit) }

    it 'should set the subject, receiver and the sender' 

  end

  describe 'premium_user_subscription_email' do
    let(:user) { build(:user) }
    let(:mail) { described_class.premium_user_subscription_email(user) }

    it 'should set the subject, receiver and the sender' 

  end

  describe 'premium_school_subscription_email' do
    let(:admin) { build(:admin) }
    let(:school) { build(:school) }
    let(:user) { build(:admin) }
    let(:mail) { described_class.premium_school_subscription_email(user, school, admin) }

    it 'should set the subject, receiver and the sender' 

  end

  describe 'new_admin_email' do
    let(:user) { build(:user) }
    let(:school) { build(:school) }
    let(:mail) { described_class.new_admin_email(user, school) }

    it 'should set the subject, receiver and the sender' 

  end

  describe 'premium_missing_school_email' do
    let(:user) { build(:user) }
    let(:mail) { described_class.premium_missing_school_email(user) }

    it 'should set the subject, receiver and the sender' 

  end
end

