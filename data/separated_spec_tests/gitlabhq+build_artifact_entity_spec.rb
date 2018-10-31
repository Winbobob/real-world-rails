require 'spec_helper'

describe BuildArtifactEntity do
  let(:job) { create(:ci_build, name: 'test:job', artifacts_expire_at: 1.hour.from_now) }

  let(:entity) do
    described_class.new(job, request: double)
  end

  describe '#as_json' do
    subject { entity.as_json }

    it 'contains job name' 


    it 'exposes information about expiration of artifacts' 


    it 'contains paths to the artifacts' 

  end
end

