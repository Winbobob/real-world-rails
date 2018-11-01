require "spec_helper"
require 'method_observer'

describe MethodObserver do

  class TestObserver < MethodObserver
    def before_observed_method(*args, &block); end
    def after_observed_method(*args); end
  end

  class TestObject
    def observed_method
      :success
    end
  end

  before :each do
    @object = TestObject.new
    allow(@object).to receive(:before_result=).and_return(nil)
    allow(@object).to receive(:after_result=).and_return(:success)
    @observer = TestObserver.new
    @observer.observe(@object)
  end

  it "should permit only one object to be observed" 


  it "should have a target equal to the observed object" 


  it "should invoke the before_ method before the object's method is invoked" 


  it "should invoke the after_ method after the object's method is invoked" 

end

