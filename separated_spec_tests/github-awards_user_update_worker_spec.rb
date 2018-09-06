require 'rails_helper'

describe UserUpdateWorker do
  
  let(:github_result) { JSON.parse(File.read("spec/fixtures/github/user.json")) }
  
  describe "perform" do
    context "new user" do
      before(:each) do
        stub_request(:get, "https://maps.googleapis.com/maps/api/geocode/json?address=Paris").
            with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
            to_return(status: 200, body: "", headers: {})

        Models::GithubClient.any_instance.stubs(:get).returns(github_result)
      end

      it "creates user" 


      context "blacklisted user" do
        it "ignores user" 

      end
    end
    
    context "user not found on github" do
      it "ignores user" 

    end
  end
  
  describe "update_user" do
    it "updates user" 

  end
end

