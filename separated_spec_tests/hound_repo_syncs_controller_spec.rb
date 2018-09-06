require "rails_helper"

describe RepoSyncsController, "#create" do
  context "user is refreshing repos" do
    it "will not enqueues repo sync job" 

  end

  context "user is not refreshing repos" do
    it "sets user to refreshing repos true and enqueues repo sync job" 

  end
end

