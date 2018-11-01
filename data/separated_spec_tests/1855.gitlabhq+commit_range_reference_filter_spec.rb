require 'spec_helper'

describe Banzai::Filter::CommitRangeReferenceFilter do
  include FilterSpecHelper

  let(:project) { create(:project, :public, :repository) }
  let(:commit1) { project.commit("HEAD~2") }
  let(:commit2) { project.commit }

  let(:range)  { CommitRange.new("#{commit1.id}...#{commit2.id}", project) }
  let(:range2) { CommitRange.new("#{commit1.id}..#{commit2.id}", project) }

  it 'requires project context' 


  %w(pre code a style).each do |elem|
    it "ignores valid references contained inside '#{elem}' element" 

  end

  context 'internal reference' do
    let(:reference)  { range.to_reference }
    let(:reference2) { range2.to_reference }

    it 'links to a valid two-dot reference' 


    it 'links to a valid three-dot reference' 


    it 'links to a valid short ID' 


    it 'links with adjacent text' 


    it 'ignores invalid commit IDs' 


    it 'includes no title attribute' 


    it 'includes default classes' 


    it 'includes a data-project attribute' 


    it 'includes a data-commit-range attribute' 


    it 'supports an :only_path option' 

  end

  context 'cross-project / cross-namespace complete reference' do
    let(:project2)  { create(:project, :public, :repository) }
    let(:reference) { "#{project2.full_path}@#{commit1.id}...#{commit2.id}" }

    it 'links to a valid reference' 


    it 'link has valid text' 


    it 'has valid text' 


    it 'ignores invalid commit IDs on the referenced project' 

  end

  context 'cross-project / same-namespace complete reference' do
    let(:namespace)         { create(:namespace) }
    let(:project)           { create(:project, :public, :repository, namespace: namespace) }
    let(:project2)          { create(:project, :public, :repository, path: "same-namespace", namespace: namespace) }
    let(:reference)         { "#{project2.path}@#{commit1.id}...#{commit2.id}" }

    it 'links to a valid reference' 


    it 'link has valid text' 


    it 'has valid text' 


    it 'ignores invalid commit IDs on the referenced project' 

  end

  context 'cross-project shorthand reference' do
    let(:namespace)         { create(:namespace) }
    let(:project)           { create(:project, :public, :repository, namespace: namespace) }
    let(:project2)          { create(:project, :public, :repository, path: "same-namespace", namespace: namespace) }
    let(:reference)         { "#{project2.path}@#{commit1.id}...#{commit2.id}" }

    it 'links to a valid reference' 


    it 'link has valid text' 


    it 'has valid text' 


    it 'ignores invalid commit IDs on the referenced project' 

  end

  context 'cross-project URL reference' do
    let(:namespace) { create(:namespace) }
    let(:project2)  { create(:project, :public, :repository, namespace: namespace) }
    let(:range)  { CommitRange.new("#{commit1.id}...master", project) }
    let(:reference) { urls.project_compare_url(project2, from: commit1.id, to: 'master') }

    before do
      range.project = project2
    end

    it 'links to a valid reference' 


    it 'links with adjacent text' 


    it 'ignores invalid commit IDs on the referenced project' 

  end

  context 'group context' do
    let(:context) { { project: nil, group: create(:group) } }

    it 'ignores internal references' 


    it 'links to a full-path reference' 

  end
end

