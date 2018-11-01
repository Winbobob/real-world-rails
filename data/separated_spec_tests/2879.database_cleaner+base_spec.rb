require 'database_cleaner/data_mapper/base'
require 'database_cleaner/shared_strategy'

module DatabaseCleaner
  RSpec.describe DataMapper do
    it { is_expected.to respond_to(:available_strategies) }
  end

  module DataMapper
    class ExampleStrategy
      include ::DatabaseCleaner::DataMapper::Base
    end

    RSpec.describe ExampleStrategy do
      it_should_behave_like "a generic strategy"
      it { is_expected.to respond_to(:db)  }
      it { is_expected.to respond_to(:db=) }

      it "should store my desired db" 


      it "should default to :default" 

    end
  end
end

