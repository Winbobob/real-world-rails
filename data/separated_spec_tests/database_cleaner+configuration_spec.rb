module ArrayHelper

  def zipmap(array, vals)
    Hash[*(array.zip(vals).flatten)]
  end
  module_function :zipmap
end

module DatabaseCleaner
  class Configuration
    # hackey, hack.. connections needs to stick around until I can properly deprecate the API
    def connections_stub(array)
      @cleaners = ArrayHelper.zipmap((1..array.size).to_a, array)
      @connections = array
    end
  end
end

RSpec.describe DatabaseCleaner::Configuration do
  context "orm specification" do
    it "should not accept unrecognised orms" 


    it "should default to autodetection" 


    it "should accept :active_record" 


    it "should accept :data_mapper" 


    it "should accept :mongo_mapper" 


    it "should accept :couch_potato" 


    it "should accept :moped" 


    it 'accepts :ohm' 


    it "should accept multiple orm's" 


    it "should accept a connection parameter and store it" 


    it "should accept multiple connections for a single orm" 


    it "should accept multiple connections and multiple orms" 


    it "should retrieve a db rather than create a new one" 

  end

  context "top level api methods" do
    context "single orm single connection" do
      let(:connection) { subject[:active_record] }

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

        before do
          subject.connections_stub([active_record,data_mapper])
        end

        it "should proxy orm to all connections" 


        it "should proxy start to all connections" 


        it "should proxy clean to all connections" 


        it "should proxy clean_with to all connections" 


        it "should initiate cleaning on each connection, yield, and finish cleaning each connection" 

      end

      # ah now we have some difficulty, we mustn't allow duplicate connections to exist, but they could
      # plausably want to force orm/strategy change on two sets of orm that differ only on db
      context "multiple orm proxy methods" do
        class FakeStrategy < Struct.new(:orm, :db, :strategy); end

        context "with differing orms and dbs" do
          let(:active_record_1) { FakeStrategy.new(:active_record) }
          let(:active_record_2) { FakeStrategy.new(:active_record, :different) }
          let(:data_mapper_1)   { FakeStrategy.new(:data_mapper) }

          before do
            subject.connections_stub [active_record_1,active_record_2,data_mapper_1]
          end

          it "should proxy #orm= to all connections and remove duplicate connections" 

        end

        context "with differing strategies" do
          let(:active_record_1) { FakeStrategy.new(:active_record, :default, :truncation) }
          let(:active_record_2) { FakeStrategy.new(:active_record, :default, :transaction) }

          before do
            subject.connections_stub [active_record_1,active_record_2]
          end

          it "should proxy #strategy= to all connections and remove duplicate connections" 

        end
      end
    end
  end

  describe "app_root" do
    it "should default to Dir.pwd" 


    it "should store specific paths" 

  end
end

