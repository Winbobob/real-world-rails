require 'spec_helper'

# There's not really much point in testing the whole throttling stack because that's tested in the gem
# itself. Best just to concentrate on the bits that we're overriding

describe ThrottleConfigurable do
  let(:t) do
    ThrottleConfigurable.new(nil, strategies: {
      "hourly" => {
        100 => "default",
        3 => ["1.2.3.7", "1.2.3.8"],
      },
      "daily" => {
        2 => "1.2.3.4"
      },
      "unlimited" => "1.2.3.5",
      "blocked" => "1.2.3.6",
    })
  end

  it "should be able to extract the strategy setting for a particular ip address" 


  it "should be able to extract the maximum hits for a particular ip address" 


  it "should check that the strategy names are valid" 


  it "should check that the max count is valid" 


  it "should check that the ip addresses are potentially sane" 


  it "should check that an ip address isn't under multiple strategies" 


  it "should check that there is a default setting" 


  it "should not do any throttling with the unlimited strategy" 


  it "should never allow the request when an ip is blocked" 


  it "should limit request to the max count in the hourly strategy" 


  it "should limit requests to the max count in the daily strategy too" 

end

