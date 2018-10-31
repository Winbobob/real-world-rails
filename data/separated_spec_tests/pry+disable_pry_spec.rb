require_relative '../helper'

describe "disable-pry" do
  before do
    @t = pry_tester
  end

  after do
    ENV.delete 'DISABLE_PRY'
  end

  it 'should quit the current session' 


  it "should set DISABLE_PRY" 

end

