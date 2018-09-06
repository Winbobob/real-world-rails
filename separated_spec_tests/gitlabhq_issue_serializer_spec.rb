require 'spec_helper'

describe IssueSerializer do
  let(:resource) { create(:issue) }
  let(:user)     { create(:user) }
  let(:json_entity) do
    described_class.new(current_user: user)
      .represent(resource, serializer: serializer)
      .with_indifferent_access
  end

  context 'non-sidebar issue serialization' do
    let(:serializer) { nil }

    it 'matches issue json schema' 

  end

  context 'sidebar issue serialization' do
    let(:serializer) { 'sidebar' }

    it 'matches sidebar issue json schema' 

  end
end

