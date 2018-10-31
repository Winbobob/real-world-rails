require 'spec_helper'

describe Gitlab::BackgroundMigration::MigrateLegacyArtifacts, :migration, schema: 20180816161409 do
  let(:namespaces) { table(:namespaces) }
  let(:projects) { table(:projects) }
  let(:pipelines) { table(:ci_pipelines) }
  let(:jobs) { table(:ci_builds) }
  let(:job_artifacts) { table(:ci_job_artifacts) }

  subject { described_class.new.perform(*range) }

  context 'when a pipeline exists' do
    let!(:namespace) { namespaces.create!(name: 'gitlab', path: 'gitlab-org') }
    let!(:project) { projects.create!(name: 'gitlab', path: 'gitlab-ce', namespace_id: namespace.id) }
    let!(:pipeline) { pipelines.create!(project_id: project.id, ref: 'master', sha: 'adf43c3a') }

    context 'when a legacy artifacts exists' do
      let(:artifacts_expire_at) { 1.day.since.to_s }
      let(:file_store) { ::ObjectStorage::Store::REMOTE }

      let!(:job) do
        jobs.create!(
          commit_id: pipeline.id,
          project_id: project.id,
          status: :success,
          **artifacts_archive_attributes,
          **artifacts_metadata_attributes)
      end

      let(:artifacts_archive_attributes) do
        {
          artifacts_file: 'archive.zip',
          artifacts_file_store: file_store,
          artifacts_size: 123,
          artifacts_expire_at: artifacts_expire_at
        }
      end

      let(:artifacts_metadata_attributes) do
        {
          artifacts_metadata: 'metadata.gz',
          artifacts_metadata_store: file_store
        }
      end

      it 'has legacy artifacts' 


      it 'does not have new artifacts yet' 


      context 'when the record exists inside of the range of a background migration' do
        let(:range) { [job.id, job.id] }

        it 'migrates a legacy artifact to ci_job_artifacts table' 


        context 'when file_store is nil' do
          let(:file_store) { nil }

          it 'has nullified file_store in all legacy artifacts' 


          it 'fills file_store by the value of local file store' 

        end

        context 'when new artifacts has already existed' do
          context 'when only archive.zip existed' do
            before do
              job_artifacts.create!(project_id: project.id, job_id: job.id, file_type: described_class::ARCHIVE_FILE_TYPE, size: 999, file: 'archive.zip')
            end

            it 'had archive.zip already' 


            it 'migrates metadata' 

          end

          context 'when both archive and metadata existed' do
            before do
              job_artifacts.create!(project_id: project.id, job_id: job.id, file_type: described_class::ARCHIVE_FILE_TYPE, size: 999, file: 'archive.zip')
              job_artifacts.create!(project_id: project.id, job_id: job.id, file_type: described_class::METADATA_FILE_TYPE, size: 999, file: 'metadata.zip')
            end

            it 'does not migrate' 

          end
        end
      end

      context 'when the record exists outside of the range of a background migration' do
        let(:range) { [job.id + 1, job.id + 1] }

        it 'does not migrate' 

      end
    end

    context 'when the job does not have legacy artifacts' do
      let!(:job) { jobs.create!(commit_id: pipeline.id, project_id: project.id, status: :success) }

      it 'does not have the legacy artifacts in database' 


      context 'when the record exists inside of the range of a background migration' do
        let(:range) { [job.id, job.id] }

        it 'does not migrate' 

      end
    end
  end
end

