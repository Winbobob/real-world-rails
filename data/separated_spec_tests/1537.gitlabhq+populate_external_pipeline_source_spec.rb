# frozen_string_literal: true

require 'spec_helper'

describe Gitlab::BackgroundMigration::PopulateExternalPipelineSource, :migration, schema: 20180916011959 do
  let(:migration) { described_class.new }

  let!(:internal_pipeline) { create(:ci_pipeline, source: :web) }
  let(:pipelines) { [internal_pipeline, unknown_pipeline].map(&:id) }

  let!(:unknown_pipeline) do
    build(:ci_pipeline, source: :unknown)
      .tap { |pipeline| pipeline.save(validate: false) }
  end

  subject { migration.perform(pipelines.min, pipelines.max) }

  shared_examples 'no changes' do
    it 'does not change the pipeline source' 

  end

  context 'when unknown pipeline is external' do
    before do
      create(:generic_commit_status, pipeline: unknown_pipeline)
    end

    it 'populates the pipeline source' 


    it 'can be repeated without effect' 

  end

  context 'when unknown pipeline has just a build' do
    before do
      create(:ci_build, pipeline: unknown_pipeline)
    end

    it_behaves_like 'no changes'
  end

  context 'when unknown pipeline has no statuses' do
    it_behaves_like 'no changes'
  end

  context 'when unknown pipeline has a build and a status' do
    before do
      create(:generic_commit_status, pipeline: unknown_pipeline)
      create(:ci_build, pipeline: unknown_pipeline)
    end

    it_behaves_like 'no changes'
  end
end

