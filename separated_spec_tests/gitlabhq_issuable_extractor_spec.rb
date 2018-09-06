require 'spec_helper'

describe Banzai::IssuableExtractor do
  let(:project) { create(:project) }
  let(:user) { create(:user) }
  let(:extractor) { described_class.new(Banzai::RenderContext.new(project, user)) }
  let(:issue) { create(:issue, project: project) }
  let(:merge_request) { create(:merge_request, source_project: project) }
  let(:issue_link) do
    html_to_node(
      "<a href='' data-issue='#{issue.id}' data-reference-type='issue' class='gfm'>text</a>"
    )
  end
  let(:merge_request_link) do
    html_to_node(
      "<a href='' data-merge-request='#{merge_request.id}' data-reference-type='merge_request' class='gfm'>text</a>"
    )
  end

  def html_to_node(html)
    Nokogiri::HTML.fragment(
      html
    ).children[0]
  end

  it 'returns instances of issuables for nodes with references' 


  describe 'caching', :request_store do
    it 'saves records to cache' 

  end
end

