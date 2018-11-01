require 'spec_helper'

describe Queries::Export do

  subject { Queries::Export.new }

  context "stubbed sql" do
    before(:each) do
      allow(subject).to receive(:sql).and_return("SELECT * FROM charges WHERE 1 = 1")
      allow(subject).to receive(:klass).and_return(Charge)
    end

    it "should append a limit and offset" 


    it "should return back the total count of rows" 

  end
end

