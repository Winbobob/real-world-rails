describe "API v2" do
  describe "CORS" do
    it "sets the Access-Control-Allow-Origin header to allow requests from anywhere" 


    it "allows general HTTP methods (GET/POST/PUT)" 


    it "supports OPTIONS requests" 

  end

  describe "authenticate" do
    it "returns valid oauth token" 

  end

  describe "GET proposal" do
    it "returns 403 if requesting unauthorized proposal" 

  end

  describe "POST proposal" do
    it "returns 403 when trying to create proposal in different client model" 

  end

  def cors_headers
    {
      "HTTP_ORIGIN" => cors_origin,
      "HTTP_ACCESS_CONTROL_REQUEST_METHOD" => "GET"
    }
  end

  def cors_origin
    "http://corsexample.com/"
  end

  def response_json
    JSON.parse(response.body)
  end

  def oauth_authz_header(oauth_token)
    "Bearer #{oauth_token}"
  end

  def oauth_authn_header(oauth_application)
    "Basic #{Base64.urlsafe_encode64("#{oauth_application.uid}:#{oauth_application.secret}")}"
  end

  def oauth_token(oauth_application)
    auth_header = oauth_authn_header(oauth_application)
    post "/oauth/token", { grant_type: "client_credentials" }, { Authorization: auth_header }
    JSON.parse(response.body)["access_token"]
  end
 
  def oauth_application(owner)
    Doorkeeper::Application.create!(name: "test oauth app", redirect_uri: default_redirect_uri, owner: owner)
  end

  def default_redirect_uri
    "urn:ietf:wg:oauth:2.0:oob"
  end
end

