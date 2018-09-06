require 'spec_helper'

describe MergeRequests::ResolvedDiscussionNotificationService do
  let(:merge_request) { create(:merge_request) }
  let(:user) { create(:user) }
  let(:project) { merge_request.project }
  subject { described_class.new(project, user) }

  describe "#execute" do
    context "when not all discussions are resolved" do
      before do
        allow(merge_request).to receive(:discussions_resolved?).and_return(false)
      end

      it "doesn't add a system note" 


      it "doesn't send a notification email" 

    end

    context "when all discussions are resolved" do
      before do
        allow(merge_request).to receive(:discussions_resolved?).and_return(true)
      end

      it "adds a system note" 


      it "sends a notification email" 

    end
  end
end

