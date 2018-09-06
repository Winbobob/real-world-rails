require 'rails_helper'

describe Identities::SlackController do
  let(:user) { create :user }

  describe 'authorized' do
    let!(:group) { create :formal_group }
    let(:group_identity) { create :group_identity, group: group, identity: identity, slack_channel_id: "C123" }
    let(:identity) { create :slack_identity, user: nil }

    it 'renders the slack authorized page' 


    it 'spawns a user from the session' 


    it 'associates with the current user if one is already logged in' 

  end

  describe 'install' do
    let(:identity) { create :slack_identity, user: user }

    it 'boots the app if an identity exists' 


    it 'boots the app if a pending identity exists' 


    it 'redirects to oauth path if no identity can be found' 

  end

  describe 'participate' do
    let(:group) { create :formal_group }
    let(:discussion) { create :discussion, group: group }
    let(:poll) { create :poll_proposal, discussion: discussion }
    let(:identity) { create :slack_identity, user: user, uid: "U123" }
    let(:dangling_identity) { create :slack_identity, user: nil, uid: "U123" }
    let(:payload) { {
      user: { id: identity.uid },
      callback_id: poll.id,
      token: ENV['SLACK_VERIFICATION_TOKEN'],
      actions: [{ name: poll.poll_options.first.name }],
      team: { id: 'T123', name: 'billsbarbies' }
    } }
    let(:payload_without_poll) { {
      user: { id: identity.uid },
      callback_id: 'notapoll',
      token: ENV['SLACK_VERIFICATION_TOKEN'],
      actions: [{ name: poll.poll_options.first.name }],
      team: { id: 'T123', name: 'billsbarbies' }
    } }
    let(:payload_without_user) { {
      user: { id: 'notauser' },
      callback_id: poll.id,
      token: ENV['SLACK_VERIFICATION_TOKEN'],
      actions: [{ name: poll.poll_options.first.name }],
      team: { id: 'T123', name: 'billsbarbies' }
    } }
    let(:bad_payload) { {
      user: { id: identity.uid },
      callback_id: poll.id,
      token: ENV['SLACK_VERIFICATION_TOKEN'],
      actions: [],
      team: {}
    } }
    let(:user) { create :user }
    let(:another_user) { create :user }

    it 'creates a stance' 


    it 'adds the user to the group' 


    describe 'with verification token set' do
      before { ENV['SLACK_VERIFICATION_TOKEN'] = 'sometoken' }
      after  { ENV['SLACK_VERIFICATION_TOKEN'] = nil }

      it 'responds correctly when verification token is supplied' 


      it 'responds with bad request when no token is supplied' 

    end

    it 'responds when no poll is found' 


    it 'does not create an invalid stance' 


    it 'responds with a stance if poll is part of a group' 


    xit 'responds with an auth link if poll is not part of a group' do
      poll.update(discussion: nil, group: nil)
      sign_in user
      expect { post :participate, params: { payload: payload.to_json } }.to_not change { poll.stances.count }
      expect(response.status).to eq 200
    end

    it 'finds the identity associated with a user if it exists' 


    it 'responds with unauthorized message if no user is found' 


    it 'responds with a message if the poll is closed' 

  end

  describe 'initiate' do
    let(:initiate_params) { {
      text: "proposal let's get started",
      channel_id: group_identity.slack_channel_id,
      team_id: identity.slack_team_id,
      team_domain: "example"
    } }
    let(:group) { create :formal_group }
    let(:identity) { create :slack_identity, custom_fields: { slack_team_id: "T123" } }
    let(:group_identity) { create(:group_identity, group: group, identity: identity, custom_fields: {
      slack_channel_id: "C123",
      slack_channel_name: "channel"
    }) }

    it 'responds with a poll creation url when an associated group is found' 


    it 'responds with help for a bad poll type' 


    it 'responds with an unknown channel message if a group is found in the slack team' 


    it 'responds with an unauthorized message if no integration is found' 

  end

  describe 'create' do
    let(:user) { create :user }
    let(:invalid_oauth) { controller.stub(identity_params: {}) }
    let(:valid_oauth) { controller.stub(identity_params: identity_params) }
    let(:identity_params) { {
      access_token: 'token',
      email: "bob@builder.com",
      name: "Bob the BUilder",
      uid: "U123"
    } }
    before { controller.stub(complete_identity: nil) }

    it 'creates a new identity' 


    it 'redirects to the session back_to if present' 


    it 'assigns a new identity to the session if an existing user cannot be found' 


    it 'associates the current user if already logged in' 


    it 'associates a user by email if one is found' 


    it 'does not create an invalid identity for an existing user' 


    it 'does not create a new user if the identity is invalid' 

  end

  describe 'destroy' do
    let(:user) { create :user }
    let(:identity) { create :slack_identity, user: user }
    let(:another_user) { create :user }
    let(:another_identity) { create :slack_identity, user: another_user }
    let(:referrer) { 'http://example.com' }

    it 'destroys an identity' 


    it 'redirects to the referrer if present' 


    it 'does nothing if no identity is present' 


    it 'does nothing for logged out users' 

  end
end

