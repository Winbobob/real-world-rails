require 'spec_helper'

describe Gitlab::Verify::JobArtifacts do
  include GitlabVerifyHelpers

  it_behaves_like 'Gitlab::Verify::BatchVerifier subclass' do
    let!(:objects) { create_list(:ci_job_artifact, 3, :archive) }
  end

  describe '#run_batches' do
    let(:failures) { collect_failures }
    let(:failure) { failures[artifact] }

    let!(:artifact) { create(:ci_job_artifact, :archive, :correct_checksum) }

    it 'passes artifacts with the correct file' 


    it 'fails artifacts with a missing file' 


    it 'fails artifacts with a mismatched checksum' 

  end
end

