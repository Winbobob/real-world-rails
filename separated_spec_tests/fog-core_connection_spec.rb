require "spec_helper"

describe Fog::Core::Connection do
  it "raises ArgumentError when no arguments given" 


  [:request, :reset].each do |method|
    it "responds to #{method}" 

  end

  it "adds custom user-agents to Fog requests" 


  it "doesn't error when persistence is enabled" 


  it "doesn't error when persistence is enabled and debug_response is disabled" 


  describe ":path_prefix" do
    it "does not emit a warning when provided this argument in the initializer" 


    it "raises when the 'path' arg is present and this arg is supplied" 

  end

  describe "#request" do
    describe "default behavior" do
      it "supplies the 'path' arg directly to Excon" 

    end

    describe "with path_prefix supplied to the initializer" do
      let(:spy) do
        Object.new.tap do |spy|
          spy.instance_eval do
            def new(*_args); self; end
            def params; @params; end
            def request(params)
              @params = params
            end
          end
        end
      end

      it "uses the initializer-supplied :path_prefix arg with #request :arg to formulate a path to send to Excon.request" 


      it "does not introduce consecutive '/'s into the path if 'path' starts with a '/'" 

    end
  end
end

