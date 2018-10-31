require 'spec_helper'

describe OrganizationUpdatedWorker do
  let(:organization) { create(:organization) }
  let!(:webhook) { create(:webhook_endpoint, organization: organization, username: 'foo', password: 'bar', url: 'https://google.com/')}

  describe 'perform' do
    it 'should accept a request' 

  end
end

