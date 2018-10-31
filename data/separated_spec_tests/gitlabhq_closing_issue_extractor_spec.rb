require 'spec_helper'

describe Gitlab::ClosingIssueExtractor do
  let(:project) { create(:project) }
  let(:project2) { create(:project) }
  let(:forked_project) { Projects::ForkService.new(project, project2.creator).execute }
  let(:issue) { create(:issue, project: project) }
  let(:issue2) { create(:issue, project: project2) }
  let(:reference) { issue.to_reference }
  let(:cross_reference) { issue2.to_reference(project) }
  let(:fork_cross_reference) { issue.to_reference(forked_project) }

  subject { described_class.new(project, project.creator) }

  before do
    project.add_developer(project.creator)
    project.add_developer(project2.creator)
    project2.add_master(project.creator)
  end

  describe "#closed_by_message" do
    context 'with a single reference' do
      it do
        message = "Awesome commit (Closes #{reference})"
        expect(subject.closed_by_message(message)).to eq([issue])
      end

      it do
        message = "Awesome commit (Closes: #{reference})"
        expect(subject.closed_by_message(message)).to eq([issue])
      end

      it do
        message = "Awesome commit (closes #{reference})"
        expect(subject.closed_by_message(message)).to eq([issue])
      end

      it do
        message = "Awesome commit (closes: #{reference})"
        expect(subject.closed_by_message(message)).to eq([issue])
      end

      it do
        message = "Closed #{reference}"
        expect(subject.closed_by_message(message)).to eq([issue])
      end

      it do
        message = "closed #{reference}"
        expect(subject.closed_by_message(message)).to eq([issue])
      end

      it do
        message = "closed: #{reference}"
        expect(subject.closed_by_message(message)).to eq([issue])
      end

      it do
        message = "Closing #{reference}"
        expect(subject.closed_by_message(message)).to eq([issue])
      end

      it do
        message = "Closing: #{reference}"
        expect(subject.closed_by_message(message)).to eq([issue])
      end

      it do
        message = "closing #{reference}"
        expect(subject.closed_by_message(message)).to eq([issue])
      end

      it do
        message = "closing: #{reference}"
        expect(subject.closed_by_message(message)).to eq([issue])
      end

      it do
        message = "Close #{reference}"
        expect(subject.closed_by_message(message)).to eq([issue])
      end

      it do
        message = "Close: #{reference}"
        expect(subject.closed_by_message(message)).to eq([issue])
      end

      it do
        message = "close #{reference}"
        expect(subject.closed_by_message(message)).to eq([issue])
      end

      it do
        message = "close: #{reference}"
        expect(subject.closed_by_message(message)).to eq([issue])
      end

      it do
        message = "Awesome commit (Fixes #{reference})"
        expect(subject.closed_by_message(message)).to eq([issue])
      end

      it do
        message = "Awesome commit (Fixes: #{reference})"
        expect(subject.closed_by_message(message)).to eq([issue])
      end

      it do
        message = "Awesome commit (fixes #{reference})"
        expect(subject.closed_by_message(message)).to eq([issue])
      end

      it do
        message = "Awesome commit (Fixes: #{reference})"
        expect(subject.closed_by_message(message)).to eq([issue])
      end

      it do
        message = "Fixed #{reference}"
        expect(subject.closed_by_message(message)).to eq([issue])
      end

      it do
        message = "Fixed: #{reference}"
        expect(subject.closed_by_message(message)).to eq([issue])
      end

      it do
        message = "fixed #{reference}"
        expect(subject.closed_by_message(message)).to eq([issue])
      end

      it do
        message = "fixed: #{reference}"
        expect(subject.closed_by_message(message)).to eq([issue])
      end

      it do
        message = "Fixing #{reference}"
        expect(subject.closed_by_message(message)).to eq([issue])
      end

      it do
        message = "Fixing: #{reference}"
        expect(subject.closed_by_message(message)).to eq([issue])
      end

      it do
        message = "fixing #{reference}"
        expect(subject.closed_by_message(message)).to eq([issue])
      end

      it do
        message = "fixing: #{reference}"
        expect(subject.closed_by_message(message)).to eq([issue])
      end

      it do
        message = "Fix #{reference}"
        expect(subject.closed_by_message(message)).to eq([issue])
      end

      it do
        message = "Fix: #{reference}"
        expect(subject.closed_by_message(message)).to eq([issue])
      end

      it do
        message = "fix #{reference}"
        expect(subject.closed_by_message(message)).to eq([issue])
      end

      it do
        message = "fix: #{reference}"
        expect(subject.closed_by_message(message)).to eq([issue])
      end

      it do
        message = "Awesome commit (Resolves #{reference})"
        expect(subject.closed_by_message(message)).to eq([issue])
      end

      it do
        message = "Awesome commit (Resolves: #{reference})"
        expect(subject.closed_by_message(message)).to eq([issue])
      end

      it do
        message = "Awesome commit (resolves #{reference})"
        expect(subject.closed_by_message(message)).to eq([issue])
      end

      it do
        message = "Awesome commit (resolves: #{reference})"
        expect(subject.closed_by_message(message)).to eq([issue])
      end

      it do
        message = "Resolved #{reference}"
        expect(subject.closed_by_message(message)).to eq([issue])
      end

      it do
        message = "Resolved: #{reference}"
        expect(subject.closed_by_message(message)).to eq([issue])
      end

      it do
        message = "resolved #{reference}"
        expect(subject.closed_by_message(message)).to eq([issue])
      end

      it do
        message = "resolved: #{reference}"
        expect(subject.closed_by_message(message)).to eq([issue])
      end

      it do
        message = "Resolving #{reference}"
        expect(subject.closed_by_message(message)).to eq([issue])
      end

      it do
        message = "Resolving: #{reference}"
        expect(subject.closed_by_message(message)).to eq([issue])
      end

      it do
        message = "resolving #{reference}"
        expect(subject.closed_by_message(message)).to eq([issue])
      end

      it do
        message = "resolving: #{reference}"
        expect(subject.closed_by_message(message)).to eq([issue])
      end

      it do
        message = "Resolve #{reference}"
        expect(subject.closed_by_message(message)).to eq([issue])
      end

      it do
        message = "Resolve: #{reference}"
        expect(subject.closed_by_message(message)).to eq([issue])
      end

      it do
        message = "resolve #{reference}"
        expect(subject.closed_by_message(message)).to eq([issue])
      end

      it do
        message = "resolve: #{reference}"
        expect(subject.closed_by_message(message)).to eq([issue])
      end

      it do
        message = "Implement: #{reference}"
        expect(subject.closed_by_message(message)).to eq([issue])
      end

      it do
        message = "Implements: #{reference}"
        expect(subject.closed_by_message(message)).to eq([issue])
      end

      it do
        message = "Implemented: #{reference}"
        expect(subject.closed_by_message(message)).to eq([issue])
      end

      it do
        message = "Implementing: #{reference}"
        expect(subject.closed_by_message(message)).to eq([issue])
      end

      it do
        message = "implement: #{reference}"
        expect(subject.closed_by_message(message)).to eq([issue])
      end

      it do
        message = "implements: #{reference}"
        expect(subject.closed_by_message(message)).to eq([issue])
      end

      it do
        message = "implemented: #{reference}"
        expect(subject.closed_by_message(message)).to eq([issue])
      end

      it do
        message = "implementing: #{reference}"
        expect(subject.closed_by_message(message)).to eq([issue])
      end

      context 'with an external issue tracker reference' do
        it 'extracts the referenced issue' 

      end
    end

    context "with a cross-project reference" do
      it do
        message = "Closes #{cross_reference}"
        expect(subject.closed_by_message(message)).to eq([issue2])
      end
    end

    context "with a cross-project URL" do
      it do
        message = "Closes #{urls.project_issue_url(issue2.project, issue2)}"
        expect(subject.closed_by_message(message)).to eq([issue2])
      end
    end

    context "with a cross-project fork reference" do
      subject { described_class.new(forked_project, forked_project.creator) }

      it do
        message = "Closes #{fork_cross_reference}"
        expect(subject.closed_by_message(message)).to be_empty
      end
    end

    context "with an invalid URL" do
      it do
        message = "Closes https://google.com#{urls.project_issue_path(issue2.project, issue2)}"
        expect(subject.closed_by_message(message)).to eq([])
      end
    end

    context 'with multiple references' do
      let(:other_issue) { create(:issue, project: project) }
      let(:third_issue) { create(:issue, project: project) }
      let(:reference2) { other_issue.to_reference }
      let(:reference3) { third_issue.to_reference }

      it 'fetches issues in single line message' 


      it 'fetches comma-separated issues references in single line message' 


      it 'fetches comma-separated issues numbers in single line message' 


      it 'allows oxford commas (comma before and) when referencing multiple issues' 


      it 'allows spaces before commas when referencing multiple issues' 


      it 'fetches issues in multi-line message' 


      it 'fetches issues in hybrid message' 


      it "fetches cross-project references" 


      it "fetches cross-project URL references" 


      it "ignores invalid cross-project URL references" 

    end
  end

  def urls
    Gitlab::Routing.url_helpers
  end
end

