require 'spec_helper'

describe Morph::SqliteDiff do
  before(:each) do
    FileUtils::rm_f(["tmp_db1.sqlite", "tmp_db2.sqlite"])
    # Create an sqlite database
    @db1 = SQLite3::Database.new("tmp_db1.sqlite")
    @db1.execute("CREATE TABLE foo (v1 text, v2 real);")
    @db1.execute("INSERT INTO foo VALUES ('hello', 2.3)")
    # Make an identical version
    FileUtils::cp("tmp_db1.sqlite", "tmp_db2.sqlite")
    @db2 = SQLite3::Database.new("tmp_db2.sqlite")
  end
  after(:each) { FileUtils::rm_f(["tmp_db1.sqlite", "tmp_db2.sqlite"]) }

  describe ".diffstat" do
    it "should show that nothing has changed" 


    it "should show a new table" 


    it "should show a deleted table" 


    it "should show an added and a deleted table" 


    it "should show a changed table (because of a schema change)" 


    it "should show a new record on an unchanged table" 


    it "should show a new record on a new table" 


    it "should show everything as added when there was no database to start with" 


    it "should show no difference when comparing two non-existent databases" 

  end

  describe ".diffstat_table" do
    it "should show no change for two identical sqlite databases" 


    it "should show a new record" 


    it "should show a deleted record" 


    it "should show adding a record and deleting a record" 


    it "should show a record being changed" 


    it "should be able to handle a large number of records", slow: true do
      FileUtils::rm_f(["tmp_db1.sqlite", "tmp_db2.sqlite"])
      # Create an sqlite database
      @db1 = SQLite3::Database.new("tmp_db1.sqlite")
      @db1.execute("CREATE TABLE foo (v1 text, v2 real);")
      # Create 1000 random records
      r = Random.new(347)
      (1..1000).each do |i|
        @db1.execute("INSERT INTO foo VALUES ('hello#{i}', #{r.rand})")
      end
      # Make an identical version
      FileUtils::cp("tmp_db1.sqlite", "tmp_db2.sqlite")
      @db2 = SQLite3::Database.new("tmp_db2.sqlite")
      # Remove 200 random records (but ensure we don't remove the last)
      ids = @db2.execute("SELECT ROWID FROM foo ORDER BY RANDOM() LIMIT 201").map{|r| r.first}
      if ids.include?(1000)
        ids.delete(1000)
      else
        ids.delete(ids.first)
      end
      @db2.execute("DELETE FROM foo WHERE ROWID IN (#{ids.join(',')})")
      # Update 100 random records
      ids = @db2.execute("SELECT ROWID FROM foo ORDER BY RANDOM() LIMIT 100").map{|r| r.first}
      @db2.execute("UPDATE foo SET v2=10 WHERE ROWID IN (#{ids.join(',')})")
      # Add 200 new records to that
      (1..200).each do |i|
        @db2.execute("INSERT INTO foo VALUES ('hello#{i}', #{r.rand})")
      end
      expect(Morph::SqliteDiff.diffstat_table("foo", @db1, @db2, 100)).to eq ({added: 200, removed: 200, changed: 100, unchanged: 700})
    end

    it "should compare two empty dbs" 

  end
end

