require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'spec_helper'))

RSpec.describe HTTParty::Logger do
  describe ".build" do
    subject { HTTParty::Logger }

    it "defaults level to :info" 


    it "defaults format to :apache" 


    it "builds :curl style logger" 


    it "builds :custom style logger" 

    it "raises error when formatter exists" 

  end
end

