require 'spec_helper'

describe MergeRequestBasicSerializer do
  let(:resource) { create(:merge_request) }
  let(:user)     { create(:user) }

  let(:json_entity) do
    described_class.new(current_user: user)
      .represent(resource, serializer: 'basic')
      .with_indifferent_access
  end

  it 'matches basic merge request json' 

end

