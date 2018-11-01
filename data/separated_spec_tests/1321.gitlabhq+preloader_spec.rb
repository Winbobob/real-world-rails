# frozen_string_literal: true

require 'spec_helper'

describe Gitlab::Ci::Pipeline::Preloader do
  let(:stage) { double(:stage) }
  let(:commit) { double(:commit) }

  let(:pipeline) do
    double(:pipeline, commit: commit, stages: [stage])
  end

  describe '.preload!' do
    context 'when preloading multiple commits' do
      let(:project) { create(:project, :repository) }

      it 'preloads all commits once' 


      def build_pipeline(ref:)
        build_stubbed(:ci_pipeline, project: project, sha: project.commit(ref).id)
      end
    end

    it 'preloads commit authors and number of warnings' 


    it 'returns original collection' 

  end
end

