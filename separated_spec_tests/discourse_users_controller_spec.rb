require 'rails_helper'
require_dependency 'single_sign_on'

describe Admin::UsersController do

  it 'is a subclass of AdminController' 


  context 'while logged in as an admin' do
    before do
      @user = log_in(:admin)
    end

    context '#index' do
      it 'returns success' 


      it 'returns JSON' 


      context 'when showing emails' do

        it "returns email for all the users" 


        it "logs only 1 enty" 


      end
    end

    describe '#show' do
      context 'an existing user' do
        it 'returns success' 

      end

      context 'an existing user' do
        it 'returns success' 

      end
    end

    context '#approve_bulk' do

      let(:evil_trout) { Fabricate(:evil_trout) }

      it "does nothing without uesrs" 


      it "won't approve the user when not allowed" 


      it "approves the user when permitted" 


    end

    context '#generate_api_key' do
      let(:evil_trout) { Fabricate(:evil_trout) }

      it 'calls generate_api_key' 

    end

    context '#revoke_api_key' do

      let(:evil_trout) { Fabricate(:evil_trout) }

      it 'calls revoke_api_key' 


    end

    context '#approve' do

      let(:evil_trout) { Fabricate(:evil_trout) }

      it "raises an error when the user doesn't have permission" 


      it 'calls approve' 


    end

    context '#suspend' do
      let(:user) { Fabricate(:evil_trout) }

      it "works properly" 


      context "with an associated post" do
        let(:post) { Fabricate(:post) }
        let(:suspend_params) do
          { user_id: user.id,
            suspend_until: 5.hours.from_now,
            reason: "because of this post",
            post_id: post.id,
            format: :json }
        end

        it "can have an associated post" 


        it "can delete an associated post" 


        it "can edit an associated post" 

      end

      it "can send a message to the user" 


      it "also revoke any api keys" 


    end

    context '#revoke_admin' do
      before do
        @another_admin = Fabricate(:admin)
      end

      it 'raises an error unless the user can revoke access' 


      it 'updates the admin flag' 

    end

    context '#grant_admin' do
      before do
        @another_user = Fabricate(:coding_horror)
      end

      after do
        $redis.flushall
      end

      it "raises an error when the user doesn't have permission" 


      it "returns a 404 if the username doesn't exist" 


      it 'updates the admin flag' 

    end

    context '#add_group' do
      let(:user) { Fabricate(:user) }
      let(:group) { Fabricate(:group) }

      it 'adds the user to the group' 

    end

    context '#primary_group' do
      let(:group) { Fabricate(:group) }

      before do
        @another_user = Fabricate(:coding_horror)
      end

      it "raises an error when the user doesn't have permission" 


      it "returns a 404 if the user doesn't exist" 


      it "changes the user's primary group" 


      it "doesn't change primary group if they aren't a member of the group" 


      it "remove user's primary group" 

    end

    context '#trust_level' do
      before do
        @another_user = Fabricate(:coding_horror, created_at: 1.month.ago)
      end

      it "raises an error when the user doesn't have permission" 


      it "returns a 404 if the username doesn't exist" 


      it "upgrades the user's trust level" 


      it "raises no error when demoting a user below their current trust level (locks trust level)" 

    end

    describe '#revoke_moderation' do
      before do
        @moderator = Fabricate(:moderator)
      end

      it 'raises an error unless the user can revoke access' 


      it 'updates the moderator flag' 

    end

    context '#grant_moderation' do
      before do
        @another_user = Fabricate(:coding_horror)
      end

      it "raises an error when the user doesn't have permission" 


      it "returns a 404 if the username doesn't exist" 


      it 'updates the moderator flag' 

    end

    context '#reject_bulk' do
      let(:reject_me)     { Fabricate(:user) }
      let(:reject_me_too) { Fabricate(:user) }

      it 'does nothing without users' 


      it "won't delete users if not allowed" 


      it "reports successes" 


      context 'failures' do
        before do
          Guardian.any_instance.stubs(:can_delete_user?).returns(true)
        end

        it 'can handle some successes and some failures' 


        it 'reports failure due to a user still having posts' 

      end
    end

    context '#destroy' do
      let(:delete_me) { Fabricate(:user) }

      it "returns a 403 if the user doesn't exist" 


      context "user has post" do
        let(:topic) { create_topic(user: delete_me) }

        before do
          _post = create_post(topic: topic, user: delete_me)
        end

        it "returns an error" 


        it "doesn't return an error if delete_posts == true" 

      end

      it "deletes the user record" 

    end

    context 'activate' do
      before do
        @reg_user = Fabricate(:inactive_user)
      end

      it "returns success" 


      it "should confirm email even when the tokens are expired" 

    end

    context 'log_out' do
      before do
        @reg_user = Fabricate(:user)
      end

      it "returns success" 


      it "returns 404 when user_id does not exist" 

    end

    context 'silence' do
      before do
        @reg_user = Fabricate(:user)
      end

      it "raises an error when the user doesn't have permission" 


      it "returns a 403 if the user doesn't exist" 


      it "punishes the user for spamming" 


      it "can have an associated post" 


      it "will set a length of time if provided" 


      it "will send a message if provided" 

    end

    context 'unsilence' do
      before do
        @reg_user = Fabricate(:user)
      end

      it "raises an error when the user doesn't have permission" 


      it "returns a 403 if the user doesn't exist" 


      it "punishes the user for spamming" 

    end

    context 'ip-info' do

      it "uses ipinfo.io webservice to retrieve the info" 


    end

    context "delete_other_accounts_with_same_ip" do

      it "works" 


    end

    context ".invite_admin" do
      it "doesn't work when not via API" 


      it 'should invite admin' 


      it "doesn't send the email with send_email falsy" 

    end

    context 'remove_group' do
      it "also clears the user's primary group" 

    end
  end

  context '#sync_sso' do
    let(:sso) { SingleSignOn.new }
    let(:sso_secret) { "sso secret" }

    before do
      log_in(:admin)

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
end

