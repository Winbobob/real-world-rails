require 'rails_helper'

describe API do
  let(:api) {'http://api.localhost.com'}
  let(:user) { FactoryGirl.create :user }
  let(:api_key) { FactoryGirl.create :api_key, user: user}
  let(:encoded) { Base64.encode64("#{user.email}:#{api_key.key}") }
  let(:good_header) { {"Authorization": "Basic #{encoded}", "Accept-Version": "v1"} }
  
  describe 'Datacenters methods' do
    before :each do
      FactoryGirl.create :template # Includes creation of Location (datacenter)
    end

    it_behaves_like "api authentication", "datacenters"

    it 'returns all the datacenters' 


    it 'returns info about a particular datacenter' 

  end
end

