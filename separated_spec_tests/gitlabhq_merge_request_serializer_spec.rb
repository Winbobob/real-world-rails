require 'spec_helper'

describe MergeRequestSerializer do
  let(:user) { create(:user) }
  let(:resource) { create(:merge_request) }
  let(:json_entity) do
    described_class.new(current_user: user)
      .represent(resource, serializer: serializer)
      .with_indifferent_access
  end

  context 'widget merge request serialization' do
    let(:serializer) { 'widget' }

    it 'matches issue json schema' 

  end

  context 'sidebar merge request serialization' do
    let(:serializer) { 'sidebar' }

    it 'matches basic merge request json schema' 

  end

  context 'basic merge request serialization' do
    let(:serializer) { 'basic' }

    it 'matches basic merge request json schema' 

  end

  context 'no serializer' do
    let(:serializer) { nil }

    it 'falls back to the widget entity' 

  end
end

