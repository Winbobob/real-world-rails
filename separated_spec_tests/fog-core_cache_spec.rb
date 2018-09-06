require "spec_helper"
require "securerandom"
require "tmpdir"

module Fog
  class SubFogTestModel < Fog::Model
    identity  :id
  end
end

module Fog
  class SubFogTestService < Fog::Service

    class Mock
      attr_reader :options

      def initialize(opts = {})
        @options = opts
      end
    end
  end
end

describe Fog::Cache do
  before(:each) do
    Fog.mock!
    @service = Fog::SubFogTestService.new
    Fog::Cache.namespace_prefix = "test-dir"
  end

  it "has a namespace_prefix configurable" 


  it "has metadata associated to the namespace that you can save to" 
  it "can load cache data from disk" 


  it "load bad cache data - empty file, from disk" 


  it "must have a namespace_prefix configurable" 


  it "can create a namespace" 


  it "will raise if no cache data found" 


  it "Fog cache ignores bad cache data - empty file, from disk" 



  it "can be dumped and reloaded back in" 


  it "dumping two models that have a duplicate identity" 


  it "dumping two models that have a duplicate identity twice" 

end

