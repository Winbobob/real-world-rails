$LOAD_PATH << Rails.root.join("tools").to_s

require "fix_auth/cli"

describe FixAuth::Cli do
  describe "#parse" do
    it "should assign defaults" 


    it "should pickup env variables" 


    it "should parse database names" 


    it "should parse hardcoded password" 


    it "defaults to updating the database" 


    it "doesnt default to database if running another task" 


    it "doesnt default to database if running another task 2" 


    it "can run all 3 tasks" 


    it "parses legacy_keys" 


    it "parses without legacy_keys specified" 


    describe "v2" do
      it "exists" 

    end
  end
end

