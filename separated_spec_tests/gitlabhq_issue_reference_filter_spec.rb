require 'spec_helper'

describe Banzai::Filter::IssueReferenceFilter do
  include FilterSpecHelper

  def helper
    IssuesHelper
  end

  let(:project) { create(:project, :public) }
  let(:issue)  { create(:issue, project: project) }

  it 'requires project context' 


  %w(pre code a style).each do |elem|
    it "ignores valid references contained inside '#{elem}' element" 

  end

  describe 'performance' do
    let(:another_issue) { create(:issue, project: project) }

    it 'does not have a N+1 query problem' 

  end

  context 'internal reference' do
    it_behaves_like 'a reference containing an element node'

    let(:reference) { "##{issue.iid}" }

    it 'links to a valid reference' 


    it 'links with adjacent text' 


    it 'ignores invalid issue IDs' 


    it 'includes a title attribute' 


    it 'escapes the title attribute' 


    it 'includes default classes' 


    it 'includes a data-project attribute' 


    it 'includes a data-issue attribute' 


    it 'includes a data-original attribute' 


    it 'does not escape the data-original attribute' 


    it 'supports an :only_path context' 


    it 'does not process links containing issue numbers followed by text' 

  end

  context 'cross-project / cross-namespace complete reference' do
    it_behaves_like 'a reference containing an element node'

    let(:project2)  { create(:project, :public) }
    let(:issue)     { create(:issue, project: project2) }
    let(:reference) { "#{project2.full_path}##{issue.iid}" }

    it 'ignores valid references when cross-reference project uses external tracker' 


    it 'links to a valid reference' 


    it 'link has valid text' 


    it 'has valid text' 


    it 'includes default classes' 


    it 'ignores invalid issue IDs on the referenced project' 

  end

  context 'cross-project / same-namespace complete reference' do
    it_behaves_like 'a reference containing an element node'

    let(:namespace) { create(:namespace) }
    let(:project)   { create(:project, :public, namespace: namespace) }
    let(:project2)  { create(:project, :public, namespace: namespace) }
    let(:issue)     { create(:issue, project: project2) }
    let(:reference) { "#{project2.full_path}##{issue.iid}" }

    it 'ignores valid references when cross-reference project uses external tracker' 


    it 'links to a valid reference' 


    it 'link has valid text' 


    it 'has valid text' 


    it 'includes default classes' 


    it 'ignores invalid issue IDs on the referenced project' 

  end

  context 'cross-project shorthand reference' do
    it_behaves_like 'a reference containing an element node'

    let(:namespace) { create(:namespace) }
    let(:project)   { create(:project, :public, namespace: namespace) }
    let(:project2)  { create(:project, :public, namespace: namespace) }
    let(:issue)     { create(:issue, project: project2) }
    let(:reference) { "#{project2.path}##{issue.iid}" }

    it 'ignores valid references when cross-reference project uses external tracker' 


    it 'links to a valid reference' 


    it 'link has valid text' 


    it 'has valid text' 


    it 'includes default classes' 


    it 'ignores invalid issue IDs on the referenced project' 

  end

  context 'cross-project URL reference' do
    it_behaves_like 'a reference containing an element node'

    let(:namespace) { create(:namespace, name: 'cross-reference') }
    let(:project2)  { create(:project, :public, namespace: namespace) }
    let(:issue)     { create(:issue, project: project2) }
    let(:reference) { helper.url_for_issue(issue.iid, project2) + "#note_123" }

    it 'links to a valid reference' 


    it 'links with adjacent text' 


    it 'includes default classes' 

  end

  context 'cross-project reference in link href' do
    it_behaves_like 'a reference containing an element node'

    let(:namespace) { create(:namespace, name: 'cross-reference') }
    let(:project2)  { create(:project, :public, namespace: namespace) }
    let(:issue)     { create(:issue, project: project2) }
    let(:reference) { issue.to_reference(project) }
    let(:reference_link) { %{<a href="#{reference}">Reference</a>} }

    it 'links to a valid reference' 


    it 'links with adjacent text' 


    it 'includes default classes' 

  end

  context 'cross-project URL in link href' do
    it_behaves_like 'a reference containing an element node'

    let(:namespace) { create(:namespace, name: 'cross-reference') }
    let(:project2)  { create(:project, :public, namespace: namespace) }
    let(:issue)     { create(:issue, project: project2) }
    let(:reference) { "#{helper.url_for_issue(issue.iid, project2) + "#note_123"}" }
    let(:reference_link) { %{<a href="#{reference}">Reference</a>} }

    it 'links to a valid reference' 


    it 'links with adjacent text' 


    it 'includes default classes' 

  end

  context 'group context' do
    let(:group) { create(:group) }
    let(:context) { { project: nil, group: group } }

    it 'ignores shorthanded issue reference' 


    it 'ignores valid references when cross-reference project uses external tracker' 


    it 'links to a valid reference for complete cross-reference' 


    it 'ignores reference for shorthand cross-reference' 


    it 'links to a valid reference for url cross-reference' 


    it 'links to a valid reference for cross-reference in link href' 


    it 'links to a valid reference for issue reference in the link href' 

  end

  describe '#records_per_parent' do
    context 'using an internal issue tracker' do
      it 'returns a Hash containing the issues per project' 

    end
  end

  describe '.references_in' do
    let(:merge_request)  { create(:merge_request) }

    it 'yields valid references' 


    it "doesn't yield invalid references" 


    it "doesn't yield unsupported references" 

  end
end

