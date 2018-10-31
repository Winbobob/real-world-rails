require 'spec_helper'
require 'lib/gitlab/badge/shared/metadata'

describe Gitlab::Badge::Pipeline::Metadata do
  let(:badge) { double(project: create(:project), ref: 'feature') }
  let(:metadata) { described_class.new(badge) }

  it_behaves_like 'badge metadata'

  describe '#title' do
    it 'returns build status title' 

  end

  describe '#image_url' do
    it 'returns valid url' 

  end

  describe '#link_url' do
    it 'returns valid link' 

  end
end

