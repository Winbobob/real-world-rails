# frozen_string_literal: true

RSpec.describe Bundler::Plugin::DSL do
  DSL = Bundler::Plugin::DSL

  subject(:dsl) { Bundler::Plugin::DSL.new }

  before do
    allow(Bundler).to receive(:root) { Pathname.new "/" }
  end

  describe "it ignores only the methods defined in Bundler::Dsl" do
    it "doesn't raises error for Dsl methods" 


    it "raises error for other methods" 

  end

  describe "source block" do
    it "adds #source with :type to list and also inferred_plugins list" 


    it "registers a source type plugin only once for multiple declataions" 

  end
end

