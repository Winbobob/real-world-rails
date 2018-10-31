require 'spec_helper.rb'

describe Issues::FetchReferencedMergeRequestsService do
  let(:project) { create(:project) }
  let(:issue) { create(:issue, project: project) }
  let(:other_project) { create(:project) }

  let(:mr) { create(:merge_request, source_project: project, target_project: project, id: 2)}
  let(:other_mr) { create(:merge_request, source_project: other_project, target_project: other_project, id: 1)}

  let(:user) { create(:user) }
  let(:service) { described_class.new(project, user) }

  context 'with mentioned merge requests' do
    it 'returns a list of sorted merge requests' 

  end

  context 'with closed-by merge requests' do
    it 'returns a list of sorted merge requests' 

  end
end

