require 'spec_helper'
include Calendar

describe Calendar do
  let!(:user) do
    create(:user, first_name: 'John', last_name: 'Doe', email: 'johndoe@example.com',
   refresh_token: '456')
  end
  before do
    allow(AppConfig).to receive(:google_client_id).and_return('789')
    allow(AppConfig).to receive(:google_secret).and_return('a99')
    allow(AppConfig).to receive(:calendar_id).and_return('1')
  end

  describe '#initialize_client' do
    before { initialize_client(user) }

    it 'initialize new client' 

  end
end

