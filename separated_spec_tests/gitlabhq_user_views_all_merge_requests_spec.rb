require 'spec_helper'

describe 'User views all merge requests' do
  let!(:closed_merge_request) { create(:closed_merge_request, source_project: project, target_project: project) }
  let!(:merge_request) { create(:merge_request, source_project: project, target_project: project) }
  let(:project) { create(:project, :public) }

  before do
    visit(project_merge_requests_path(project, state: :all))
  end

  it 'shows all merge requests' 

end

