require 'database_cleaner/neo4j/base'
require 'database_cleaner/shared_strategy'

module DatabaseCleaner
  RSpec.describe Neo4j do
    it { is_expected.to respond_to(:available_strategies) }
  end

  module Neo4j
    class ExampleStrategy
      include ::DatabaseCleaner::Neo4j::Base
    end

    RSpec.describe ExampleStrategy do

      it_should_behave_like "a generic strategy"
      it { is_expected.to respond_to(:db) }
      it { is_expected.to respond_to(:db=) }

      it "should store my describe db" 


      it "should respect additional connection parameters" 


      it "should default to nil" 


      it "should return default configuration" 

    end
  end
end

