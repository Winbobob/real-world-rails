require 'spec_helper'

describe Notes::ResolveService do
  let(:merge_request) { create(:merge_request) }
  let(:note) { create(:diff_note_on_merge_request, noteable: merge_request, project: merge_request.project) }
  let(:user) { merge_request.author }

  describe '#execute' do
    it "resolves the note" 


    it "sends notifications if all discussions are resolved" 

  end
end

