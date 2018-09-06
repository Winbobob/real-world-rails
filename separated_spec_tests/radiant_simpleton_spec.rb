require File.dirname(__FILE__) + "/../spec_helper"

class Dumbo
  include Simpleton
end

describe Simpleton, "when included in a class" do
 
  it "should add an 'instance' class method" 

  
end

describe Simpleton, "when creating or invoking the instance" do

  before :each do
    Dumbo.class_eval { @instance = nil }
  end

  it "should return the instance of the class" 

  
  it "should accept a block and yield the instance" 

  
end

describe Simpleton, "when invoking methods" do

  it "should delegate missing class methods to the instance" 

  
  it "should not delegate missing class methods that are not defined on the instance" 

  
end

