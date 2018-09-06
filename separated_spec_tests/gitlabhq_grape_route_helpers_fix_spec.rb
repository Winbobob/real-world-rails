require 'spec_helper'
require_relative '../../config/initializers/grape_route_helpers_fix'

describe 'route shadowing' do
  include GrapeRouteHelpers::NamedRouteMatcher

  it 'does not occur' 

end

