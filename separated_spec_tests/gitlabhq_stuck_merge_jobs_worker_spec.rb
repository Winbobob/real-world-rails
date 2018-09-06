require 'spec_helper'

describe StuckMergeJobsWorker do
  describe 'perform' do
    let(:worker) { described_class.new }

    context 'merge job identified as completed' do
      it 'updates merge request to merged when locked but has merge_commit_sha' 


      it 'updates merge request to opened when locked but has not been merged' 


      it 'logs updated stuck merge job ids' 

    end

    context 'merge job not identified as completed' do
      it 'does not change merge request state when job is not completed yet' 

    end
  end
end

