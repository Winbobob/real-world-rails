require 'spec_helper'
require 'lib/gitlab/badge/shared/metadata'

describe Gitlab::Badge::Coverage::Metadata do
  let(:badge) do
    double(project: create(:project), ref: 'feature', job: 'test')
  end

  let(:metadata) { described_class.new(badge) }

  it_behaves_like 'badge metadata'

  describe '#title' do
    it 'returns coverage report title' 

  end

  describe '#image_url' do
    it 'returns valid url' 

  end

  describe '#link_url' do
    it 'returns valid link' 

  end
end

