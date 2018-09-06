require 'spec_helper'

describe "setting up handles scopes" do
  around(:each) do |example|
    V8::C::Locker() do
      cxt = V8::C::Context::New()
      begin
        cxt.Enter()
        example.run
      ensure
        cxt.Exit()
      end
    end
  end

  it "can allocate handle scopes" 


  it "isn't the end of the world if a ruby exception is raised inside a HandleScope" 

end

