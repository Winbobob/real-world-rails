module ArrayHelper
  def zipmap(array, vals)
    Hash[*(array.zip(vals).flatten)]
  end
  module_function :zipmap
end

module DatabaseCleaner
  class << self
    def reset
      @cleaners = nil
      @connections = nil
      @app_root = nil
    end
    # hackey, hack.. connections needs to stick around until I can properly deprecate the API
    def connections_stub(array)
      @cleaners = ArrayHelper.zipmap((1..array.size).to_a, array)
      @connections = array
    end
  end
end

RSpec.describe DatabaseCleaner do
  before(:each) { DatabaseCleaner.reset }

  context "orm specification" do
    it "should not accept unrecognised orms" 


    it "should accept :active_record" 


    it "should accept :data_mapper" 


    it "should accept :mongo_mapper" 


    it "should accept :couch_potato" 


    it "should accept :moped" 


    it 'accepts :ohm' 

  end

  it "should accept multiple orm's" 


  context "connection/db specification" do
    it "should accept a connection parameter and store it" 


    it "should accept multiple connections for a single orm" 


    it "should accept multiple connections and multiple orms" 

  end

  context "connection/db retrieval" do
    it "should retrieve a db rather than create a new one" 

  end

  context "class methods" do
    subject { DatabaseCleaner }

    it "should give me a default (autodetection) databasecleaner by default" 

  end

  context "single orm single connection" do
    let(:connection) { DatabaseCleaner.connections.first }

    it "should proxy strategy=" 


    it "should proxy orm=" 


    it "should proxy start" 


    it "should proxy clean" 


    it 'should proxy cleaning' 


    it "should proxy clean_with" 

  end

  context "multiple connections" do

    # these are relatively simple, all we need to do is make sure all connections are cleaned/started/cleaned_with appropriately.
    context "simple proxy methods" do

      let(:active_record) { double("active_mock") }
      let(:data_mapper)   { double("data_mock")   }

      before(:each) do
        allow(DatabaseCleaner).to receive(:connections).and_return([active_record,data_mapper])
      end

      it "should proxy orm to all connections" 


      it "should proxy start to all connections" 


      it "should proxy clean to all connections" 


      it "should initiate cleaning on each connection, yield, and finish cleaning each connection" 


      it "should proxy clean_with to all connections" 

    end

    # ah now we have some difficulty, we mustn't allow duplicate connections to exist, but they could
    # plausably want to force orm/strategy change on two sets of orm that differ only on db
    context "multiple orm proxy methods" do

      it "should proxy orm to all connections and remove duplicate connections" 


      it "should proxy strategy to all connections and remove duplicate connections" 

    end
  end

  describe "remove_duplicates" do
    it "should remove duplicates if they are identical" 

  end

  describe "app_root" do
    it "should default to Dir.pwd" 


    it "should store specific paths" 

  end

  describe "orm_module" do
    subject { DatabaseCleaner }

    let(:mod) { double }

    it "should return DatabaseCleaner::ActiveRecord for :active_record" 


    it "should return DatabaseCleaner::DataMapper for :data_mapper" 


    it "should return DatabaseCleaner::MongoMapper for :mongo_mapper" 


    it "should return DatabaseCleaner::Mongoid for :mongoid" 


    it "should return DatabaseCleaner::Mongo for :mongo" 


    it "should return DatabaseCleaner::CouchPotato for :couch_potato" 


    it "should return DatabaseCleaner::Neo4j for :neo4j" 

  end
end

