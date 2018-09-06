require 'spec_helper'

describe Banzai::Filter::CommitReferenceFilter do
  include FilterSpecHelper

  let(:project) { create(:project, :public, :repository) }
  let(:commit)  { project.commit }

  it 'requires project context' 


  %w(pre code a style).each do |elem|
    it "ignores valid references contained inside '#{elem}' element" 

  end

  context 'internal reference' do
    let(:reference) { commit.id }

    # Let's test a variety of commit SHA sizes just to be paranoid
    [7, 8, 12, 18, 20, 32, 40].each do |size|
      it "links to a valid reference of #{size} characters" 

    end

    it 'always uses the short ID as the link text' 


    it 'links with adjacent text' 


    it 'ignores invalid commit IDs' 


    it 'includes a title attribute' 


    it 'escapes the title attribute' 


    it 'includes default classes' 


    it 'includes a data-project attribute' 


    it 'includes a data-commit attribute' 


    it 'supports an :only_path context' 


    context "in merge request context" do
      let(:noteable) { create(:merge_request, target_project: project, source_project: project) }
      let(:commit) { noteable.commits.first }

      it 'handles merge request contextual commit references' 

    end
  end

  context 'cross-project / cross-namespace complete reference' do
    let(:namespace) { create(:namespace) }
    let(:project2)  { create(:project, :public, :repository, namespace: namespace) }
    let(:commit)    { project2.commit }
    let(:reference) { "#{project2.full_path}@#{commit.short_id}" }

    it 'link has valid text' 


    it 'has valid text' 


    it 'ignores invalid commit IDs on the referenced project' 

  end

  context 'cross-project / same-namespace complete reference' do
    let(:namespace) { create(:namespace) }
    let(:project)   { create(:project, namespace: namespace) }
    let(:project2)  { create(:project, :public, :repository, namespace: namespace) }
    let(:commit)    { project2.commit }
    let(:reference) { "#{project2.full_path}@#{commit.short_id}" }

    it 'link has valid text' 


    it 'has valid text' 


    it 'ignores invalid commit IDs on the referenced project' 

  end

  context 'cross-project shorthand reference' do
    let(:namespace) { create(:namespace) }
    let(:project)   { create(:project, namespace: namespace) }
    let(:project2)  { create(:project, :public, :repository, namespace: namespace) }
    let(:commit)    { project2.commit }
    let(:reference) { "#{project2.full_path}@#{commit.short_id}" }

    it 'link has valid text' 


    it 'has valid text' 


    it 'ignores invalid commit IDs on the referenced project' 

  end

  context 'cross-project URL reference' do
    let(:namespace) { create(:namespace) }
    let(:project2)  { create(:project, :public, :repository, namespace: namespace) }
    let(:commit)    { project2.commit }
    let(:reference) { urls.project_commit_url(project2, commit.id) }

    it 'links to a valid reference' 


    it 'links with adjacent text' 


    it 'ignores invalid commit IDs on the referenced project' 

  end

  context 'URL reference for a commit patch' do
    let(:namespace) { create(:namespace) }
    let(:project2)  { create(:project, :public, :repository, namespace: namespace) }
    let(:commit)    { project2.commit }
    let(:link)      { urls.project_commit_url(project2, commit.id) }
    let(:extension) { '.patch' }
    let(:reference) { link + extension }

    it 'links to a valid reference' 


    it 'has valid text' 


    it 'does not link to patch when extension match is after the path' 

  end

  context 'group context' do
    let(:context) { { project: nil, group: create(:group) } }

    it 'ignores internal references' 


    it 'links to a valid reference' 

  end
end

