# frozen_string_literal: true

require "helper"

if SimpleCov.usable?
  describe SimpleCov::LastRun do
    subject { SimpleCov::LastRun }

    it "defines a last_run_path" 


    it "writes json to its last_run_path that can be parsed again" 


    context "reading" do
      context "but the last_run file does not exist" do
        before { File.delete(subject.last_run_path) if File.exist?(subject.last_run_path) }

        it "returns nil" 

      end

      context "a non empty result" do
        before { subject.write([]) }

        it "reads json from its last_run_path" 

      end

      context "an empty result" do
        before do
          File.open(subject.last_run_path, "w+") do |f|
            f.puts ""
          end
        end

        it "returns nil" 

      end
    end
  end
end

