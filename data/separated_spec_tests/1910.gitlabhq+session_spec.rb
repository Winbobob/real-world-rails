require 'spec_helper'

describe Mattermost::Session, type: :request do
  include ExclusiveLeaseHelpers

  let(:user) { create(:user) }

  let(:gitlab_url) { "http://gitlab.com" }
  let(:mattermost_url) { "http://mattermost.com" }

  subject { described_class.new(user) }

  # Needed for doorkeeper to function
  it { is_expected.to respond_to(:current_resource_owner) }
  it { is_expected.to respond_to(:request) }
  it { is_expected.to respond_to(:authorization) }
  it { is_expected.to respond_to(:strategy) }

  before do
    subject.base_uri = mattermost_url
  end

  describe '#with session' do
    let(:location) { 'http://location.tld' }
    let(:cookie_header) {'MMOAUTH=taskik8az7rq8k6rkpuas7htia; Path=/;'}
    let!(:stub) do
      WebMock.stub_request(:get, "#{mattermost_url}/oauth/gitlab/login")
        .to_return(headers: { 'location' => location, 'Set-Cookie' => cookie_header }, status: 302)
    end

    context 'without oauth uri' do
      it 'makes a request to the oauth uri' 

    end

    context 'with oauth_uri' do
      let!(:doorkeeper) do
        Doorkeeper::Application.create(
          name: 'GitLab Mattermost',
          redirect_uri: "#{mattermost_url}/signup/gitlab/complete\n#{mattermost_url}/login/gitlab/complete",
          scopes: '')
      end

      context 'without token_uri' do
        it 'can not create a session' 

      end

      context 'with token_uri' do
        let(:state) { "state" }
        let(:params) do
          { response_type: "code",
            client_id: doorkeeper.uid,
            redirect_uri: "#{mattermost_url}/signup/gitlab/complete",
            state: state }
        end
        let(:location) do
          "#{gitlab_url}/oauth/authorize?#{URI.encode_www_form(params)}"
        end

        before do
          WebMock.stub_request(:get, "#{mattermost_url}/signup/gitlab/complete")
            .with(query: hash_including({ 'state' => state }))
            .to_return do |request|
              post "/oauth/token",
                client_id: doorkeeper.uid,
                client_secret: doorkeeper.secret,
                redirect_uri: params[:redirect_uri],
                grant_type: 'authorization_code',
                code: request.uri.query_values['code']

              if response.status == 200
                { headers: { 'token' => 'thisworksnow' }, status: 202 }
              end
            end

          WebMock.stub_request(:post, "#{mattermost_url}/api/v4/users/logout")
            .to_return(headers: { Authorization: 'token thisworksnow' }, status: 200)
        end

        it 'can set up a session' 


        it 'returns the value of the block' 

      end
    end

    context 'exclusive lease' do
      let(:lease_key) { 'mattermost:session' }

      it 'tries to obtain a lease' 


      it 'returns a NoSessionError error without lease' 

    end
  end
end

