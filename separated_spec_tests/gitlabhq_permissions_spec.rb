require 'spec_helper'

describe 'Project Jobs Permissions' do
  let(:user) { create(:user) }
  let(:group) { create(:group, name: 'some group') }
  let(:project) { create(:project, :repository, namespace: group) }
  let(:pipeline) { create(:ci_empty_pipeline, project: project, sha: project.commit.sha, ref: 'master') }
  let!(:job) { create(:ci_build, :running, :coverage, :trace_artifact, pipeline: pipeline) }

  before do
    sign_in(user)

    project.enable_ci
  end

  describe 'jobs pages' do
    shared_examples 'recent job page details responds with status' do |status|
      before do
        visit project_job_path(project, job)
      end

      it { expect(status_code).to eq(status) }
    end

    shared_examples 'project jobs page responds with status' do |status|
      before do
        visit project_jobs_path(project)
      end

      it { expect(status_code).to eq(status) }
    end

    context 'when public access for jobs is disabled' do
      before do
        project.update(public_builds: false)
      end

      context 'when user is a guest' do
        before do
          project.add_guest(user)
        end

        it_behaves_like 'recent job page details responds with status', 404
        it_behaves_like 'project jobs page responds with status', 404
      end

      context 'when project is internal' do
        before do
          project.update(visibility_level: Gitlab::VisibilityLevel::INTERNAL)
        end

        it_behaves_like 'recent job page details responds with status', 404
        it_behaves_like 'project jobs page responds with status', 404
      end
    end

    context 'when public access for jobs is enabled' do
      before do
        project.update(public_builds: true)
      end

      context 'when project is internal' do
        before do
          project.update(visibility_level: Gitlab::VisibilityLevel::INTERNAL)
        end

        it_behaves_like 'recent job page details responds with status', 200 do
          it 'renders job details', :js do
            expect(page).to have_content "Job ##{job.id}"
            expect(page).to have_css '#build-trace'
          end
        end

        it_behaves_like 'project jobs page responds with status', 200 do
          it 'renders job' 

        end
      end
    end
  end

  describe 'artifacts page' do
    context 'when recent job has artifacts available' do
      before do
        artifacts = Rails.root.join('spec/fixtures/ci_build_artifacts.zip')
        archive = fixture_file_upload(artifacts, 'application/zip')

        job.update_attributes(legacy_artifacts_file: archive)
      end

      context 'when public access for jobs is disabled' do
        before do
          project.update(public_builds: false)
        end

        context 'when user with guest role' do
          before do
            project.add_guest(user)
          end

          it 'responds with 404 status' 

        end

        context 'when user with reporter role' do
          before do
            project.add_reporter(user)
          end

          it 'starts download artifact' 

        end
      end
    end
  end
end

