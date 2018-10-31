require "spec_helper"

module Fog
  module Identity
    def self.require(*_args); end
  end
end

describe "Fog::Identity" do
  describe "#new" do
    module Fog
      module TheRightWay
        extend Provider
        service(:identity, "Identity")
      end
    end

    module Fog
      module TheRightWay
        class Identity
          def initialize(_args); end
        end
      end
    end

    it "instantiates an instance of Fog::Identity::<Provider> from the :provider keyword arg" 


    module Fog
      module TheWrongWay
        extend Provider
        service(:identity, "Identity")
      end
    end

    module Fog
      module Identity
        class TheWrongWay
          def initialize(_args); end
        end
      end
    end

    it "instantiates an instance of Fog::<Provider>::Identity from the :provider keyword arg" 


    module Fog
      module BothWays
        extend Provider
        service(:identity, "Identity")
      end
    end

    module Fog
      module BothWays
        class Identity
          attr_reader :args
          def initialize(args)
            @args = args
          end
        end
      end
    end

    module Fog
      module Identity
        class BothWays
          def initialize(_args); end
        end
      end
    end

    describe "when both Fog::Identity::<Provider> and Fog::<Provider>::Identity exist" do
      it "prefers Fog::Identity::<Provider>" 

    end

    it "passes the supplied keyword args less :provider to Fog::Identity::<Provider>#new" 


    it "raises ArgumentError when given a :provider where a Fog::Identity::Provider that does not exist" 

  end
end

