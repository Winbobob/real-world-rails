require "spec_helper"

module Capistrano
  class Configuration
    describe Question do
      let(:question) { Question.new(key, default, options) }
      let(:question_without_echo) { Question.new(key, default, echo: false) }
      let(:question_without_default) { Question.new(key, nil) }
      let(:default) { :default }
      let(:key) { :branch }
      let(:options) { nil }

      describe ".new" do
        it "takes a key, default, options" 

      end

      describe "#call" do
        context "value is entered" do
          let(:branch) { "branch" }

          it "returns the echoed value" 


          it "returns the value but does not echo it" 


          it "returns the value but has no default between parenthesis" 

        end

        context "value is not entered" do
          let(:branch) { default }

          before do
            $stdout.expects(:print).with("Please enter branch (default): ")
            $stdin.expects(:gets).returns("")
          end

          it "returns the default as the value" 

        end

        context "tty unavailable", capture_io: true do
          before do
            $stdin.expects(:gets).never
            $stdin.expects(:tty?).returns(false)
          end

          it "returns the default as the value" 

        end
      end
    end
  end
end

