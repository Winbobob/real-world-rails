require 'spec_helper'
require 'html/pipeline'

describe Banzai::Filter::LabelReferenceFilter do
  include FilterSpecHelper

  let(:project)   { create(:project, :public, name: 'sample-project') }
  let(:label)     { create(:label, project: project) }
  let(:reference) { label.to_reference }

  it 'requires project context' 


  %w(pre code a style).each do |elem|
    it "ignores valid references contained inside '#{elem}' element" 

  end

  it 'includes default classes' 


  it 'includes a data-project attribute' 


  it 'includes a data-label attribute' 


  it 'supports an :only_path context' 


  context 'project that does not exist referenced' do
    let(:result) { reference_filter('aaa/bbb~ccc') }

    it 'does not link reference' 

  end

  describe 'label span element' do
    it 'includes default classes' 


    it 'includes a style attribute' 

  end

  context 'Integer-based references' do
    it 'links to a valid reference' 


    it 'links with adjacent text' 


    it 'ignores invalid label IDs' 

  end

  context 'String-based single-word references' do
    let(:label)     { create(:label, name: 'gfm', project: project) }
    let(:reference) { "#{Label.reference_prefix}#{label.name}" }

    it 'links to a valid reference' 


    it 'links with adjacent text' 


    it 'ignores invalid label names' 

  end

  context 'String-based single-word references that begin with a digit' do
    let(:label)     { create(:label, name: '2fa', project: project) }
    let(:reference) { "#{Label.reference_prefix}#{label.name}" }

    it 'links to a valid reference' 


    it 'links with adjacent text' 


    it 'ignores invalid label names' 

  end

  context 'String-based single-word references with special characters' do
    let(:label)     { create(:label, name: '?g.fm&', project: project) }
    let(:reference) { "#{Label.reference_prefix}#{label.name}" }

    it 'links to a valid reference' 


    it 'links with adjacent text' 


    it 'ignores invalid label names' 

  end

  context 'String-based multi-word references in quotes' do
    let(:label)     { create(:label, name: 'gfm references', project: project) }
    let(:reference) { label.to_reference(format: :name) }

    it 'links to a valid reference' 


    it 'links with adjacent text' 


    it 'ignores invalid label names' 

  end

  context 'String-based multi-word references that begin with a digit' do
    let(:label)     { create(:label, name: '2 factor authentication', project: project) }
    let(:reference) { label.to_reference(format: :name) }

    it 'links to a valid reference' 


    it 'links with adjacent text' 


    it 'ignores invalid label names' 

  end

  context 'String-based multi-word references with special characters in quotes' do
    let(:label)     { create(:label, name: 'g.fm & references?', project: project) }
    let(:reference) { label.to_reference(format: :name) }

    it 'links to a valid reference' 


    it 'links with adjacent text' 


    it 'ignores invalid label names' 

  end

  describe 'consecutive references' do
    let(:bug) { create(:label, name: 'bug', project: project) }
    let(:feature_proposal) { create(:label, name: 'feature proposal', project: project) }
    let(:technical_debt) { create(:label, name: 'technical debt', project: project) }

    let(:bug_reference) { "#{Label.reference_prefix}#{bug.name}" }
    let(:feature_proposal_reference) { feature_proposal.to_reference(format: :name) }
    let(:technical_debt_reference) { technical_debt.to_reference(format: :name) }

    context 'separated with a comma' do
      let(:references) { "#{bug_reference}, #{feature_proposal_reference}, #{technical_debt_reference}" }

      it 'links to valid references' 

    end

    context 'separated with a space' do
      let(:references) { "#{bug_reference} #{feature_proposal_reference} #{technical_debt_reference}" }

      it 'links to valid references' 

    end
  end

  describe 'edge cases' do
    it 'gracefully handles non-references matching the pattern' 

  end

  describe 'referencing a label in a link href' do
    let(:reference) { %Q{<a href="#{label.to_reference}">Label</a>} }

    it 'links to a valid reference' 


    it 'links with adjacent text' 


    it 'includes a data-project attribute' 


    it 'includes a data-label attribute' 

  end

  describe 'group label references' do
    let(:group)       { create(:group) }
    let(:project)     { create(:project, :public, namespace: group) }
    let(:group_label) { create(:group_label, name: 'gfm references', group: group) }

    context 'without project reference' do
      let(:reference) { group_label.to_reference(format: :name) }

      it 'links to a valid reference' 


      it 'links with adjacent text' 


      it 'ignores invalid label names' 

    end

    context 'with project reference' do
      let(:reference) { "#{project.to_reference}#{group_label.to_reference(format: :name)}" }

      it 'links to a valid reference' 


      it 'links with adjacent text' 


      it 'ignores invalid label names' 

    end
  end

  describe 'cross-project / cross-namespace complete reference' do
    let(:project2)  { create(:project) }
    let(:label)     { create(:label, project: project2, color: '#00ff00') }
    let(:reference) { "#{project2.full_path}~#{label.name}" }
    let!(:result)   { reference_filter("See #{reference}") }

    it 'links to a valid reference' 


    it 'has valid color' 


    it 'has valid link text' 


    it 'has valid text' 


    it 'ignores invalid IDs on the referenced label' 

  end

  describe 'cross-project / same-namespace complete reference' do
    let(:namespace) { create(:namespace) }
    let(:project)   { create(:project, namespace: namespace) }
    let(:project2)  { create(:project, namespace: namespace) }
    let(:label)     { create(:label, project: project2, color: '#00ff00') }
    let(:reference) { "#{project2.full_path}~#{label.name}" }
    let!(:result)   { reference_filter("See #{reference}") }

    it 'links to a valid reference' 


    it 'has valid color' 


    it 'has valid link text' 


    it 'has valid text' 


    it 'ignores invalid IDs on the referenced label' 

  end

  describe 'cross-project shorthand reference' do
    let(:namespace) { create(:namespace) }
    let(:project)   { create(:project, namespace: namespace) }
    let(:project2)  { create(:project, namespace: namespace) }
    let(:label)     { create(:label, project: project2, color: '#00ff00') }
    let(:reference) { "#{project2.path}~#{label.name}" }
    let!(:result)   { reference_filter("See #{reference}") }

    it 'links to a valid reference' 


    it 'has valid color' 


    it 'has valid link text' 


    it 'has valid text' 


    it 'ignores invalid IDs on the referenced label' 

  end

  describe 'cross group label references' do
    let(:group)            { create(:group) }
    let(:project)          { create(:project, :public, namespace: group) }
    let(:another_group)    { create(:group) }
    let(:another_project)  { create(:project, :public, namespace: another_group) }
    let(:group_label)      { create(:group_label, group: another_group, color: '#00ff00') }
    let(:reference)        { "#{another_project.full_path}~#{group_label.name}" }
    let!(:result)          { reference_filter("See #{reference}", project: project) }

    it 'points to referenced project issues page' 


    it 'has valid color' 


    it 'has valid link text' 


    it 'has valid text' 


    it 'ignores invalid IDs on the referenced label' 

  end

  describe 'cross-project / same-group_label complete reference' do
    let(:group)            { create(:group) }
    let(:project)          { create(:project, :public, namespace: group) }
    let(:another_project)  { create(:project, :public, namespace: group) }
    let(:group_label)      { create(:group_label, group: group, color: '#00ff00') }
    let(:reference)        { "#{another_project.full_path}~#{group_label.name}" }
    let!(:result)          { reference_filter("See #{reference}", project: project) }

    it 'points to referenced project issues page' 


    it 'has valid color' 


    it 'has valid link text' 


    it 'has valid text' 


    it 'ignores invalid IDs on the referenced label' 

  end

  describe 'same project / same group_label complete reference' do
    let(:group)       { create(:group) }
    let(:project)     { create(:project, :public, namespace: group) }
    let(:group_label) { create(:group_label, group: group, color: '#00ff00') }
    let(:reference)   { "#{project.full_path}~#{group_label.name}" }
    let!(:result)     { reference_filter("See #{reference}", project: project) }

    it 'points to referenced project issues page' 


    it 'has valid color' 


    it 'has valid link text' 


    it 'has valid text' 


    it 'ignores invalid IDs on the referenced label' 

  end

  describe 'same project / same group_label shorthand reference' do
    let(:group)       { create(:group) }
    let(:project)     { create(:project, :public, namespace: group) }
    let(:group_label) { create(:group_label, group: group, color: '#00ff00') }
    let(:reference)   { "#{project.path}~#{group_label.name}" }
    let!(:result)     { reference_filter("See #{reference}", project: project) }

    it 'points to referenced project issues page' 


    it 'has valid color' 


    it 'has valid link text' 


    it 'has valid text' 


    it 'ignores invalid IDs on the referenced label' 

  end

  describe 'group context' do
    it 'points to the page defined in label_url_method' 


    it 'finds labels also in ancestor groups' 


    it 'points to referenced project issues page' 

  end
end

