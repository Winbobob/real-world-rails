require "#{Rails.root}/db/chores/proposal_and_step_status_updater"

describe ProposalAndStepStatusUpdater do
  describe ".run" do
    it "renames cancelled -> canceled for proposals" 


    it "renames approved -> completed for proposals" 


    it "renames approved -> completed for steps" 

  end

  describe ".unrun" do
    it "renames canceled -> cancelled for proposals" 


    it "renames completed -> approved for proposals" 


    it "renames completed -> approved for steps" 

  end
end

