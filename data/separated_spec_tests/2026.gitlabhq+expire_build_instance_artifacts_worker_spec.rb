require 'spec_helper'

describe ExpireBuildInstanceArtifactsWorker do
  include RepoHelpers

  let(:worker) { described_class.new }

  describe '#perform' do
    before do
      worker.perform(build.id)
    end

    context 'with expired artifacts' do
      context 'when associated project is valid' do
        let(:build) { create(:ci_build, :artifacts, :expired) }

        it 'does expire' 


        it 'does remove files' 


        it 'does remove the job artifact record' 

      end
    end

    context 'with not yet expired artifacts' do
      set(:build) do
        create(:ci_build, :artifacts, artifacts_expire_at: Time.now + 7.days)
      end

      it 'does not expire' 


      it 'does not remove files' 


      it 'does not remove the job artifact record' 

    end

    context 'without expire date' do
      let(:build) { create(:ci_build, :artifacts) }

      it 'does not expire' 


      it 'does not remove files' 


      it 'does not remove the job artifact record' 

    end

    context 'for expired artifacts' do
      let(:build) { create(:ci_build, :expired) }

      it 'is still expired' 

    end
  end
end

