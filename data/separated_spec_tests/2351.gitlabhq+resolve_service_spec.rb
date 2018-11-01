require 'spec_helper'

describe Discussions::ResolveService do
  describe '#execute' do
    let(:discussion) { create(:diff_note_on_merge_request).to_discussion }
    let(:project) { merge_request.project }
    let(:merge_request) { discussion.noteable }
    let(:user) { create(:user) }
    let(:service) { described_class.new(discussion.noteable.project, user, merge_request: merge_request) }

    before do
      project.add_maintainer(user)
    end

    it "doesn't resolve discussions the user can't resolve" 


    it 'resolves the discussion' 


    it 'executes the notification service' 


    it 'adds a system note to the discussion' 


    it 'can resolve multiple discussions at once' 

  end
end

