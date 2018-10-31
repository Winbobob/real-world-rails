require "spec_helper"

describe "Fog#timeout" do
  before do
    @old_timeout = Fog.timeout
  end

  after do
    Fog.timeout = @old_timeout
  end

  it "defaults to 600" 


  it "can be reassigned through Fog#timeout=" 

end

