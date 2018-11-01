require 'spec_helper'

describe Banzai::Filter::SnippetReferenceFilter do
  include FilterSpecHelper

  let(:project)   { create(:project, :public) }
  let(:snippet)   { create(:project_snippet, project: project) }
  let(:reference) { snippet.to_reference }

  it 'requires project context' 


  %w(pre code a style).each do |elem|
    it "ignores valid references contained inside '#{elem}' element" 

  end

  context 'internal reference' do
    it 'links to a valid reference' 


    it 'links with adjacent text' 


    it 'ignores invalid snippet IDs' 


    it 'includes a title attribute' 


    it 'escapes the title attribute' 


    it 'includes default classes' 


    it 'includes a data-project attribute' 


    it 'includes a data-snippet attribute' 


    it 'supports an :only_path context' 

  end

  context 'cross-project / cross-namespace complete reference' do
    let(:namespace) { create(:namespace) }
    let(:project2)  { create(:project, :public, namespace: namespace) }
    let!(:snippet)  { create(:project_snippet, project: project2) }
    let(:reference) { "#{project2.full_path}$#{snippet.id}" }

    it 'links to a valid reference' 


    it 'link has valid text' 


    it 'has valid text' 


    it 'ignores invalid snippet IDs on the referenced project' 

  end

  context 'cross-project / same-namespace complete reference' do
    let(:namespace) { create(:namespace) }
    let(:project)   { create(:project, :public, namespace: namespace) }
    let(:project2)  { create(:project, :public, namespace: namespace) }
    let!(:snippet)  { create(:project_snippet, project: project2) }
    let(:reference) { "#{project2.full_path}$#{snippet.id}" }

    it 'links to a valid reference' 


    it 'link has valid text' 


    it 'has valid text' 


    it 'ignores invalid snippet IDs on the referenced project' 

  end

  context 'cross-project shorthand reference' do
    let(:namespace) { create(:namespace) }
    let(:project)   { create(:project, :public, namespace: namespace) }
    let(:project2)  { create(:project, :public, namespace: namespace) }
    let!(:snippet)  { create(:project_snippet, project: project2) }
    let(:reference) { "#{project2.path}$#{snippet.id}" }

    it 'links to a valid reference' 


    it 'link has valid text' 


    it 'has valid text' 


    it 'ignores invalid snippet IDs on the referenced project' 

  end

  context 'cross-project URL reference' do
    let(:namespace) { create(:namespace, name: 'cross-reference') }
    let(:project2)  { create(:project, :public, namespace: namespace) }
    let(:snippet)   { create(:project_snippet, project: project2) }
    let(:reference) { urls.project_snippet_url(project2, snippet) }

    it 'links to a valid reference' 


    it 'links with adjacent text' 


    it 'ignores invalid snippet IDs on the referenced project' 

  end

  context 'group context' do
    it 'links to a valid reference' 


    it 'ignores internal references' 

  end
end

