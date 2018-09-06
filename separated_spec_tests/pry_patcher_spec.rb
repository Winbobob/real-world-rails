require_relative '../helper'

describe Pry::Method::Patcher do

  before do
    @x = Object.new
    def @x.test; :before; end
    @method = Pry::Method(@x.method(:test))
  end

  it "should change the behaviour of the method" 


  it "should return a new method with new source" 


  it "should change the source of new Pry::Method objects" 


  it "should preserve visibility" 

end

