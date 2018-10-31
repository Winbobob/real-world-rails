#
# Copyright (C) 2011 - present Instructure, Inc.
#
# This file is part of Canvas.
#
# Canvas is free software: you can redistribute it and/or modify it under
# the terms of the GNU Affero General Public License as published by the Free
# Software Foundation, version 3 of the License.
#
# Canvas is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
# details.
#
# You should have received a copy of the GNU Affero General Public License along
# with this program. If not, see <http://www.gnu.org/licenses/>.
#

require File.expand_path(File.dirname(__FILE__) + '/../sharding_spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../apis/api_spec_helper')

describe CommunicationChannelsController do
  before :once do
    user_with_pseudonym(:active_user => true)
  end

  describe "POST 'create'" do
    before(:once) { user_model }

    it "should create a new CC unconfirmed" 


    it "should create a new CC regardless of conflicts" 


    it "should resurrect retired CCs" 


    it "should not allow duplicate active CCs for a single user" 

  end

  describe "GET 'confirm'" do
    context "add CC to existing user" do
      before(:once) { user_with_pseudonym(active_user: 1) }

      it "should confirm an unconfirmed CC" 


      it "should redirect to login when trying to confirm" 


      it "should require the correct user to confirm a cc" 


      it "should not confirm an already-confirmed CC with a registered user" 


      it "does not confirm invalid email addresses" 


      it "should confirm an already-confirmed CC with a pre-registered user" 

    end

    describe "open registration" do
      before :once do
        @account = Account.create!
        course_factory(active_all: true, :account => @account)
        user_factory
      end

      it "should show a pre-registered user the confirmation form" 


      it "should finalize registration for a pre-registered user" 


      it "should not break when trying to register when psuedonym is not a valid email" 


      it "should properly validate pseudonym for a pre-registered user" 


      it "should not forget the account when registering for a non-default account" 


      it "should figure out the correct domain when registering" 


      it "should not finalize registration for invalid parameters" 


      it "should show the confirm form for a creation_pending user" 


      it "should register creation_pending user" 


      it "should show the confirm form for a creation_pending user that's logged in (masquerading)" 


      it "should register creation_pending user that's logged in (masquerading)" 


      it "should prepare to register a creation_pending user in the correct account" 


      it "should register creation_pending user in the correct account" 


      it "should prepare to register a creation_pending user in the correct account (admin)" 


      it "should register creation_pending user in the correct account (admin)" 


      it "should show the confirm form for old creation_pending users that have a pseudonym" 


      it "should work for old creation_pending users that have a pseudonym" 


      it "should allow the user to pick a new pseudonym if a conflict already exists" 


      it "should force the user to provide a unique_id if a conflict already exists" 

    end

    describe "merging" do
      before :once do
        @account1 = Account.create!(:name => 'A')
        @account2 = Account.create!(:name => 'B')
      end

      it "should prepare to merge with an already-logged-in user" 


      it "should merge with an already-logged-in user" 


      it "should not allow merging with someone that's observed through a UserObserver relationship" 


      it "should not allow merging with someone that's observing through a UserObserver relationship" 


      it "should not allow merging with someone that's not a merge opportunity" 


      it "should show merge opportunities for active users" 


      it "should not show users that can't have a pseudonym created for the correct account" 


      it "should create a pseudonym in the target account by copying an existing pseudonym when merging" 


      it "should include all pseudonyms if there are multiple" 


      it "should only include the current account's pseudonym if there are multiple" 

    end

    describe "invitations" do
      before(:once) { course_with_student(:active_course => 1) }

      it "should prepare to accept an invitation when creating a new user" 


      it "should accept an invitation when creating a new user" 


      it "should reject pseudonym unique_id changes when creating a new user" 


      it "should preview acceptance of an invitation when merging with the current user" 


      it "should accept an invitation when merging with the current user" 


      it "should prepare to transfer an enrollment to a different user" 


      it "should transfer an enrollment to a different user" 

    end

    it "should uncache user's cc's when confirming a CC" 

  end

  describe "POST 'reset_bounce_count'" do
    it 'should allow siteadmins to reset the bounce count' 


    it 'should not allow account admins to reset the bounce count' 

  end

  context 'bulk actions' do

    def included_channels
      CSV.parse(response.body).drop(1).map do |row|
        CommunicationChannel.find(row[2])
      end
    end

    describe "GET 'bouncing_channel_report'" do
      def channel_csv(cc)
        [
          cc.user.id.try(:to_s),
          cc.user.name,
          cc.id.try(:to_s),
          cc.path_type,
          cc.path_description,
          cc.last_bounce_at.try(:to_s),
          cc.last_bounce_summary.try(:to_s)
        ]
      end

      context 'as a site admin' do
        before do
          account_admin_user(account: Account.site_admin)
          user_session(@user)
        end

        it 'fetches communication channels in this account and orders by date' 


        it 'ignores communication channels in other accounts' 


        it "only reports active, bouncing communication channels" 


        it 'uses the requested account' 


        it 'filters by date' 


        it 'filters by pattern, and case insensitively' 


        it 'limits to CommunicationChannel::BulkActions::ResetBounceCounts.bulk_limit' 

      end

      context 'as a normal user' do
        it "doesn't work" 

      end
    end

    describe "POST 'bulk_reset_bounce_counts'" do
      context 'as a site admin' do
        before do
          account_admin_user(account: Account.site_admin)
          user_session(@user)
        end

        it 'resets bounce counts' 


        it 'filters by date' 


        it 'filters by pattern' 


        it 'respects the BULK_LIMIT' 

      end

      context 'as a normal user' do
        it "doesn't work" 

      end
    end

    context 'unconfirmed channels' do
      context 'as a siteadmin' do
        before do
          account_admin_user(account: Account.site_admin)
          user_session(@user)

          user_with_pseudonym

          @c1 = @user.communication_channels.create!(path: 'foo@example.com', path_type: 'email') do |cc|
            cc.workflow_state = 'unconfirmed'
          end
          @c2 = @user.communication_channels.create!(path: 'bar@example.com', path_type: 'email') do |cc|
            cc.workflow_state = 'unconfirmed'
          end
          @c3 = @user.communication_channels.create!(path: 'baz@example.com', path_type: 'email') do |cc|
            cc.workflow_state = 'active'
          end
          @c4 = @user.communication_channels.create!(path: 'qux@example.com', path_type: 'email') do |cc|
            cc.workflow_state = 'unconfirmed'
          end
          CommunicationChannel.where(id: @c4).update_all(path: 'qux@.')
          @c5 = @user.communication_channels.create!(path: '+18015550100', path_type: 'sms') do |cc|
            cc.workflow_state = 'unconfirmed'
          end
        end

        context "GET 'unconfirmed_channel_report'" do
          it 'reports channels' 


          it 'filters by path type' 

        end

        context "POST 'bulk_confirm'" do
          it 'confirms channels' 


          it 'excludes channels with invalid paths' 


          it 'includes channels with invalid paths if requested' 

        end
      end

      context 'as a normal user' do
        before do
          user_with_pseudonym
          user_session(@user)
        end

        context "GET 'unconfirmed_channel_report'" do
          it "doesn't work" 

        end

        context "POST 'bulk_confirm'" do
          it "doesn't work" 

        end
      end
    end
  end

  context "re-sending confirmations" do
    it "should re-send communication channel invitation for an invited channel" 


    it "should require a logged-in user" 


    it "should require self to be logged in to re-send (without enrollment)" 


    it "should allow an account admin to re-send" 


    it "should re-send enrollment invitation for an invited user" 


    it "should require an admin with rights in the course" 


    context "cross-shard user" do
      specs_require_sharding
      it "should re-send enrollment invitation for a cross-shard user" 

    end
  end

  it "should uncache user's cc's when retiring a CC" 


  it "should not delete a required institutional channel" 


  context 'push token deletion' do
    let(:sns_response) { double(:[] => {endpoint_arn: 'endpointarn'}, attributes: {endpoint_arn: 'endpointarn'}) }
    let(:sns_client) { double(create_platform_endpoint: sns_response, get_endpoint_attributes: sns_response) }
    let(:sns_developer_key_sns_field) { sns_client }

    let(:sns_developer_key) do
      allow(DeveloperKey).to receive(:sns).and_return(sns_developer_key_sns_field)
      dk = DeveloperKey.default
      dk.sns_arn = 'apparn'
      dk.save!
      dk
    end

    let(:sns_access_token) { @user.access_tokens.create!(developer_key: sns_developer_key) }
    let(:sns_channel) { @user.communication_channels.create(path_type: CommunicationChannel::TYPE_PUSH, path: 'push') }

    it 'should 404 if there is no communication channel', type: :request do
      status = raw_api_call(:delete, "/api/v1/users/self/communication_channels/push",
                        {controller: 'communication_channels', action: 'delete_push_token', format: 'json',
                         push_token: 'notatoken'}, {push_token: 'notatoken'})
      expect(status).to eq(404)
    end

    it 'should delete a push_token', type: :request do
      fake_token = 'insttothemoon'
      sns_access_token.notification_endpoints.create!(token: fake_token)
      sns_channel

      json = api_call(:delete, "/api/v1/users/self/communication_channels/push",
        {controller: 'communication_channels', action: 'delete_push_token', format: 'json',
        push_token: fake_token}, {push_token: fake_token})
      expect(json['success']).to eq true
      endpoints = @user.notification_endpoints.where("lower(token) = ?", fake_token)
      expect(endpoints.length).to eq 0
    end

    context 'has a push communication channel' do

      let(:sns_access_token) { @user.access_tokens.create!(developer_key: sns_developer_key) }
      let(:sns_channel) { @user.communication_channels.create(path_type: CommunicationChannel::TYPE_PUSH, path: 'push') }
      before(:each) { sns_channel }

      it 'shouldnt error if an endpoint does not exist for the push_token', type: :request do
        json = api_call(:delete, "/api/v1/users/self/communication_channels/push",
                      {controller: 'communication_channels', action: 'delete_push_token', format: 'json',
                       push_token: 'notatoken'}, {push_token: 'notatoken'})
        expect(json['success']).to eq true
      end

      context 'has a notification endpoint' do

        let(:fake_token) { 'insttothemoon' }
        before(:each) { sns_access_token.notification_endpoints.create!(token: fake_token) }

        it 'should delete a push_token', type: :request do
          json = api_call(:delete, "/api/v1/users/self/communication_channels/push",
                          {controller: 'communication_channels', action: 'delete_push_token', format: 'json',
                           push_token: fake_token}, {push_token: fake_token})
          expect(json['success']).to eq true
          endpoints = @user.notification_endpoints.where("lower(token) = ?", fake_token)
          expect(endpoints.length).to eq 0
        end

        it 'should only delete specified endpoint', type: :request do
          another_token = 'another'
          another_endpoint = sns_access_token.notification_endpoints.create!(token: another_token)

          api_call(:delete, "/api/v1/users/self/communication_channels/push",
                            {controller: 'communication_channels', action: 'delete_push_token', format: 'json',
                             push_token: fake_token}, {push_token: fake_token})
          expect(NotificationEndpoint.find(another_endpoint.id).workflow_state).to eq('active')
          expect(NotificationEndpoint.where(token: fake_token).take.workflow_state).to eq('deleted')
        end

        it 'should not delete the communication channel', type: :request do
          api_call(:delete, "/api/v1/users/self/communication_channels/push",
                          {controller: 'communication_channels', action: 'delete_push_token', format: 'json',
                           push_token: fake_token}, {push_token: fake_token})
          expect(CommunicationChannel.where(path: 'push').take).to be_truthy
        end

        it 'should delete all endpoints for the given token', type: :request do
          sns_access_token.notification_endpoints.create!(token: fake_token)
          api_call(:delete, "/api/v1/users/self/communication_channels/push",
                   {controller: 'communication_channels', action: 'delete_push_token', format: 'json',
                    push_token: fake_token}, {push_token: fake_token})
          expect(NotificationEndpoint.where(token: fake_token, workflow_state: 'deleted').length).to eq(2)
        end
      end
    end
  end
end

