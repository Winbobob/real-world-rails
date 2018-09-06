require 'spec_helper'

describe V8::C::Exception do
  requires_v8_context

  it "can be thrown from Ruby" 


  def explode(arguments)
    error = V8::C::Exception::SyntaxError('did not pay syntax')
    V8::C::ThrowException(error)
  end
end

