require 'spec_helper'

describe Banzai::ReferenceParser::CommitRangeParser do
  include ReferenceParserHelpers

  let(:project) { create(:project, :public) }
  let(:user) { create(:user) }
  subject { described_class.new(Banzai::RenderContext.new(project, user)) }
  let(:link) { empty_html_link }

  describe '#nodes_visible_to_user' do
    context 'when the link has a data-issue attribute' do
      before do
        link['data-commit-range'] = '123..456'
      end

      it_behaves_like "referenced feature visibility", "repository"
    end
  end

  describe '#referenced_by' do
    context 'when the link has a data-project attribute' do
      before do
        link['data-project'] = project.id.to_s
      end

      context 'when the link as a data-commit-range attribute' do
        before do
          link['data-commit-range'] = '123..456'
        end

        it 'returns an Array of commit ranges' 


        it 'returns an empty Array when the commit range could not be found' 

      end

      context 'when the link does not have a data-commit-range attribute' do
        it 'returns an empty Array' 

      end
    end

    context 'when the link does not have a data-project attribute' do
      it 'returns an empty Array' 

    end
  end

  describe '#commit_range_ids_per_project' do
    before do
      link['data-project'] = project.id.to_s
    end

    it 'returns a Hash containing range IDs per project' 


    it 'does not add a project when the data-commit-range attribute is empty' 

  end

  describe '#find_ranges' do
    it 'returns an Array of range objects' 


    it 'skips ranges that could not be found' 

  end

  describe '#find_object' do
    let(:range) { double(:range) }

    context 'when the range has valid commits' do
      it 'returns the commit range' 

    end

    context 'when the range does not have any valid commits' do
      it 'returns nil' 

    end

    context 'group context' do
      it 'returns nil' 

    end
  end
end

