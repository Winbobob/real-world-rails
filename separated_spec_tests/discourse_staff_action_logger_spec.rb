require 'rails_helper'

describe StaffActionLogger do

  let(:admin)  { Fabricate(:admin) }
  let(:logger) { described_class.new(admin) }

  describe 'new' do
    it 'raises an error when user is nil' 


    it 'raises an error when user is not a User' 

  end

  describe 'log_user_deletion' do
    let(:deleted_user) { Fabricate(:user) }

    subject(:log_user_deletion) { described_class.new(admin).log_user_deletion(deleted_user) }

    it 'raises an error when user is nil' 


    it 'raises an error when user is not a User' 


    it 'creates a new UserHistory record' 

  end

  describe "log_show_emails" do
    it "logs the user history" 


    it "doesn't raise an exception with nothing to log" 


    it "doesn't raise an exception with nil input" 

  end

  describe 'log_post_deletion' do
    let(:deleted_post) { Fabricate(:post) }

    subject(:log_post_deletion) { described_class.new(admin).log_post_deletion(deleted_post) }

    it 'raises an error when post is nil' 


    it 'raises an error when post is not a Post' 


    it 'creates a new UserHistory record' 


    it 'does not explode if post does not have a user' 

  end

  describe 'log_topic_delete_recover' do
    let(:topic) { Fabricate(:topic) }

    context "when deleting topic" do
      subject(:log_topic_delete_recover) { described_class.new(admin).log_topic_delete_recover(topic) }

      it 'raises an error when topic is nil' 


      it 'raises an error when topic is not a Topic' 


      it 'creates a new UserHistory record' 

    end

    context "when recovering topic" do
      subject(:log_topic_delete_recover) { described_class.new(admin).log_topic_delete_recover(topic, "recover_topic") }

      it 'raises an error when topic is nil' 


      it 'raises an error when topic is not a Topic' 


      it 'creates a new UserHistory record' 

    end
  end

  describe 'log_trust_level_change' do
    let(:user) { Fabricate(:user) }
    let(:old_trust_level) { TrustLevel[0] }
    let(:new_trust_level) { TrustLevel[1] }

    subject(:log_trust_level_change) { described_class.new(admin).log_trust_level_change(user, old_trust_level, new_trust_level) }

    it 'raises an error when user or trust level is nil' 


    it 'raises an error when user is not a User' 


    it 'raises an error when new trust level is not a Trust Level' 


    it 'creates a new UserHistory record' 

  end

  describe "log_site_setting_change" do
    it "raises an error when params are invalid" 


    it "creates a new UserHistory record" 

  end

  describe "log_theme_change" do

    it "raises an error when params are invalid" 


    let :theme do
      Theme.new(name: 'bob', user_id: -1)
    end

    it "logs new site customizations" 


    it "logs updated site customizations" 

  end

  describe "log_theme_destroy" do
    it "raises an error when params are invalid" 


    it "creates a new UserHistory record" 

  end

  describe "log_site_text_change" do
    it "raises an error when params are invalid" 


    it "creates a new UserHistory record" 

  end

  describe "log_user_suspend" do
    let(:user) { Fabricate(:user, suspended_at: 10.minutes.ago, suspended_till: 1.day.from_now) }

    it "raises an error when arguments are missing" 


    it "reason arg is optional" 


    it "creates a new UserHistory record" 

  end

  describe "log_user_unsuspend" do
    let(:user) { Fabricate(:user, suspended_at: 1.day.ago, suspended_till: 7.days.from_now) }

    it "raises an error when argument is missing" 


    it "creates a new UserHistory record" 

  end

  describe "log_badge_grant" do
    let(:user) { Fabricate(:user) }
    let(:badge) { Fabricate(:badge) }
    let(:user_badge) { BadgeGranter.grant(badge, user) }

    it "raises an error when argument is missing" 


    it "creates a new UserHistory record" 

  end

  describe "log_badge_revoke" do
    let(:user) { Fabricate(:user) }
    let(:badge) { Fabricate(:badge) }
    let(:user_badge) { BadgeGranter.grant(badge, user) }

    it "raises an error when argument is missing" 


    it "creates a new UserHistory record" 

  end

  describe 'log_roll_up' do
    let(:subnets) { ["1.2.3.0/24", "42.42.42.0/24"] }
    subject(:log_roll_up) { described_class.new(admin).log_roll_up(subnets) }

    it 'creates a new UserHistory record' 

  end

  describe 'log_custom' do
    it "raises an error when `custom_type` is missing" 


    it "creates the UserHistory record" 

  end

  describe 'log_category_settings_change' do
    let(:category) { Fabricate(:category, name: 'haha') }
    let(:category_group) { Fabricate(:category_group, category: category, permission_type: 1) }

    it "raises an error when category is missing" 


    it "creates new UserHistory records" 


    it "does not log permissions changes for category visible to everyone" 

  end

  describe 'log_category_deletion' do
    let(:parent_category) { Fabricate(:category) }
    let(:category) { Fabricate(:category, parent_category: parent_category) }

    it "raises an error when category is missing" 


    it "creates a new UserHistory record" 

  end

  describe 'log_category_creation' do
    let(:category) { Fabricate(:category) }

    it "raises an error when category is missing" 


    it "creates a new UserHistory record" 

  end

  describe 'log_lock_trust_level' do
    let(:user) { Fabricate(:user) }

    it "raises an error when argument is missing" 


    it "creates a new UserHistory record" 

  end

  describe 'log_user_activate' do
    let(:user) { Fabricate(:user) }

    it "raises an error when argument is missing" 


    it "creates a new UserHistory record" 

  end

  describe '#log_readonly_mode' do
    it "creates a new record" 

  end

  describe 'log_check_personal_message' do
    let(:personal_message) { Fabricate(:private_message_topic) }

    subject(:log_check_personal_message) { described_class.new(admin).log_check_personal_message(personal_message) }

    it 'raises an error when topic is nil' 


    it 'raises an error when topic is not a Topic' 


    it 'creates a new UserHistory record' 

  end

  describe 'log_post_approved' do
    let(:approved_post) { Fabricate(:post) }

    subject(:log_post_approved) { described_class.new(admin).log_post_approved(approved_post) }

    it 'raises an error when post is nil' 


    it 'raises an error when post is not a Post' 


    it 'creates a new UserHistory record' 

  end
end

