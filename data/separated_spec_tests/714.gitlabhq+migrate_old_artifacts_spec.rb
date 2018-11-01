# encoding: utf-8

require 'spec_helper'
require Rails.root.join('db', 'post_migrate', '20170523083112_migrate_old_artifacts.rb')

describe MigrateOldArtifacts do
  let(:migration) { described_class.new }
  let!(:directory) { Dir.mktmpdir }

  before do
    allow(Gitlab.config.artifacts).to receive(:path).and_return(directory)
  end

  after do
    FileUtils.remove_entry_secure(directory)
  end

  context 'with migratable data' do
    set(:project1) { create(:project, ci_id: 2) } # rubocop:disable RSpec/FactoriesInMigrationSpecs
    set(:project2) { create(:project, ci_id: 3) } # rubocop:disable RSpec/FactoriesInMigrationSpecs
    set(:project3) { create(:project) } # rubocop:disable RSpec/FactoriesInMigrationSpecs

    set(:pipeline1) { create(:ci_empty_pipeline, project: project1) } # rubocop:disable RSpec/FactoriesInMigrationSpecs
    set(:pipeline2) { create(:ci_empty_pipeline, project: project2) } # rubocop:disable RSpec/FactoriesInMigrationSpecs
    set(:pipeline3) { create(:ci_empty_pipeline, project: project3) } # rubocop:disable RSpec/FactoriesInMigrationSpecs

    let!(:build_with_legacy_artifacts) { create(:ci_build, pipeline: pipeline1) } # rubocop:disable RSpec/FactoriesInMigrationSpecs
    let!(:build_without_artifacts) { create(:ci_build, pipeline: pipeline1) } # rubocop:disable RSpec/FactoriesInMigrationSpecs
    let!(:build2) { create(:ci_build, pipeline: pipeline2) } # rubocop:disable RSpec/FactoriesInMigrationSpecs
    let!(:build3) { create(:ci_build, pipeline: pipeline3) } # rubocop:disable RSpec/FactoriesInMigrationSpecs

    before do
      setup_builds(build2, build3)

      store_artifacts_in_legacy_path(build_with_legacy_artifacts)
    end

    it "legacy artifacts are not accessible" 


    it "legacy artifacts are set" 


    describe '#min_id' do
      subject { migration.send(:min_id) }

      it 'returns the newest build for which ci_id is not defined' 

    end

    describe '#builds_with_artifacts' do
      subject { migration.send(:builds_with_artifacts).map(&:id) }

      it 'returns a list of builds that has artifacts and could be migrated' 

    end

    describe '#up' do
      context 'when migrating artifacts' do
        before do
          migration.up
        end

        it 'all files do have artifacts' 


        it 'artifacts are no longer present on legacy path' 

      end

      context 'when there are aritfacts in old and new directory' do
        before do
          store_artifacts_in_legacy_path(build2)

          migration.up
        end

        it 'does not move old files' 

      end
    end

    private

    def store_artifacts_in_legacy_path(build)
      FileUtils.mkdir_p(legacy_path(build))

      FileUtils.copy(
        Rails.root.join('spec/fixtures/ci_build_artifacts.zip'),
        File.join(legacy_path(build), "ci_build_artifacts.zip"))

      FileUtils.copy(
        Rails.root.join('spec/fixtures/ci_build_artifacts_metadata.gz'),
        File.join(legacy_path(build), "ci_build_artifacts_metadata.gz"))

      build.update_columns(
        artifacts_file: 'ci_build_artifacts.zip',
        artifacts_metadata: 'ci_build_artifacts_metadata.gz')

      build.reload
    end

    def legacy_path(build)
      File.join(directory,
        build.created_at.utc.strftime('%Y_%m'),
        build.project.ci_id.to_s,
        build.id.to_s)
    end

    def new_legacy_path(build)
      File.join(directory,
                build.created_at.utc.strftime('%Y_%m'),
                build.project_id.to_s,
                build.id.to_s)
    end

    def setup_builds(*builds)
      builds.each do |build|
        FileUtils.mkdir_p(new_legacy_path(build))

        build.update_columns(
          artifacts_file: 'ci_build_artifacts.zip',
          artifacts_metadata: 'ci_build_artifacts_metadata.gz')

        build.reload
      end
    end
  end
end

