require 'spec_helper'

describe Resolvers::MergeRequestResolver do
  include GraphqlHelpers

  set(:project) { create(:project, :repository) }
  set(:merge_request_1) { create(:merge_request, :simple, source_project: project, target_project: project) }
  set(:merge_request_2) { create(:merge_request, :rebased, source_project: project, target_project: project) }

  set(:other_project) { create(:project, :repository) }
  set(:other_merge_request) { create(:merge_request, source_project: other_project, target_project: other_project) }

  let(:iid_1) { merge_request_1.iid }
  let(:iid_2) { merge_request_2.iid }

  let(:other_iid) { other_merge_request.iid }

  describe '#resolve' do
    it 'batch-resolves merge requests by target project full path and IID' 


    it 'can batch-resolve merge requests from different projects' 


    it 'resolves an unknown iid to nil' 

  end

  def resolve_mr(project, iid)
    resolve(described_class, obj: project, args: { iid: iid })
  end
end

