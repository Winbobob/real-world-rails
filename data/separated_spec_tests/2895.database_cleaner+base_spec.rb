require 'database_cleaner/mongo_mapper/base'
require 'database_cleaner/shared_strategy'

module DatabaseCleaner
  RSpec.describe MongoMapper do
    it { is_expected.to respond_to(:available_strategies) }
  end

  module MongoMapper
    class ExampleStrategy
      include ::DatabaseCleaner::MongoMapper::Base
    end

    RSpec.describe ExampleStrategy do

      it_should_behave_like "a generic strategy"

      describe "db" do
        it { is_expected.to respond_to(:db=) }

        it "should store my desired db" 


        it "should default to :default" 

      end
    end
  end
end

