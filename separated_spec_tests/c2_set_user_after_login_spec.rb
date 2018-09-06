describe "User creation when logging in with Oauth to view a protected page" do
  include EnvVarSpecHelper

  StructUser = Struct.new(:email_address, :first_name, :last_name)

  before do
    user = StructUser.new("george-test@example.com", "Georgie", "Jetsonian")
    setup_mock_auth(:cg, user)
  end

  it "creates a new user if the current user does not already exist" 


  it "sends welcome email to a new user", :email do
    with_env_var("WELCOME_EMAIL", "true") do
      expect { get "/auth/cg/callback" }.to change { deliveries.length }.from(0).to(1)
      welcome_mail = deliveries.first
      expect(welcome_mail.subject).to eq("Welcome to C2!")
    end
  end

  it "absence of first/last name does not throw error" 


  it "does not create a user if the current user already exists" 


  it "does not send welcome email to existing user" 


  it "redirects a newly logged in user to the carts screen" 

end

