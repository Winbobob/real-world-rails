require 'spec_helper'

describe Banzai::ReferenceParser::IssueParser do
  include ReferenceParserHelpers

  let(:project) { create(:project, :public) }
  let(:user)    { create(:user) }
  let(:issue)   { create(:issue, project: project) }
  let(:link)    { empty_html_link }
  subject       { described_class.new(Banzai::RenderContext.new(project, user)) }

  describe '#nodes_visible_to_user' do
    context 'when the link has a data-issue attribute' do
      before do
        link['data-issue'] = issue.id.to_s
      end

      it_behaves_like "referenced feature visibility", "issues"

      it 'returns the nodes when the user can read the issue' 


      it 'returns an empty Array when the user can not read the issue' 


      context 'when the user cannot read cross project' do
        let(:issue) { create(:issue) }

        before do
          allow(Ability).to receive(:allowed?).with(user, :read_cross_project) { false }
          allow(Ability).to receive(:allowed?).with(user, :read_cross_project, :global) { false }
        end

        it 'returns the nodes when the user can read the issue' 


        it 'returns an empty Array when the user can not read the issue' 


        context 'when the issue is not cross project' do
          let(:issue) { create(:issue, project: project) }

          it 'does not check `can_read_reference` if the issue is not cross project' 

        end
      end
    end

    context 'when the link does not have a data-issue attribute' do
      it 'returns an empty Array' 

    end
  end

  describe '#referenced_by' do
    context 'when the link has a data-issue attribute' do
      context 'using an existing issue ID' do
        before do
          link['data-issue'] = issue.id.to_s
        end

        it 'returns an Array of issues' 


        it 'returns an empty Array when the list of nodes is empty' 

      end

      context 'when issue with given ID does not exist' do
        before do
          link['data-issue'] = '-1'
        end

        it 'returns an empty Array' 

      end
    end
  end

  describe '#records_for_nodes' do
    it 'returns a Hash containing the issues for a list of nodes' 

  end

  context 'when checking multiple merge requests on another project' do
    let(:other_project) { create(:project, :public) }
    let(:other_issue) { create(:issue, project: other_project) }

    let(:control_links) do
      [issue_link(other_issue)]
    end

    let(:actual_links) do
      control_links + [issue_link(create(:issue, project: other_project))]
    end

    def issue_link(issue)
      Nokogiri::HTML.fragment(%Q{<a data-issue="#{issue.id}"></a>}).children[0]
    end

    before do
      project.add_developer(user)
    end

    it_behaves_like 'no N+1 queries'
  end
end

