require 'helper'
RSpec.describe Pry::Config::Memoization do
  let(:config) do
    Class.new do
      include Pry::Config::Memoization
      def_memoized({foo: proc {"foo"}, bar: proc {"bar"}})
    end.new
  end

  describe "on call of method" do
    it "memoizes the return value" 

  end

  describe "#memoized_methods" do
    it "tracks a list of memoized methods" 

  end
end

