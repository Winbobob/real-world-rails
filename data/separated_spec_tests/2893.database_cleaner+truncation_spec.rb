require 'database_cleaner/couch_potato/truncation'
require 'couch_potato'

module DatabaseCleaner
  module CouchPotato

    RSpec.describe Truncation do
      let(:database) { double('database') }

      before(:each) do
        allow(::CouchPotato).to receive(:couchrest_database).and_return(database)
      end

      it "should re-create the database" 


      it "should raise an error when the :only option is used" 


      it "should raise an error when the :except option is used" 


      it "should raise an error when invalid options are provided" 

    end

  end
end

