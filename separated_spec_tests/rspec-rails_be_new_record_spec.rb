require "spec_helper"

describe "be_new_record" do
  context "a new record" do
    let(:record) { double('record', :new_record? => true) }

    it "passes" 


    it "fails with custom failure message" 

  end

  context "a persisted record" do
    let(:record) { double('record', :new_record? => false) }

    it "fails" 


    it "fails with custom failure message" 

  end
end

