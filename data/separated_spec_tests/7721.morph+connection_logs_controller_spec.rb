require 'spec_helper'

describe ConnectionLogsController do
  describe "#create" do
    before(:each) { allow(ConnectionLogsController).to receive(:key).and_return("sjdf") }

    it "should be successful if correct key is used" 


    it "should not be successful if wrong key is used" 

  end
end

