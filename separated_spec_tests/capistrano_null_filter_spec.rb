require "spec_helper"

module Capistrano
  class Configuration
    describe NullFilter do
      subject(:null_filter) { NullFilter.new }

      describe "#filter" do
        let(:servers) { mock("servers") }

        it "returns the servers passed in as arguments" 

      end
    end
  end
end

