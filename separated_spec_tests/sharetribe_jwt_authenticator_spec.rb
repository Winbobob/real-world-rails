require 'active_support/all'
require 'uuidtools'
require 'possibly'
require 'jwt'

[
  "app/services/result",
  "app/utils/entity_utils",
  "app/utils/uuid_utils",
  "app/utils/jwt_utils",
  "app/utils/hash_utils",
  "app/utils/service_client/client",
  "app/utils/service_client/middleware/middleware_base",
  "app/utils/service_client/middleware/jwt_authenticator",
].each { |file| require_relative "../../../../#{file}" }

describe ServiceClient::Middleware::JwtAuthenticator do

  SECRET = "secret"

  def req_token(context)
    context[:req][:headers]["Authorization"].split(" ")[1]
  end

  def token_data(token)
    res = JWTUtils.decode(token, SECRET, verify_sub: false)
    if res.success
      res.data
    end
  end


  it "encodes an authorization header" 


  it "fails with a missing auth context" 


  it "fails with an invalid missing auth context" 


  it "calls lambda to fetch the auth context" 


end

