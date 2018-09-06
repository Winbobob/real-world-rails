# frozen_string_literal: true

require "helper"

if SimpleCov.usable?
  describe SimpleCov do
    describe ".result" do
      before do
        SimpleCov.clear_result
        allow(Coverage).to receive(:result).once.and_return({})
      end

      context "with merging disabled" do
        before do
          allow(SimpleCov).to receive(:use_merging).once.and_return(false)
        end

        context "when not running" do
          before do
            allow(SimpleCov).to receive(:running).and_return(false)
          end

          it "returns nil" 

        end

        context "when running" do
          before do
            allow(SimpleCov).to receive(:running).and_return(true, false)
          end

          it "uses the result from Coverage" 


          it "adds not-loaded-files" 


          it "doesn't store the current coverage" 


          it "doesn't merge the result" 


          it "caches its result" 

        end
      end

      context "with merging enabled" do
        let(:the_merged_result) { double }

        before do
          allow(SimpleCov).to receive(:use_merging).once.and_return(true)
          allow(SimpleCov::ResultMerger).to receive(:store_result).once
          allow(SimpleCov::ResultMerger).to receive(:merged_result).once.and_return(the_merged_result)
        end

        context "when not running" do
          before do
            allow(SimpleCov).to receive(:running).and_return(false)
          end

          it "merges the result" 

        end

        context "when running" do
          before do
            allow(SimpleCov).to receive(:running).and_return(true, false)
          end

          it "uses the result from Coverage" 


          it "adds not-loaded-files" 


          it "stores the current coverage" 


          it "merges the result" 


          it "caches its result" 

        end
      end
    end

    describe ".set_exit_exception" do
      context "when an exception has occurred" do
        let(:error) { StandardError.new "SomeError" }

        after do
          # Clear the exit_exception
          SimpleCov.set_exit_exception
        end

        it "captures the current exception" 

      end

      context "when an exception has not occurred" do
        it "has no exit_exception" 

      end
    end

    describe ".exit_status_from_exception" do
      context "when no exception has occurred" do
        before do
          allow(SimpleCov).to receive(:exit_exception).and_return(nil)
        end

        it "returns SimpleCov::ExitCodes::SUCCESS" 

      end

      context "when a SystemExit has occurred" do
        let(:system_exit) { SystemExit.new(1) }

        before do
          allow(SimpleCov).to receive(:exit_exception).and_return(system_exit)
        end

        it "returns the SystemExit status" 

      end

      context "when a non SystemExit occurrs" do
        let(:error) { StandardError.new "NonSystemExit" }

        before do
          allow(SimpleCov).to receive(:exit_exception).and_return(error)
        end

        it "return SimpleCov::ExitCodes::EXCEPTION" 

      end
    end
  end
end

