require "spec_helper"

module Fog
  module Compute
    def self.require(*_args); end
  end
end

describe "Fog::Compute" do
  describe "#new" do
    module Fog
      module TheRightWay
        extend Provider
        service(:compute, "Compute")
      end
    end

    module Fog
      module TheRightWay
        class Compute
          def initialize(_args); end
        end
      end
    end

    it "instantiates an instance of Fog::Compute::<Provider> from the :provider keyword arg" 


    module Fog
      module TheWrongWay
        extend Provider
        service(:compute, "Compute")
      end
    end

    module Fog
      module Compute
        class TheWrongWay
          def initialize(_args); end
        end
      end
    end

    it "instantiates an instance of Fog::<Provider>::Compute from the :provider keyword arg" 


    module Fog
      module BothWays
        extend Provider
        service(:compute, "Compute")
      end
    end

    module Fog
      module BothWays
        class Compute
          attr_reader :args
          def initialize(args)
            @args = args
          end
        end
      end
    end

    module Fog
      module Compute
        class BothWays
          def initialize(_args); end
        end
      end
    end

    describe "when both Fog::Compute::<Provider> and Fog::<Provider>::Compute exist" do
      it "prefers Fog::<Provider>::Compute" 

    end

    it "passes the supplied keyword args less :provider to Fog::Compute::<Provider>#new" 


    it "raises ArgumentError when given a :provider where a Fog::Compute::Provider that does not exist" 

  end
end

