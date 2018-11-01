require 'spec_helper'

describe Banzai::ReferenceParser::LabelParser do
  include ReferenceParserHelpers

  let(:project) { create(:project, :public) }
  let(:user) { create(:user) }
  let(:label) { create(:label, project: project) }
  subject { described_class.new(Banzai::RenderContext.new(project, user)) }
  let(:link) { empty_html_link }

  describe '#nodes_visible_to_user' do
    context 'when the link has a data-issue attribute' do
      before do
        link['data-label'] = label.id.to_s
      end

      it_behaves_like "referenced feature visibility", "issues", "merge_requests"
    end
  end

  describe '#referenced_by' do
    describe 'when the link has a data-label attribute' do
      context 'using an existing label ID' do
        it 'returns an Array of labels' 

      end

      context 'using a non-existing label ID' do
        it 'returns an empty Array' 

      end
    end
  end
end

