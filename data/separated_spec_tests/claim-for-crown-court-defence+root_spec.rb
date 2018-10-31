require 'rails_helper'

describe API::V2::Root do
  include Rack::Test::Methods

  V2_ENDPOINTS = %w(
    /api/case_workers/claims
  ).freeze

  describe 'Endpoints' do
    before(:all) do
      @declared_routes = []
      API::V2::Root.routes.each do |route|
        path = route.pattern.path
        @declared_routes << path.sub('(.:format)', '')
      end
    end

    V2_ENDPOINTS.each do |endpoint|
      it "should expose #{endpoint}" 

    end
  end

  describe 'Support versioning via header' do
    it 'should return 406 Not Acceptable if requested API version via header is not supported' 

  end
end

