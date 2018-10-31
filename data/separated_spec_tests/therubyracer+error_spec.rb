require 'spec_helper'

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe V8::Error do

  before do
    @cxt = V8::Context.new
    @cxt['one'] = lambda do
      @cxt.eval('two()', 'one.js')
    end
    @cxt['two'] = lambda do
      @cxt.eval('three()', 'two.js')
    end
  end

  it "captures a message without over nesting when the error is an error" 


  it "captures the js message without over nesting when the error is a normal object" 


  it "captures a thrown value as the message" 


  it "has a reference to the root javascript cause" 


  it "has a reference to the root ruby cause if one exists" 


  describe "backtrace" do
    it "is mixed with ruby and javascript" 


    it "can be set to show only ruby frames" 


    it "can be set to show only javascript frames" 


    it "includes a mystery marker when the original frame is unavailable because what got thrown wasn't an error" 


    it "has a source name and line number when there is a javascript SyntaxError" 


    it "can start with ruby at the bottom" 

  end


  def throw!(js = "new Error('BOOM!')", &block)
    @cxt['three'] = lambda do
      @cxt.eval("throw #{js}", 'three.js')
    end
    lambda do
      @cxt['one'].call()
    end.should(raise_error(V8::JSError, &block))
  end
end


# describe V8::Error do
#   describe "A ruby exception thrown inside JavaScript" do
#     before do
#       @error = StandardError.new('potato')
#       begin
#         V8::Context.new do |cxt|
#           cxt['one'] = lambda do
#             cxt.eval('two()', 'one.js')
#           end
#           cxt['two'] = lambda do
#             cxt.eval('three()', 'two.js')
#           end
#           cxt['three'] = lambda do
#             raise @error
#           end
#           cxt.eval('one()')
#         end
#       rescue StandardError => e
#         @thrown = e
#       end
#     end
#     it "is raised up through the call stack" do
#       @thrown.should be(@error)
#     end
#
#     it "shows both the javascript and the ruby callframes" do
#       puts @error.backtrace.join('<br/>')
#     end
#
#   end
# end

