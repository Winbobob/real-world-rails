require 'rails_helper'

describe 'Merge request > User sees pipelines', :js do
  describe 'pipeline tab' do
    let(:merge_request) { create(:merge_request) }
    let(:project) { merge_request.target_project }
    let(:user) { project.creator }

    before do
      project.add_master(user)
      sign_in(user)
    end

    context 'with pipelines' do
      let!(:pipeline) do
        create(:ci_empty_pipeline,
               project: merge_request.source_project,
               ref: merge_request.source_branch,
               sha: merge_request.diff_head_sha)
      end

      before do
        merge_request.update_attribute(:head_pipeline_id, pipeline.id)
      end

      it 'user visits merge request pipelines tab' 


      it 'pipeline sha does not equal last commit sha' 

    end

    context 'without pipelines' do
      before do
        visit project_merge_request_path(project, merge_request)
      end

      it 'user visits merge request page' 

    end
  end

  describe 'race condition' do
    let(:project) { create(:project, :repository) }
    let(:user) { create(:user) }
    let(:build_push_data) { { ref: 'feature', checkout_sha: TestEnv::BRANCH_SHA['feature'] } }

    let(:merge_request_params) do
      { "source_branch" => "feature", "source_project_id" => project.id,
        "target_branch" => "master", "target_project_id" => project.id, "title" => "A" }
    end

    before do
      project.add_master(user)
      sign_in user
    end

    context 'when pipeline and merge request were created simultaneously' do
      before do
        stub_ci_pipeline_to_return_yaml_file

        threads = []

        threads << Thread.new do
          @merge_request = MergeRequests::CreateService.new(project, user, merge_request_params).execute
        end

        threads << Thread.new do
          @pipeline = Ci::CreatePipelineService.new(project, user, build_push_data).execute(:push)
        end

        threads.each { |thr| thr.join }
      end

      it 'user sees pipeline in merge request widget' 

    end
  end
end

