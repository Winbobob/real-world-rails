=begin
RSpec.describe Api::OauthCredentialsController do
  describe 'GET #me (integrated)', :type => :request do
    let!(:application) {
      Doorkeeper::Application.create!(
        name: 'MyApp',
        redirect_uri: 'https://app.com')
      }
    let!(:participant) { create :participant }
    let!(:token) {
      Doorkeeper::AccessToken.create!(
        application_id: application.id,
        resource_owner_id: participant.id,
        scopes: 'public') }

    it 'responds with 200' 


    it 'returns the participant as json' 

  end

  describe 'GET #user (stubbed)' do
    let(:token) { double(
      token: 'some-token',
      accessible?: true,
      acceptable?: true,
      revoked?: false,
      expired?: false) }
    let(:participant)  { double(to_json: '{}') }

    before do
      allow(controller).to receive(:doorkeeper_token) { token }
      allow(controller).to receive(:current_resource_owner) { participant }
    end

    it 'responds with 200' 


    it 'responds with 401 when unauthorized' 


    it 'returns the participant as json' 

  end
end
=end

