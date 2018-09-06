require "slack"

RSpec.describe Slack::Team do
  subject(:slack) { Slack::Team.new("rt", "abc123") }

  describe "#invite" do
    def stub_invite(status)
      expect(HTTP).to receive(:post).with(
        "https://rt.slack.com/api/users.admin.invite",
        form: {token: "abc123", email: "a@b.c"}
      ).and_return(status)
    end

    it "asks Slack to send an invite" 


    it "raises on errors" 

  end
end

