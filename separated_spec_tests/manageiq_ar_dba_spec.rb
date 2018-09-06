describe "ar_dba extension" do
  let(:connection) { ApplicationRecord.connection }

  describe "#xlog_location" do
    it "returns a valid lsn" 

  end

  describe "#xlog_location_diff" do
    it "returns the correct xlog difference" 

  end

  describe "#primary_key_index" do
    it "returns nil when there is no primary key" 


    it "returns the correct primary key" 


    it "works with composite primary keys" 

  end

  describe "#primary_key?" do
    it "returns false for a table without a primary key" 


    it "returns true for a table with a primary key" 


    it "returns true for composite primary keys" 

  end
end

