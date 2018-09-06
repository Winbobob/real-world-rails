require 'spec_helper'

describe 'User views merged merge requests' do
  let!(:merge_request) { create(:merge_request, source_project: project, target_project: project) }
  let!(:merged_merge_request) { create(:merged_merge_request, source_project: project, target_project: project) }
  let(:project) { create(:project, :public) }

  before do
    visit(project_merge_requests_path(project, state: :merged))
  end

  it 'shows merged merge requests' 

end

