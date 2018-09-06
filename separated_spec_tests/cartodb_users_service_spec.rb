require 'spec_helper'
require 'carto_gears_api/users/users_service'

describe CartoGearsApi::Users::UsersService do
  describe '#logged_user' do
    module CartoDB; end

    let(:service) { CartoGearsApi::Users::UsersService.new }

    # This test is 100% bound to implementation. It's mostly a PoC for unit testing
    # within Gears and should not be used as an example.
    it 'returns the logged user based on subdomain and warden' 

  end
end

