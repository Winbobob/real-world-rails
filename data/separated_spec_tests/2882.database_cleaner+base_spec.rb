require 'redis'
require 'database_cleaner/redis/base'
require 'database_cleaner/shared_strategy'

module DatabaseCleaner
  RSpec.describe Redis do
    it { is_expected.to respond_to(:available_strategies) }
  end

  module Redis
    class ExampleStrategy
      include ::DatabaseCleaner::Redis::Base
    end

    RSpec.describe ExampleStrategy do

      it_should_behave_like "a generic strategy"
      it { is_expected.to respond_to(:db) }
      it { is_expected.to respond_to(:db=) }

      context "when passing url" do
        it "should store my describe db" 

      end

      context "when passing connection" do
        it "should store my describe db" 

      end

      it "should default to :default" 

    end
  end
end

