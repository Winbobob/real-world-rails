require 'rails_helper'

describe UpdateIndices do
  context "enqueing jobs" do
    before(:each) do
      Sidekiq::Testing.fake!
      Sidekiq::Worker.clear_all
    end
    it "should enque job" 

  end
end

