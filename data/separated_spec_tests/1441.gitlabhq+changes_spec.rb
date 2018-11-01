require 'spec_helper'

describe Gitlab::Ci::Build::Policy::Changes do
  set(:project) { create(:project) }

  describe '#satisfied_by?' do
    describe 'paths matching matching' do
      let(:pipeline) do
        build(:ci_empty_pipeline, project: project,
                                  ref: 'master',
                                  source: :push,
                                  sha: '1234abcd',
                                  before_sha: '0123aabb')
      end

      let(:ci_build) do
        build(:ci_build, pipeline: pipeline, project: project, ref: 'master')
      end

      let(:seed) { double('build seed', to_resource: ci_build) }

      before do
        allow(pipeline).to receive(:modified_paths) do
          %w[some/modified/ruby/file.rb some/other_file.txt some/.dir/file]
        end
      end

      it 'is satisfied by matching literal path' 


      it 'is satisfied by matching simple pattern' 


      it 'is satisfied by matching recusive pattern' 


      it 'is satisfied by matching a pattern with a dot' 


      it 'is not satisfied when pattern does not match path' 


      it 'is not satisfied when pattern does not match' 


      context 'when pipelines does not run for a branch update' do
        before do
          pipeline.before_sha = Gitlab::Git::BLANK_SHA
        end

        it 'is always satisfied' 

      end
    end

    describe 'gitaly integration' do
      set(:project) { create(:project, :repository) }

      let(:pipeline) do
        create(:ci_empty_pipeline, project: project,
                                   ref: 'master',
                                   source: :push,
                                   sha: '498214d',
                                   before_sha: '281d3a7')
      end

      let(:build) do
        create(:ci_build, pipeline: pipeline, project: project, ref: 'master')
      end

      let(:seed) { double('build seed', to_resource: build) }

      it 'is satisfied by changes introduced by a push' 


      it 'is not satisfied by changes that are not in the push' 

    end
  end
end

