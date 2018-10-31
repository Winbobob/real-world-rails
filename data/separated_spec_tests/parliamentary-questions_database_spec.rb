require 'feature_helper'

describe HealthCheck::Database do
  let(:db) { HealthCheck::Database.new }

  context '#available?' do
    it 'returns true if the database is available' 


    it 'returns false if the database is not available' 

  end

  context '#accessible?' do
    it 'returns true if the database is accessible with our credentials' 


    it 'returns false if the database is not accessible with our credentials' 

  end

  context '#error_messages' do
    it 'returns the exception messages if there is an error accessing the database' 


    it 'returns an error an backtrace for errors not specific to a component' 

  end
end

