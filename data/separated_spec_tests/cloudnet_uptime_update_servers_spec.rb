require 'rails_helper'


describe UptimeUpdateServers do
  
  context "enqueing jobs" do
    before(:each) do
      Sidekiq::Testing.fake!
    end
    it "enque job for update one server" 

  end
end

