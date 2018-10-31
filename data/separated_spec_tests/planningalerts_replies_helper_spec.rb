require 'spec_helper'

describe RepliesHelper do
  describe "#reply_path" do
    let(:application) { VCR.use_cassette('planningalerts') { create(:application, id: 1) } }
    let(:reply) { create(:reply, id: 1, comment: create(:confirmed_comment, application: application)) }

    it "returns the path for the application with an anchor with the reply id" 

  end
end

