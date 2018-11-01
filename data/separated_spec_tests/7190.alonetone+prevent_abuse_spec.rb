require "rails_helper"
require "ostruct"

RSpec.describe PreventAbuse do
  let(:base) { Struct.new(:request) { 
    include PreventAbuse 
  } }

  it "should allow UC (s9) as a browser" 


  it "should not allow MJ12bot as a browser" 

end

