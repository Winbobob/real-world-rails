require File.expand_path("../../spec_helper", __FILE__)

describe 'Denormalizer' do

  before(:all) do
    6.times { Taxon.make! }
  end

  after(:all) do
    Taxon.connection.execute('TRUNCATE TABLE taxa RESTART IDENTITY')
  end

  it "should iterate through taxa in batches" 


end

