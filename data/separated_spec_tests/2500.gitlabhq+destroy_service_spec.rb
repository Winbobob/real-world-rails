require 'spec_helper'

describe Notes::DestroyService do
  set(:project) { create(:project, :public) }
  set(:issue) { create(:issue, project: project) }
  let(:user) { issue.author }

  describe '#execute' do
    it 'deletes a note' 


    it 'updates the todo counts for users with todos for the note' 

  end
end

