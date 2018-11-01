require 'spec_helper'

describe Banzai::Filter::MergeRequestReferenceFilter do
  include FilterSpecHelper

  let(:project) { create(:project, :public) }
  let(:merge)   { create(:merge_request, source_project: project) }

  it 'requires project context' 


  %w(pre code a style).each do |elem|
    it "ignores valid references contained inside '#{elem}' element" 

  end

  describe 'performance' do
    let(:another_merge) { create(:merge_request, source_project: project, source_branch: 'fix') }

    it 'does not have a N+1 query problem' 

  end

  context 'internal reference' do
    let(:reference) { merge.to_reference }

    it 'links to a valid reference' 


    it 'links with adjacent text' 


    it 'ignores invalid merge IDs' 


    it 'ignores out-of-bounds merge request IDs on the referenced project' 


    it 'includes a title attribute' 


    it 'escapes the title attribute' 


    it 'includes default classes' 


    it 'includes a data-project attribute' 


    it 'includes a data-merge-request attribute' 


    it 'supports an :only_path context' 

  end

  context 'cross-project / cross-namespace complete reference' do
    let(:project2)          { create(:project, :public) }
    let(:merge)             { create(:merge_request, source_project: project2) }
    let(:reference)         { "#{project2.full_path}!#{merge.iid}" }

    it 'links to a valid reference' 


    it 'link has valid text' 


    it 'has valid text' 


    it 'ignores invalid merge IDs on the referenced project' 

  end

  context 'cross-project / same-namespace complete reference' do
    let(:namespace) { create(:namespace) }
    let(:project)   { create(:project, :public, namespace: namespace) }
    let(:project2)  { create(:project, :public, namespace: namespace) }
    let!(:merge)    { create(:merge_request, source_project: project2) }
    let(:reference) { "#{project2.full_path}!#{merge.iid}" }

    it 'links to a valid reference' 


    it 'link has valid text' 


    it 'has valid text' 


    it 'ignores invalid merge IDs on the referenced project' 

  end

  context 'cross-project shorthand reference' do
    let(:namespace) { create(:namespace) }
    let(:project)   { create(:project, :public, namespace: namespace) }
    let(:project2)  { create(:project, :public, namespace: namespace) }
    let!(:merge)    { create(:merge_request, source_project: project2) }
    let(:reference) { "#{project2.path}!#{merge.iid}" }

    it 'links to a valid reference' 


    it 'link has valid text' 


    it 'has valid text' 


    it 'ignores invalid merge IDs on the referenced project' 

  end

  context 'URL reference for a commit' do
    let(:mr) { create(:merge_request, :with_diffs) }
    let(:reference) do
      urls.project_merge_request_url(mr.project, mr) + "/diffs?commit_id=#{mr.diff_head_sha}"
    end
    let(:commit) { mr.commits.find { |commit| commit.sha == mr.diff_head_sha } }

    it 'links to a valid reference' 


    it 'commit ref tag is valid' 


    it 'has valid text' 


    it 'has valid title attribute' 


    it 'ignores invalid commit short_ids on link text' 

  end

  context 'cross-project URL reference' do
    let(:namespace) { create(:namespace, name: 'cross-reference') }
    let(:project2)  { create(:project, :public, namespace: namespace) }
    let(:merge)     { create(:merge_request, source_project: project2, target_project: project2) }
    let(:reference) { urls.project_merge_request_url(project2, merge) + '/diffs#note_123' }

    it 'links to a valid reference' 


    it 'links with adjacent text' 

  end

  context 'group context' do
    it 'links to a valid reference' 

  end
end

