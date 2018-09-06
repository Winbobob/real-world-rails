require 'spec_helper'

describe Banzai::Filter::ExternalIssueReferenceFilter do
  include FilterSpecHelper

  def helper
    IssuesHelper
  end

  shared_examples_for "external issue tracker" do
    it_behaves_like 'a reference containing an element node'

    it 'requires project context' 


    %w(pre code a style).each do |elem|
      it "ignores valid references contained inside '#{elem}' element" 

    end

    it 'ignores valid references when using default tracker' 


    it 'links to a valid reference' 


    it 'links to the external tracker' 


    it 'links with adjacent text' 


    it 'includes a title attribute' 


    it 'escapes the title attribute' 


    it 'includes default classes' 


    it 'supports an :only_path context' 


    context 'with RequestStore enabled' do
      let(:reference_filter) { HTML::Pipeline.new([described_class]) }

      before do
        allow(RequestStore).to receive(:active?).and_return(true)
      end

      it 'queries the collection on the first call' 

    end
  end

  context "redmine project" do
    let(:project) { create(:redmine_project) }
    let(:issue) { ExternalIssue.new("#123", project) }
    let(:reference) { issue.to_reference }

    before do
      project.issues_enabled = false
      project.save!
    end

    it_behaves_like "external issue tracker"
  end

  context "jira project" do
    let(:project) { create(:jira_project) }
    let(:reference) { issue.to_reference }

    context "with right markdown" do
      let(:issue) { ExternalIssue.new("JIRA-123", project) }

      it_behaves_like "external issue tracker"
    end

    context "with wrong markdown" do
      let(:issue) { ExternalIssue.new("#123", project) }

      it "ignores reference" 

    end
  end
end

