require 'spec_helper'

describe 'Pipeline', :js do
  let(:project) { create(:project) }
  let(:user) { create(:user) }
  let(:role) { :developer }

  before do
    sign_in(user)
    project.add_role(user, role)
  end

  shared_context 'pipeline builds' do
    let!(:build_passed) do
      create(:ci_build, :success,
             pipeline: pipeline, stage: 'build', name: 'build')
    end

    let!(:build_failed) do
      create(:ci_build, :failed,
             pipeline: pipeline, stage: 'test', name: 'test', commands: 'test')
    end

    let!(:build_running) do
      create(:ci_build, :running,
             pipeline: pipeline, stage: 'deploy', name: 'deploy')
    end

    let!(:build_manual) do
      create(:ci_build, :manual,
             pipeline: pipeline, stage: 'deploy', name: 'manual-build')
    end

    let!(:build_external) do
      create(:generic_commit_status, status: 'success',
                                     pipeline: pipeline,
                                     name: 'jenkins',
                                     stage: 'external',
                                     target_url: 'http://gitlab.com/status')
    end
  end

  describe 'GET /:project/pipelines/:id' do
    include_context 'pipeline builds'

    let(:project) { create(:project, :repository) }
    let(:pipeline) { create(:ci_pipeline, project: project, ref: 'master', sha: project.commit.id, user: user) }

    before do
      visit project_pipeline_path(project, pipeline)
    end

    it 'shows the pipeline graph' 


    it 'shows Pipeline tab pane as active' 


    describe 'pipeline graph' do
      context 'when pipeline has running builds' do
        it 'shows a running icon and a cancel action for the running build' 


        it 'should be possible to cancel the running build' 

      end

      context 'when pipeline has successful builds' do
        it 'shows the success icon and a retry action for the successful build' 


        it 'should be possible to retry the success job' 

      end

      context 'when pipeline has failed builds' do
        it 'shows the failed icon and a retry action for the failed build' 


        it 'should be possible to retry the failed build' 


        it 'should include the failure reason' 

      end

      context 'when pipeline has manual jobs' do
        it 'shows the skipped icon and a play action for the manual build' 


        it 'should be possible to play the manual job' 

      end

      context 'when pipeline has external job' do
        it 'shows the success icon and the generic comit status build' 

      end
    end

    context 'page tabs' do
      it 'shows Pipeline, Jobs and Failed Jobs tabs with link' 


      it 'shows counter in Jobs tab' 


      it 'shows Pipeline tab as active' 


      context 'without permission to access builds' do
        let(:project) { create(:project, :public, :repository, public_builds: false) }
        let(:role) { :guest }

        it 'does not show failed jobs tab pane' 

      end
    end

    context 'retrying jobs' do
      it { expect(page).not_to have_content('retried') }

      context 'when retrying' do
        before do
          find('.js-retry-button').click
        end

        it { expect(page).not_to have_content('Retry') }
      end
    end

    context 'canceling jobs' do
      it { expect(page).not_to have_selector('.ci-canceled') }

      context 'when canceling' do
        before do
          click_on 'Cancel running'
        end

        it { expect(page).not_to have_content('Cancel running') }
      end
    end
  end

  context 'when user does not have access to read jobs' do
    before do
      project.update(public_builds: false)
    end

    describe 'GET /:project/pipelines/:id' do
      include_context 'pipeline builds'

      let(:project) { create(:project, :repository) }
      let(:pipeline) { create(:ci_pipeline, project: project, ref: 'master', sha: project.commit.id, user: user) }

      before do
        visit project_pipeline_path(project, pipeline)
      end

      it 'shows the pipeline graph' 


      it 'should not link to job' 

    end
  end

  describe 'GET /:project/pipelines/:id/builds' do
    include_context 'pipeline builds'

    let(:project) { create(:project, :repository) }
    let(:pipeline) { create(:ci_pipeline, project: project, ref: 'master', sha: project.commit.id) }

    before do
      visit builds_project_pipeline_path(project, pipeline)
    end

    it 'shows a list of jobs' 


    it 'shows jobs tab pane as active' 


    context 'page tabs' do
      it 'shows Pipeline and Jobs tabs with link' 


      it 'shows counter in Jobs tab' 


      it 'shows Jobs tab as active' 

    end

    context 'retrying jobs' do
      it { expect(page).not_to have_content('retried') }

      context 'when retrying' do
        before do
          find('.js-retry-button').click
        end

        it { expect(page).not_to have_content('Retry') }
      end
    end

    context 'canceling jobs' do
      it { expect(page).not_to have_selector('.ci-canceled') }

      context 'when canceling' do
        before do
          click_on 'Cancel running'
        end

        it { expect(page).not_to have_content('Cancel running') }
      end
    end

    context 'playing manual job' do
      before do
        within '.pipeline-holder' do
          click_link('Play')
        end
      end

      it { expect(build_manual.reload).to be_pending }
    end

    context 'failed jobs' do
      it 'displays a tooltip with the failure reason' 

    end
  end

  describe 'GET /:project/pipelines/:id/failures' do
    let(:pipeline) { create(:ci_pipeline, project: project, ref: 'master', sha: '1234') }
    let(:pipeline_failures_page) { failures_project_pipeline_path(project, pipeline) }
    let!(:failed_build) { create(:ci_build, :failed, pipeline: pipeline) }

    context 'with failed build' do
      before do
        failed_build.trace.set('4 examples, 1 failure')

        visit pipeline_failures_page
      end

      it 'shows jobs tab pane as active' 


      it 'lists failed builds' 


      it 'shows build failure logs' 

    end

    context 'when missing build logs' do
      before do
        visit pipeline_failures_page
      end

      it 'shows jobs tab pane as active' 


      it 'lists failed builds' 


      it 'does not show trace' 

    end

    context 'without permission to access builds' do
      let(:role) { :guest }

      before do
        project.update(public_builds: false)
      end

      context 'when accessing failed jobs page' do
        before do
          visit pipeline_failures_page
        end

        it 'fails to access the page' 

      end
    end

    context 'without failures' do
      before do
        failed_build.update!(status: :success)

        visit pipeline_failures_page
      end

      it 'displays the pipeline graph' 

    end
  end
end

