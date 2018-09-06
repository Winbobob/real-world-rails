require 'rails_helper'

describe 'Merge request > User sees notes from forked project', :js do
  let(:project) { create(:project, :public, :repository) }
  let(:user) { project.creator }
  let(:fork_project) { create(:project, :public, :repository, forked_from_project: project) }
  let!(:merge_request) do
    create(:merge_request_with_diffs, source_project: fork_project,
                                      target_project: project,
                                      description: 'Test merge request')
  end

  before do
    create(:note_on_commit, note: 'A commit comment',
                            project: fork_project,
                            commit_id: merge_request.commit_shas.first)
    sign_in(user)
  end

  it 'user can reply to the comment' 

end

