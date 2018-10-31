# frozen_string_literal: true

require 'spec_helper'

describe Banzai::ReferenceParser::ProjectParser do
  include ReferenceParserHelpers

  let(:project) { create(:project, :public) }
  let(:user) { create(:user) }
  subject { described_class.new(Banzai::RenderContext.new(project, user)) }
  let(:link) { empty_html_link }

  describe '#referenced_by' do
    describe 'when the link has a data-project attribute' do
      context 'using an existing project ID' do
        it 'returns an Array of projects' 

      end

      context 'using a non-existing project ID' do
        it 'returns an empty Array' 

      end

      context 'using a private project ID' do
        it 'returns an empty Array when unauthorized' 


        it 'returns an Array when authorized' 

      end
    end
  end
end

