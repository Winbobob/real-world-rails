describe SubscriptionsController do
  describe "subscribe" do
    let(:user) { User.make! }
    let(:o) { Observation.make! }
    before do
      sign_in user
    end

    it "should create a subscription if subscribe=true" 

    it "should destroy a subscription if subscribe=false" 

    it "should do nothing if subscribe=false and no subscription exists" 

  end
end

