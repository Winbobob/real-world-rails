require 'spec_helper'

describe DeleteMergedBranchesWorker do
  subject(:worker) { described_class.new }

  let(:project) { create(:project, :repository) }

  describe "#perform" do
    it "calls DeleteMergedBranchesService" 


    it "returns false when project was not found" 

  end
end

