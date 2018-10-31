require "rails_helper"

describe AcceptGitHubInvitationJob do
  it "is retryable" 


  it "queue_as high" 


  describe "#perform" do
    context "when Hound has access to the repo" do
      it "doesn't need to accept the invitation" 

    end

    context "when Hound doesn't have access to the repo" do
      it "accepts the invitation" 

    end
  end
end

