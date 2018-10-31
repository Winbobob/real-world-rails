require "rails_helper"

describe "application/_analytics.haml" do
  before do
    allow(view).to receive(:signed_in?).and_return(false)
    user = double("user").as_null_object
    allow(view).to receive(:current_user).and_return(user)
    allow(view).to receive(:identify_hash).and_return({})
    allow(view).to receive(:intercom_hash).and_return({})
  end

  it "loads the Segment JavaScript library" 


  it "records a pageview" 

end

