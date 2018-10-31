require 'spec_helper'

module Security
  describe SessionSecret do
    before :each do
      SessionSecret.stub :env => 'some_test_rails_env'
    end

    it 'should generate and save secret when not present in database' 


    it 'should return saved secret if present in database' 


    it 'fetch should return saved secret from CouchDB' 


    it 'save should save secret to CouchDB' 


    it 'should return current rails env' 


    it 'database name should have rails env' 


    after :each do
      SessionSecret.respond_to?(:database_name) && COUCHDB_SERVER.database(SessionSecret.database_name).delete!
    end

  end
end

