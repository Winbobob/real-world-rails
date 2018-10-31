require 'spec_helper'

# oauth_discovery_keys      GET /oauth/discovery/keys(.:format)             doorkeeper/openid_connect/discovery#keys
# oauth_discovery_provider  GET /.well-known/openid-configuration(.:format) doorkeeper/openid_connect/discovery#provider
# oauth_discovery_webfinger GET /.well-known/webfinger(.:format)            doorkeeper/openid_connect/discovery#webfinger
describe Doorkeeper::OpenidConnect::DiscoveryController, 'routing' do
  it "to #provider" 


  it "to #webfinger" 


  it "to #keys" 

end

# oauth_userinfo GET  /oauth/userinfo(.:format) doorkeeper/openid_connect/userinfo#show
#                POST /oauth/userinfo(.:format) doorkeeper/openid_connect/userinfo#show
describe Doorkeeper::OpenidConnect::UserinfoController, 'routing' do
  it "to #show" 


  it "to #show" 

end

