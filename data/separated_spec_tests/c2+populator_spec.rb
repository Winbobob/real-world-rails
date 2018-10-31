require "#{Rails.root}/db/chores/populator"

describe Populator do
  before(:all) { DatabaseCleaner.strategy = :truncation }
  after(:all) { DatabaseCleaner.strategy = :transaction }

  describe '#random_ncr_data' do
    it "creates the specified number of work orders" 

  end

  describe '#uniform_ncr_data' do
    it "creates the specified number of work orders" 

  end

  describe '#ncr_data_for_user' do
    it "creates proposals for the user with email address passed in" 

  end
end

