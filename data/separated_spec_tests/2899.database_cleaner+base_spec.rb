require 'database_cleaner/active_record/transaction'
require 'database_cleaner/data_mapper/transaction'
require 'database_cleaner/mongo_mapper/truncation'
require 'database_cleaner/mongoid/truncation'
require 'database_cleaner/couch_potato/truncation'
require 'database_cleaner/neo4j/transaction'

module DatabaseCleaner
  RSpec.describe Base do
    describe "autodetect" do
      before do
        hide_const("ActiveRecord")
        hide_const("DataMapper")
        hide_const("MongoMapper")
        hide_const("Mongoid")
        hide_const("CouchPotato")
        hide_const("Sequel")
        hide_const("Moped")
        hide_const("Redis")
        hide_const("Ohm")
        hide_const("Neo4j")
      end

      it "should raise an error when no ORM is detected" 


      it "should detect ActiveRecord first" 


      it "should detect DataMapper second" 


      it "should detect MongoMapper third" 


      it "should detect Mongoid fourth" 


      it "should detect CouchPotato fifth" 


      it "should detect Sequel sixth" 


      it 'detects Moped seventh' 


      it 'detects Ohm eighth' 


      it 'detects Redis ninth' 


      it 'detects Neo4j tenth' 

    end

    describe "comparison" do
      it "should be equal if orm and connection are the same" 


      it "should not be equal if orm are not the same" 


      it "should not be equal if connection are not the same" 

    end

    describe "initialization" do
      context "db specified" do
        subject { ::DatabaseCleaner::Base.new(:active_record, :connection => :my_db) }

        it "should store db from :connection in params hash" 

      end

      describe "orm" do
        it "should store orm" 


        it "converts string to symbols" 


        it "is autodetected if orm is not provided" 


        it "is autodetected if you specify :autodetect" 


        it "should default to autodetect upon initalisation" 

      end
    end

    describe "db" do
      it "should default to :default" 


      it "should return any stored db value" 

    end

    describe "db=" do
      context "when strategy supports db specification" do
        it "should pass db down to its current strategy" 

      end

      context "when strategy doesn't support db specification" do
        let(:strategy) { double(respond_to?: false) }
        before { subject.strategy = strategy }

        it "doesn't pass the default db down to it" 


        it "should raise an argument error when db isn't default" 

      end
    end

    describe "clean_with" do
      let (:strategy) { double("strategy", clean: true) }

      before do
        allow(subject).to receive(:create_strategy).with(anything).and_return(strategy)
      end
    end

    describe "clean_with" do
      # FIXME hacky null strategy
      # because you can't pass a NullStrategy to #clean_with

      let(:strategy) { double(clean: true) }

      let(:strategy_class) do
        require "database_cleaner/active_record/truncation"
        DatabaseCleaner::ActiveRecord::Truncation
      end

      before do
        allow(::ActiveRecord::Base).to receive(:connection).and_return(double.as_null_object)
        allow(strategy_class).to receive(:new).and_return(strategy)
      end

      it "should pass all arguments to strategy initializer" 


      it "should invoke clean on the created strategy" 


      it "should return the created strategy" 

    end

    describe "strategy=" do
      let(:strategy_class) do
        require "database_cleaner/active_record/truncation"
        DatabaseCleaner::ActiveRecord::Truncation
      end

      it "should look up and create a the named strategy for the current ORM" 


      it "should proxy params with symbolised strategies" 


      it "should accept strategy objects" 


      it "should raise argument error when params given with strategy object" 


      it "should attempt to set strategy db" 


      it "raises UnknownStrategySpecified on a bad strategy, and lists available strategies" 


      it "loads and instantiates the described strategy" 

    end

    describe "strategy" do
      subject { described_class.new(:a_orm) }

      it "returns a null strategy when strategy is not set and undetectable" 

    end

    describe "orm" do
      let(:mock_orm) { double("orm") }

      it "should return orm if orm set" 


      context "orm isn't set" do
        subject { described_class.new }

        it "should run autodetect if orm isn't set" 


        it "should return the result of autodetect if orm isn't set" 

      end
    end

    describe "proxy methods" do
      let (:strategy) { double("strategy") }

      before(:each) do
        subject.strategy = strategy
      end

      describe "start" do
        it "should proxy start to the strategy" 

      end

      describe "clean" do
        it "should proxy clean to the strategy" 

      end

      describe "cleaning" do
        it "should proxy cleaning to the strategy" 

      end
    end

    describe "auto_detected?" do
      it "is true if auto detection was used" 


      it "is false if orm was specified" 

    end

    describe 'set_default_orm_strategy' do
      it 'sets strategy to :transaction for ActiveRecord' 


      it 'sets strategy to :transaction for DataMapper' 


      it 'sets strategy to :truncation for MongoMapper' 


      it 'sets strategy to :truncation for Mongoid' 


      it 'sets strategy to :truncation for CouchPotato' 


      it 'sets strategy to :transaction for Sequel' 


      it 'sets strategy to :truncation for Moped' 


      it 'sets strategy to :truncation for Ohm' 


      it 'sets strategy to :truncation for Redis' 


      it 'sets strategy to :transaction for Neo4j' 

    end
  end
end

