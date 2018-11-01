require 'spec_helper'

describe MergeRequests::MergeWhenPipelineSucceedsService do
  let(:user) { create(:user) }
  let(:project) { create(:project, :repository) }

  let(:mr_merge_if_green_enabled) do
    create(:merge_request, merge_when_pipeline_succeeds: true, merge_user: user,
                           source_branch: "master", target_branch: 'feature',
                           source_project: project, target_project: project, state: "opened")
  end

  let(:pipeline) do
    create(:ci_pipeline_with_one_job, ref: mr_merge_if_green_enabled.source_branch,
                                      project: project)
  end

  let(:service) do
    described_class.new(project, user, commit_message: 'Awesome message')
  end

  describe "#execute" do
    let(:merge_request) do
      create(:merge_request, target_project: project, source_project: project,
                             source_branch: "feature", target_branch: 'master')
    end

    context 'first time enabling' do
      before do
        allow(merge_request)
          .to receive(:head_pipeline)
          .and_return(pipeline)

        service.execute(merge_request)
      end

      it 'sets the params, merge_user, and flag' 


      it 'creates a system note' 

    end

    context 'already approved' do
      let(:service) { described_class.new(project, user, new_key: true) }
      let(:build)   { create(:ci_build, ref: mr_merge_if_green_enabled.source_branch) }

      before do
        allow(mr_merge_if_green_enabled).to receive(:head_pipeline)
          .and_return(pipeline)

        allow(mr_merge_if_green_enabled).to receive(:mergeable?)
          .and_return(true)

        allow(pipeline).to receive(:success?).and_return(true)
      end

      it 'updates the merge params' 

    end
  end

  describe "#trigger" do
    let(:merge_request_ref) { mr_merge_if_green_enabled.source_branch }
    let(:merge_request_head) do
      project.commit(mr_merge_if_green_enabled.source_branch).id
    end

    context 'when triggered by pipeline with valid ref and sha' do
      let(:triggering_pipeline) do
        create(:ci_pipeline, project: project, ref: merge_request_ref,
                             sha: merge_request_head, status: 'success',
                             head_pipeline_of: mr_merge_if_green_enabled)
      end

      it "merges all merge requests with merge when the pipeline succeeds enabled" 

    end

    context 'when triggered by an old pipeline' do
      let(:old_pipeline) do
        create(:ci_pipeline, project: project, ref: merge_request_ref,
                             sha: '1234abcdef', status: 'success')
      end

      it 'it does not merge merge request' 

    end

    context 'when triggered by pipeline from a different branch' do
      let(:unrelated_pipeline) do
        create(:ci_pipeline, project: project, ref: 'feature',
                             sha: merge_request_head, status: 'success')
      end

      it 'does not merge request' 

    end
  end

  describe "#cancel" do
    before do
      service.cancel(mr_merge_if_green_enabled)
    end

    it "resets all the pipeline succeeds params" 


    it 'Posts a system note' 

  end

  describe 'pipeline integration' do
    context 'when there are multiple stages in the pipeline' do
      let(:ref) { mr_merge_if_green_enabled.source_branch }
      let(:sha) { project.commit(ref).id }

      let(:pipeline) do
        create(:ci_empty_pipeline, ref: ref, sha: sha, project: project)
      end

      let!(:build) do
        create(:ci_build, :created, pipeline: pipeline, ref: ref,
                                    name: 'build', stage: 'build')
      end

      let!(:test) do
        create(:ci_build, :created, pipeline: pipeline, ref: ref,
                                    name: 'test', stage: 'test')
      end

      before do
        # This behavior of MergeRequest: we instantiate a new object
        #
        allow_any_instance_of(MergeRequest)
          .to receive(:head_pipeline)
          .and_wrap_original do
            Ci::Pipeline.find(pipeline.id)
          end
      end

      it "doesn't merge if any of stages failed" 


      it 'merges when all stages succeeded' 

    end
  end
end

