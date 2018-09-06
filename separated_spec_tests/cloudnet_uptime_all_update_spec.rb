require 'rails_helper'

describe UptimeAllUpdate, :vcr do
  include_context :pingdom_env

  context "enqueing jobs" do
    before(:each) do
      Sidekiq::Testing.fake!
      Sidekiq::Worker.clear_all
    end
    it "should enque job" 


    it "should enque jobs for all particular servers" 

  end
end

