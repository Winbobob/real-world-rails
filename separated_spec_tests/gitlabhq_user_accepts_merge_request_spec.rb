require 'spec_helper'

describe 'User accepts a merge request', :js do
  let(:merge_request) { create(:merge_request, :with_diffs, :simple, source_project: project) }
  let(:project) { create(:project, :public, :repository) }
  let(:user) { create(:user) }

  before do
    project.add_developer(user)
    sign_in(user)
  end

  it 'presents merged merge request content' 


  context 'with removing the source branch' do
    before do
      visit(merge_request_path(merge_request))
    end

    it 'accepts a merge request' 

  end

  context 'without removing the source branch' do
    before do
      visit(merge_request_path(merge_request))
    end

    it 'accepts a merge request' 

  end

  context 'when a URL has an anchor' do
    before do
      visit(merge_request_path(merge_request, anchor: 'note_123'))
    end

    it 'accepts a merge request' 

  end

  context 'when modifying the merge commit message' do
    before do
      merge_request.mark_as_mergeable

      visit(merge_request_path(merge_request))
    end

    it 'accepts a merge request' 

  end
end

