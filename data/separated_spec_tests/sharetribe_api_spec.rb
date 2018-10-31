require "spec_helper"

describe AnalyticService::API::Api do
  let(:community) { FactoryGirl.create(:community) }
  let(:person) do
    person = FactoryGirl.create(:person, community: community, is_admin: true)
    FactoryGirl.create(:community_membership, community: community, person: person, admin: true)
    person
  end

  context 'intercom' do
    before do
      APP_CONFIG.admin_intercom_app_id = '123'
      APP_CONFIG.admin_intercom_access_token = 'ABC'
    end

    it '#send_event' 


    it '#send_incremental_properties' 

  end
end


