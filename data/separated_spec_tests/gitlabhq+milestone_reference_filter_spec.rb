require 'spec_helper'

describe Banzai::Filter::MilestoneReferenceFilter do
  include FilterSpecHelper

  let(:parent_group) { create(:group, :public) }
  let(:group) { create(:group, :public, parent: parent_group) }
  let(:project) { create(:project, :public, group: group) }

  it 'requires project context' 


  shared_examples 'reference parsing' do
    %w(pre code a style).each do |elem|
      it "ignores valid references contained inside '#{elem}' element" 

    end

    it 'includes default classes' 


    it 'includes a data-project attribute' 


    it 'includes a data-milestone attribute' 


    it 'supports an :only_path context' 

  end

  shared_examples 'Integer-based references' do
    it 'links to a valid reference' 


    it 'links with adjacent text' 


    it 'ignores invalid milestone IIDs' 

  end

  shared_examples 'String-based single-word references' do
    let(:reference) { "#{Milestone.reference_prefix}#{milestone.name}" }

    before do
      milestone.update!(name: 'gfm')
    end

    it 'links to a valid reference' 


    it 'links with adjacent text' 


    it 'ignores invalid milestone names' 

  end

  shared_examples 'String-based multi-word references in quotes' do
    let(:reference) { milestone.to_reference(format: :name) }

    before do
      milestone.update!(name: 'gfm references')
    end

    it 'links to a valid reference' 


    it 'links with adjacent text' 


    it 'ignores invalid milestone names' 

  end

  shared_examples 'referencing a milestone in a link href' do
    let(:unquoted_reference) { "#{Milestone.reference_prefix}#{milestone.name}" }
    let(:link_reference) { %Q{<a href="#{unquoted_reference}">Milestone</a>} }

    before do
      milestone.update!(name: 'gfm')
    end

    it 'links to a valid reference' 


    it 'links with adjacent text' 


    it 'includes a data-project attribute' 


    it 'includes a data-milestone attribute' 

  end

  shared_examples 'linking to a milestone as the entire link' do
    let(:unquoted_reference) { "#{Milestone.reference_prefix}#{milestone.name}" }
    let(:link) { urls.milestone_url(milestone) }
    let(:link_reference) { %Q{<a href="#{link}">#{link}</a>} }

    it 'replaces the link text with the milestone reference' 


    it 'includes a data-project attribute' 


    it 'includes a data-milestone attribute' 

  end

  shared_examples 'cross-project / cross-namespace complete reference' do
    let(:namespace)       { create(:namespace) }
    let(:another_project) { create(:project, :public, namespace: namespace) }
    let(:milestone)       { create(:milestone, project: another_project) }
    let(:reference)       { "#{another_project.full_path}%#{milestone.iid}" }
    let!(:result)         { reference_filter("See #{reference}") }

    it 'points to referenced project milestone page' 


    it 'link has valid text' 


    it 'has valid text' 


    it 'escapes the name attribute' 

  end

  shared_examples 'cross-project / same-namespace complete reference' do
    let(:namespace)       { create(:namespace) }
    let(:project)         { create(:project, :public, namespace: namespace) }
    let(:another_project) { create(:project, :public, namespace: namespace) }
    let(:milestone)       { create(:milestone, project: another_project) }
    let(:reference)       { "#{another_project.full_path}%#{milestone.iid}" }
    let!(:result)         { reference_filter("See #{reference}") }

    it 'points to referenced project milestone page' 


    it 'link has valid text' 


    it 'has valid text' 


    it 'escapes the name attribute' 

  end

  shared_examples 'cross project shorthand reference' do
    let(:namespace)       { create(:namespace) }
    let(:project)         { create(:project, :public, namespace: namespace) }
    let(:another_project) { create(:project, :public, namespace: namespace) }
    let(:milestone)       { create(:milestone, project: another_project) }
    let(:reference)       { "#{another_project.path}%#{milestone.iid}" }
    let!(:result)         { reference_filter("See #{reference}") }

    it 'points to referenced project milestone page' 


    it 'link has valid text' 


    it 'has valid text' 


    it 'escapes the name attribute' 

  end

  shared_context 'project milestones' do
    let(:reference) { milestone.to_reference(format: :iid) }

    include_examples 'reference parsing'

    it_behaves_like 'Integer-based references'
    it_behaves_like 'String-based single-word references'
    it_behaves_like 'String-based multi-word references in quotes'
    it_behaves_like 'referencing a milestone in a link href'
    it_behaves_like 'cross-project / cross-namespace complete reference'
    it_behaves_like 'cross-project / same-namespace complete reference'
    it_behaves_like 'cross project shorthand reference'
  end

  shared_context 'group milestones' do
    let(:reference) { milestone.to_reference(format: :name) }

    include_examples 'reference parsing'

    it_behaves_like 'String-based single-word references'
    it_behaves_like 'String-based multi-word references in quotes'
    it_behaves_like 'referencing a milestone in a link href'

    it 'does not support references by IID' 


    it 'does not support references by link' 


    it 'does not support cross-project references' 


    it 'supports parent group references', :nested_groups do
      milestone.update!(group: parent_group)

      doc = reference_filter("See #{reference}")
      expect(doc.css('a').first.text).to eq(milestone.name)
    end
  end

  context 'group context' do
    let(:context) { { project: nil, group: create(:group) } }
    let(:milestone) { create(:milestone, project: project) }

    it 'links to a valid reference' 


    it 'ignores internal references' 

  end

  context 'when milestone is open' do
    context 'project milestones' do
      let(:milestone) { create(:milestone, project: project) }

      include_context 'project milestones'
    end

    context 'group milestones' do
      let(:milestone) { create(:milestone, group: group) }

      include_context 'group milestones'
    end
  end

  context 'when milestone is closed' do
    context 'project milestones' do
      let(:milestone) { create(:milestone, :closed, project: project) }

      include_context 'project milestones'
    end

    context 'group milestones' do
      let(:milestone) { create(:milestone, :closed, group: group) }

      include_context 'group milestones'
    end
  end
end

