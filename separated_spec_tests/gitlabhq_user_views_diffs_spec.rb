require 'spec_helper'

describe 'User views diffs', :js do
  let(:merge_request) do
    create(:merge_request_with_diffs, source_project: project, target_project: project, source_branch: 'merge-test')
  end
  let(:project) { create(:project, :public, :repository) }

  before do
    visit(diffs_project_merge_request_path(project, merge_request))

    wait_for_requests
  end

  shared_examples 'unfold diffs' do
    it 'unfolds diffs' 

  end

  it 'shows diffs' 


  context 'when in the inline view' do
    include_examples 'unfold diffs'
  end

  context 'when in the side-by-side view' do
    before do
      click_link('Side-by-side')

      wait_for_requests
    end

    it 'shows diffs in parallel' 


    include_examples 'unfold diffs'
  end
end

