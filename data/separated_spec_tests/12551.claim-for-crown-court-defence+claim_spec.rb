require 'rails_helper'

describe API::V1::ExternalUsers::Claim do
  include Rack::Test::Methods

  CLAIM_ENDPOINTS = %w(
    /api/external_users/claims
    /api/external_users/claims/validate

    /api/external_users/claims/final
    /api/external_users/claims/final/validate

    /api/external_users/claims/interim
    /api/external_users/claims/interim/validate

    /api/external_users/claims/transfer
    /api/external_users/claims/transfer/validate
  ).freeze

  describe 'Claim endpoints' do
    before(:all) do
      @declared_routes = []
      API::V1::Root.routes.each do |route|
        path = route.pattern.path
        @declared_routes << path.sub('(.:format)', '')
      end
    end

    CLAIM_ENDPOINTS.each do |endpoint|
      it "should expose #{endpoint}" 

    end
  end

  describe 'Support versioning via header' do
    it 'should return 406 Not Acceptable if requested API version via header is not supported' 

  end
end

