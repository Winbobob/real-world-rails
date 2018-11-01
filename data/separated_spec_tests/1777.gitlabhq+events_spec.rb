require 'spec_helper'

describe 'cycle analytics events' do
  let(:project) { create(:project, :repository) }
  let(:from_date) { 10.days.ago }
  let(:user) { create(:user, :admin) }
  let!(:context) { create(:issue, project: project, created_at: 2.days.ago) }

  let(:events) do
    CycleAnalytics.new(project, { from: from_date, current_user: user })[stage].events
  end

  before do
    setup(context)
  end

  describe '#issue_events' do
    let(:stage) { :issue }

    it 'has the total time' 


    it 'has a title' 


    it 'has the URL' 


    it 'has an iid' 


    it 'has a created_at timestamp' 


    it "has the author's URL" 


    it "has the author's avatar URL" 


    it "has the author's name" 

  end

  describe '#plan_events' do
    let(:stage) { :plan }

    it 'has a title' 


    it 'has a sha short ID' 


    it 'has the URL' 


    it 'has the total time' 


    it "has the author's URL" 


    it "has the author's avatar URL" 


    it "has the author's name" 

  end

  describe '#code_events' do
    let(:stage) { :code }

    before do
      create_commit_referencing_issue(context)
    end

    it 'has the total time' 


    it 'has a title' 


    it 'has an iid' 


    it 'has a created_at timestamp' 


    it "has the author's URL" 


    it "has the author's avatar URL" 


    it "has the author's name" 

  end

  describe '#test_events' do
    let(:stage) { :test }

    let(:merge_request) { MergeRequest.first }

    let!(:pipeline) do
      create(:ci_pipeline,
             ref: merge_request.source_branch,
             sha: merge_request.diff_head_sha,
             project: project,
             head_pipeline_of: merge_request)
    end

    before do
      create(:ci_build, :success, pipeline: pipeline, author: user)
      create(:ci_build, :success, pipeline: pipeline, author: user)

      pipeline.run!
      pipeline.succeed!
    end

    it 'has the name' 


    it 'has the ID' 


    it 'has the URL' 


    it 'has the branch name' 


    it 'has the branch URL' 


    it 'has the short SHA' 


    it 'has the commit URL' 


    it 'has the date' 


    it 'has the total time' 

  end

  describe '#review_events' do
    let(:stage) { :review }
    let!(:context) { create(:issue, project: project, created_at: 2.days.ago) }

    it 'has the total time' 


    it 'has a title' 


    it 'has an iid' 


    it 'has the URL' 


    it 'has a state' 


    it 'has a created_at timestamp' 


    it "has the author's URL" 


    it "has the author's avatar URL" 


    it "has the author's name" 

  end

  describe '#staging_events' do
    let(:stage) { :staging }
    let(:merge_request) { MergeRequest.first }

    let!(:pipeline) do
      create(:ci_pipeline,
             ref: merge_request.source_branch,
             sha: merge_request.diff_head_sha,
             project: project,
             head_pipeline_of: merge_request)
    end

    before do
      create(:ci_build, :success, pipeline: pipeline, author: user)
      create(:ci_build, :success, pipeline: pipeline, author: user)

      pipeline.run!
      pipeline.succeed!

      merge_merge_requests_closing_issue(user, project, context)
      deploy_master(user, project)
    end

    it 'has the name' 


    it 'has the ID' 


    it 'has the URL' 


    it 'has the branch name' 


    it 'has the branch URL' 


    it 'has the short SHA' 


    it 'has the commit URL' 


    it 'has the date' 


    it 'has the total time' 


    it "has the author's URL" 


    it "has the author's avatar URL" 


    it "has the author's name" 

  end

  describe '#production_events' do
    let(:stage) { :production }
    let!(:context) { create(:issue, project: project, created_at: 2.days.ago) }

    before do
      merge_merge_requests_closing_issue(user, project, context)
      deploy_master(user, project)
    end

    it 'has the total time' 


    it 'has a title' 


    it 'has the URL' 


    it 'has an iid' 


    it 'has a created_at timestamp' 


    it "has the author's URL" 


    it "has the author's avatar URL" 


    it "has the author's name" 

  end

  def setup(context)
    milestone = create(:milestone, project: project)
    context.update(milestone: milestone)
    mr = create_merge_request_closing_issue(user, project, context, commit_message: "References #{context.to_reference}")

    ProcessCommitWorker.new.perform(project.id, user.id, mr.commits.last.to_hash)
  end
end

