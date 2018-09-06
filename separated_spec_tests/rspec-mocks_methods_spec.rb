module RSpec
  module Mocks
    RSpec.describe "Methods added to every object" do
      include_context "with syntax", :expect

      def added_methods
        host = Class.new
        orig_instance_methods = host.instance_methods
        Syntax.enable_should(host)
        (host.instance_methods - orig_instance_methods).map(&:to_sym)
      end

      it 'limits the number of methods that get added to all objects' 

    end
  end
end

