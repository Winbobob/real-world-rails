# frozen_string_literal: true

require 'spec_helper'

describe Gitlab::Import::MergeRequestCreator do
  let(:project) { create(:project, :repository) }

  subject { described_class.new(project) }

  describe '#execute' do
    context 'merge request already exists' do
      let(:merge_request) { create(:merge_request, target_project: project, source_project: project) }
      let(:commits) { merge_request.merge_request_diffs.first.commits }
      let(:attributes) { HashWithIndifferentAccess.new(merge_request.attributes.except("merge_params")) }

      it 'updates the data' 

    end

    context 'new merge request' do
      let(:merge_request) { build(:merge_request, target_project: project, source_project: project) }
      let(:attributes) { HashWithIndifferentAccess.new(merge_request.attributes.except("merge_params")) }

      it 'creates a new merge request' 

    end
  end
end

