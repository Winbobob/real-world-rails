require 'spec_helper'

describe V8::C::Function do
  requires_v8_context

  it "can be called" 


  it "can be called with arguments and context" 


  it "can be called as a constructor" 


  it "can be called as a constructor with arguments" 


  it "doesn't kill the world if invoking it throws a javascript exception" 



  def run(source)
    source = V8::C::String::New(source.to_s)
    filename = V8::C::String::New("<eval>")
    script = V8::C::Script::New(source, filename)
    result = script.Run()
    result.kind_of?(V8::C::String) ? result.Utf8Value() : result
  end
end

