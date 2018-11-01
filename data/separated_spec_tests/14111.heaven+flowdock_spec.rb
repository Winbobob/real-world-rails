require "spec_helper"

describe "Heaven::Notifier::Flowdock" do
  include FixtureHelper

  before :all do
    ENV["FLOWDOCK_USER_API_TOKEN"] = "acdcabbacd01234567890"
    ENV["FLOWDOCK_USER_NAME"] = "Heaven test"
    ENV["FLOWDOCK_USER_EMAIL"] = "heaven.invalid@example.com"
    ENV["FLOWDOCK_USER_AVATAR"] = "http://example.com/imaginary.jpg"
    ENV["FLOWDOCK_FLOW_TOKENS"] = '{"example":"example_token","example2":"example2_token"}'
  end

  before :each do
    # Stub flow get
    stub_request(:get, "https://#{ENV["FLOWDOCK_USER_API_TOKEN"]}:@api.flowdock.com/v1/flows/find?id=example")
      .with(:headers => { "Accept" => "application/json", "Content-Type" => "application/json" })
      .to_return(
        :status => 200,
        :body => '{"web_url":"https://www.flowdock.com/app/example/main"}',
        :headers => { "Content-Type" => "application/json" })
    stub_request(:get, "https://api.github.com/repos/atmos/my-robot/deployments?environment=production&page=1")
      .to_return(:status => 200, :body => "[]", :headers => { "Content-Type" => "application/json" })
  end

  it "handles pending notifications" 


  it "handles successful deployment statuses" 


  it "handles failure deployment statuses" 


  def fixture_data_with_flowdock_notify(file)
    raw_data = decoded_fixture_data(file)
    raw_data["deployment"]["payload"]["notify"] = {
      :adapter => "flowdock",
      :room => "example",
      :user => "chat_user",
      :thread_id => "original_thread"
    }
    raw_data
  end
end

