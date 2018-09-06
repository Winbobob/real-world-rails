require 'spec_helper'

describe Gitlab::CycleAnalytics::StageSummary do
  let(:project) { create(:project, :repository) }
  let(:from) { 1.day.ago }
  let(:user) { create(:user, :admin) }
  subject { described_class.new(project, from: Time.now, current_user: user).data }

  describe "#new_issues" do
    it "finds the number of issues created after the 'from date'" 


    it "doesn't find issues from other projects" 

  end

  describe "#commits" do
    it "finds the number of commits created after the 'from date'" 


    it "doesn't find commits from other projects" 


    it "finds a large (> 100) snumber of commits if present" 

  end

  describe "#deploys" do
    it "finds the number of deploys made created after the 'from date'" 


    it "doesn't find commits from other projects" 

  end
end

