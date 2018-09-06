require 'spec_helper'

describe Gitlab::Ci::Build::Policy::Refs do
  describe '#satisfied_by?' do
    context 'when matching ref' do
      let(:pipeline) { build_stubbed(:ci_pipeline, ref: 'master') }

      it 'is satisfied when pipeline branch matches' 


      it 'is not satisfied when pipeline branch does not match' 

    end

    context 'when maching tags' do
      context 'when pipeline runs for a tag' do
        let(:pipeline) do
          build_stubbed(:ci_pipeline, ref: 'feature', tag: true)
        end

        it 'is satisfied when tags matcher is specified' 

      end

      context 'when pipeline is not created for a tag' do
        let(:pipeline) do
          build_stubbed(:ci_pipeline, ref: 'feature', tag: false)
        end

        it 'is not satisfied when tag match is specified' 

      end
    end

    context 'when also matching a path' do
      let(:pipeline) do
        build_stubbed(:ci_pipeline, ref: 'master')
      end

      it 'is satisfied when provided patch matches specified one' 


      it 'is not satisfied when path differs' 

    end

    context 'when maching a source' do
      let(:pipeline) { build_stubbed(:ci_pipeline, source: :push) }

      it 'is satisifed when provided source keyword matches' 


      it 'is not satisfied when provided source keyword does not match' 

    end

    context 'when matching a ref by a regular expression' do
      let(:pipeline) { build_stubbed(:ci_pipeline, ref: 'docs-something') }

      it 'is satisfied when regexp matches pipeline ref' 


      it 'is not satisfied when regexp does not match pipeline ref' 

    end
  end
end

