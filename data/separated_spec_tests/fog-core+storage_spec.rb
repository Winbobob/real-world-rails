require "spec_helper"

module Fog
  module Storage
    def self.require(*_args); end
  end
end

describe "Fog::Storage" do
  describe "#new" do
    module Fog
      module TheRightWay
        extend Provider
        service(:storage, "Storage")
      end
    end

    module Fog
      module TheRightWay
        class Storage
          def initialize(_args); end
        end
      end
    end

    it "instantiates an instance of Fog::<Provider>::Storage from the :provider keyword arg" 


    module Fog
      module TheWrongWay
        extend Provider
        service(:storage, "Storage")
      end

      module Storage
        class TheWrongWay
          def initialize(_args); end
        end
      end
    end

    it "instantiates an instance of Fog::Storage::<Provider> from the :provider keyword arg" 


    module Fog
      module BothWays
        extend Provider
        service(:storage, "Storage")
      end
    end

    module Fog
      module BothWays
        class Storage
          attr_reader :args

          def initialize(args)
            @args = args
          end
        end
      end
    end

    module Fog
      module Storage
        class BothWays
          def initialize(_args); end
        end
      end
    end

    describe "when both Fog::Storage::<Provider> and Fog::<Provider>::Storage exist" do
      it "prefers Fog::Storage::<Provider>" 

    end

    it "passes the supplied keyword args less :provider to Fog::Storage::<Provider>#new" 


    it "raises ArgumentError when given a :provider where a Fog::Storage::Provider that does not exist" 

  end

  describe ".get_body_size" do
    it "doesn't alter the encoding of the string passed to it" 


    it "respects frozen strings" 

  end
end

