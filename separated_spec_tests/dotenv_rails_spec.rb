require "spec_helper"
require "rails"
require "dotenv/rails"

describe Dotenv::Railtie do
  # Fake watcher for Spring
  class SpecWatcher
    attr_reader :items

    def initialize
      @items = []
    end

    def add(*items)
      @items |= items
    end
  end

  before do
    Rails.env = "test"
    allow(Rails).to receive(:root)
      .and_return Pathname.new(File.expand_path("../../fixtures", __FILE__))
    Rails.application = double(:application)
    Spring.watcher = SpecWatcher.new
  end

  after do
    # Reset
    Spring.watcher = nil
    Rails.application = nil
  end

  context "before_configuration" do
    it "calls #load" 

  end

  context "load" do
    before { Dotenv::Railtie.load }

    it "watches .env with Spring" 


    it "watches other loaded files with Spring" 


    it "does not load .env.local in test rails environment" 


    it "does load .env.local in development environment" 


    it "loads .env.test before .env" 


    context "when Rails.root is nil" do
      before do
        allow(Rails).to receive(:root).and_return(nil)
      end

      it "falls back to RAILS_ROOT" 

    end
  end
end

