require 'spec_helper'

describe Banzai::ReferenceParser::CommitParser do
  include ReferenceParserHelpers

  let(:project) { create(:project, :public) }
  let(:user) { create(:user) }
  subject { described_class.new(Banzai::RenderContext.new(project, user)) }
  let(:link) { empty_html_link }

  describe '#nodes_visible_to_user' do
    context 'when the link has a data-issue attribute' do
      before do
        link['data-commit'] = 123
      end

      it_behaves_like "referenced feature visibility", "repository"
    end
  end

  describe '#referenced_by' do
    context 'when the link has a data-project attribute' do
      before do
        link['data-project'] = project.id.to_s
      end

      context 'when the link has a data-commit attribute' do
        before do
          link['data-commit'] = '123'
        end

        it 'returns an Array of commits' 


        it 'returns an empty Array when the commit could not be found' 


        it 'skips projects without valid repositories' 

      end

      context 'when the link does not have a data-commit attribute' do
        it 'returns an empty Array' 

      end
    end

    context 'when the link does not have a data-project attribute' do
      it 'returns an empty Array' 

    end
  end

  describe '#commit_ids_per_project' do
    before do
      link['data-project'] = project.id.to_s
    end

    it 'returns a Hash containing commit IDs per project' 


    it 'does not add a project when the data-commit attribute is empty' 

  end

  describe '#find_commits' do
    it 'returns an Array of commit objects' 


    it 'skips commit IDs for which no commit could be found' 

  end
end

