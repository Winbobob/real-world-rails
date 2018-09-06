require 'rspec/core/bisect/server'
require 'support/formatter_support'

module RSpec::Core
  RSpec.describe Bisect::Server do
    RSpec::Matchers.define :have_running_server do
      match do |drb|
        begin
          drb.current_server.alive?
        rescue DRb::DRbServerNotFound
          false
        end
      end
    end

    it 'always stops the server, even if an error occurs while yielding' 


    context "when results are failed to be reported" do
      let(:server) { Bisect::Server.new }

      it "raises an error with the output" 

    end

    context "when used in combination with the BisectDRbFormatter", :slow do
      include FormatterSupport

      attr_reader :server

      around do |ex|
        Bisect::Server.run do |the_server|
          @server = the_server
          ex.run
        end
      end

      def run_formatter_specs
        RSpec.configuration.drb_port = server.drb_port
        run_rspec_with_formatter("bisect-drb")
      end

      it 'receives suite results' 


      describe "aborting the run early" do
        it "aborts as soon as the last expected failure finishes, since we don't care about what happens after that" 


        it 'aborts after an expected failure passes instead, even when there are remaining failing examples' 


        it 'aborts after an expected failure is pending instead, even when there are remaining failing examples' 

      end
    end
  end
end

