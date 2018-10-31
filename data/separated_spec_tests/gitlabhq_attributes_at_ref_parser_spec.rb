require 'spec_helper'

describe Gitlab::Git::AttributesAtRefParser, seed_helper: true do
  let(:project) { create(:project, :repository) }
  let(:repository) { project.repository }

  subject { described_class.new(repository, 'lfs') }

  it 'loads .gitattributes blob' 


  it 'handles missing blobs' 


  describe '#attributes' do
    it 'returns the attributes as a Hash' 

  end
end

