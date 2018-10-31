require 'spec_helper'

describe Banzai::ReferenceParser::ExternalIssueParser do
  include ReferenceParserHelpers

  let(:project) { create(:project, :public) }
  let(:user) { create(:user) }
  subject { described_class.new(Banzai::RenderContext.new(project, user)) }
  let(:link) { empty_html_link }

  describe '#nodes_visible_to_user' do
    context 'when the link has a data-issue attribute' do
      before do
        link['data-external-issue'] = 123
      end

      levels = [ProjectFeature::DISABLED, ProjectFeature::PRIVATE, ProjectFeature::ENABLED]

      levels.each do |level|
        it "creates reference when the feature is #{level}" 

      end
    end
  end

  describe '#referenced_by' do
    context 'when the link has a data-project attribute' do
      before do
        link['data-project'] = project.id.to_s
      end

      context 'when the link has a data-external-issue attribute' do
        it 'returns an Array of ExternalIssue instances' 

      end

      context 'when the link does not have a data-external-issue attribute' do
        it 'returns an empty Array' 

      end
    end

    context 'when the link does not have a data-project attribute' do
      it 'returns an empty Array' 

    end
  end

  describe '#issue_ids_per_project' do
    before do
      link['data-project'] = project.id.to_s
    end

    it 'returns a Hash containing range IDs per project' 


    it 'does not add a project when the data-external-issue attribute is empty' 

  end
end

