require 'rails_helper'
require 'discourse_ip_info'

RSpec.describe Admin::UsersController do
  let(:admin) { Fabricate(:admin) }
  let(:user) { Fabricate(:user) }

  it 'is a subclass of AdminController' 


  before do
    sign_in(admin)
  end

  describe '#index' do
    it 'returns success with JSON' 


    context 'when showing emails' do
      it "returns email for all the users" 


      it "logs only 1 enty" 

    end
  end

  describe '#show' do
    context 'an existing user' do
      it 'returns success' 

    end

    context 'a non-existing user' do
      it 'returns 404 error' 

    end
  end

  describe '#approve' do
    let(:evil_trout) { Fabricate(:evil_trout, approved: false) }

    it "raises an error when the user doesn't have permission" 


    it 'calls approve' 

  end

  describe '#approve_bulk' do
    let(:evil_trout) { Fabricate(:evil_trout, approved: false) }

    it "does nothing without uesrs" 


    it "won't approve the user when not allowed" 


    it "approves the user when permitted" 

  end

  describe '#generate_api_key' do
    it 'calls generate_api_key' 

  end

  describe '#revoke_api_key' do
    it 'calls revoke_api_key' 

  end

  describe '#suspend' do
    let(:post) { Fabricate(:post) }
    let(:suspend_params) do
      { suspend_until: 5.hours.from_now,
        reason: "because of this post",
        post_id: post.id }
    end

    it "works properly" 


    context "with an associated post" do
      it "can have an associated post" 


      it "can delete an associated post" 


      it "can edit an associated post" 

    end

    it "can send a message to the user" 


    it "also revokes any api keys" 

  end

  describe '#revoke_admin' do
    let(:another_admin) { Fabricate(:admin) }

    it 'raises an error unless the user can revoke access' 


    it 'updates the admin flag' 

  end

  describe '#grant_admin' do
    let(:another_user) { Fabricate(:coding_horror) }

    after do
      $redis.flushall
    end

    it "raises an error when the user doesn't have permission" 


    it "returns a 403 if the username doesn't exist" 


    it 'updates the admin flag' 

  end

  describe '#add_group' do
    let(:group) { Fabricate(:group) }

    it 'adds the user to the group' 

  end

  describe '#remove_group' do
    it "also clears the user's primary group" 

  end

  describe '#trust_level' do
    let(:another_user) { Fabricate(:coding_horror, created_at: 1.month.ago) }

    it "raises an error when the user doesn't have permission" 


    it "returns a 422 if the username doesn't exist" 


    it "upgrades the user's trust level" 


    it "raises no error when demoting a user below their current trust level (locks trust level)" 

  end

  describe '#grant_moderation' do
    let(:another_user) { Fabricate(:coding_horror) }

    it "raises an error when the user doesn't have permission" 


    it "returns a 403 if the username doesn't exist" 


    it 'updates the moderator flag' 

  end

  describe '#revoke_moderation' do
    let(:moderator) { Fabricate(:moderator) }

    it 'raises an error unless the user can revoke access' 


    it 'updates the moderator flag' 

  end

  describe '#primary_group' do
    let(:group) { Fabricate(:group) }
    let(:another_user) { Fabricate(:coding_horror) }
    let(:another_group) { Fabricate(:group, title: 'New') }

    it "raises an error when the user doesn't have permission" 


    it "returns a 404 if the user doesn't exist" 


    it "changes the user's primary group" 


    it "doesn't change primary group if they aren't a member of the group" 


    it "remove user's primary group" 


    it "updates user's title when it matches the previous primary group title" 


    it "doesn't update user's title when it does not match the previous primary group title" 

  end

  describe '#destroy' do
    let(:delete_me) { Fabricate(:user) }

    it "returns a 403 if the user doesn't exist" 


    context "user has post" do
      let(:topic) { Fabricate(:topic, user: delete_me) }
      let!(:post) { Fabricate(:post, topic: topic, user: delete_me) }

      it "returns an api response that the user can't be deleted because it has posts" 


      it "doesn't return an error if delete_posts == true" 

    end

    it "deletes the user record" 

  end

  describe '#activate' do
    let(:reg_user) { Fabricate(:inactive_user) }

    it "returns success" 


    it "should confirm email even when the tokens are expired" 

  end

  describe '#log_out' do
    let(:reg_user) { Fabricate(:user) }

    it "returns success" 


    it "returns 404 when user_id does not exist" 

  end

  describe '#silence' do
    let(:reg_user) { Fabricate(:user) }

    it "raises an error when the user doesn't have permission" 


    it "returns a 403 if the user doesn't exist" 


    it "punishes the user for spamming" 


    it "can have an associated post" 


    it "will set a length of time if provided" 


    it "will send a message if provided" 

  end

  describe '#unsilence' do
    let(:reg_user) { Fabricate(:user, silenced_till: 10.years.from_now) }

    it "raises an error when the user doesn't have permission" 


    it "returns a 403 if the user doesn't exist" 


    it "unsilences the user" 

  end

  describe '#reject_bulk' do
    let(:reject_me)     { Fabricate(:user) }
    let(:reject_me_too) { Fabricate(:user) }

    it 'does nothing without users' 


    it "won't delete users if not allowed" 


    it "reports successes" 


    context 'failures' do
      it 'can handle some successes and some failures' 


      it 'reports failure due to a user still having posts' 

    end
  end

  describe '#ip_info' do
    it "retrieves IP info" 

  end

  describe '#delete_other_accounts_with_same_ip' do
    it "works" 

  end

  describe '#invite_admin' do
    let(:api_key) { Fabricate(:api_key, user: admin, key: SecureRandom.hex) }
    let(:api_params) do
      { api_key: api_key.key, api_username: admin.username }
    end

    it "doesn't work when not via API" 


    it 'should invite admin' 


    it "doesn't send the email with send_email falsey" 

  end

  describe '#sync_sso' do
    let(:sso) { SingleSignOn.new }
    let(:sso_secret) { "sso secret" }

    before do
      SiteSetting.email_editable = false
      SiteSetting.sso_url = "https://www.example.com/sso"
      SiteSetting.enable_sso = true
      SiteSetting.sso_overrides_email = true
      SiteSetting.sso_overrides_name = true
      SiteSetting.sso_overrides_username = true
      SiteSetting.sso_secret = sso_secret
      sso.sso_secret = sso_secret
    end

    it 'can sync up with the sso' 


    it 'should create new users' 


    it 'should return the right message if the record is invalid' 

  end

  describe '#disable_second_factor' do
    let(:second_factor) { user.create_totp }
    let(:second_factor_backup) { user.generate_backup_codes }

    describe 'as an admin' do
      before do
        sign_in(admin)
        second_factor
        second_factor_backup
        expect(user.reload.user_second_factors.totp).to eq(second_factor)
      end

      it 'should able to disable the second factor for another user' 


      it 'should not be able to disable the second factor for the current user' 


      describe 'when user does not have second factor enabled' do
        it 'should raise the right error' 

      end
    end
  end

  describe "#penalty_history" do
    let(:moderator) { Fabricate(:moderator) }
    let(:logger) { StaffActionLogger.new(admin) }

    it "doesn't allow moderators to clear a user's history" 


    def find_logs(action)
      UserHistory.where(target_user_id: user.id, action: UserHistory.actions[action])
    end

    it "allows admins to clear a user's history" 


  end

end

