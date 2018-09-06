require 'helper'
RSpec.describe Pry::Config::Behavior do
  let(:behavior) do
    Class.new do
      include Pry::Config::Behavior
    end
  end

  describe "#last_default" do
    it "returns the last default" 

  end

  describe "#eager_load!" do
    it "returns nil when the default is nil" 

  end
end

