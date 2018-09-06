require 'spec_helper'

describe 'cycle analytics events' do
  let(:user) { create(:user) }
  let(:project) { create(:project, :repository, public_builds: false) }
  let(:issue) {  create(:issue, project: project, created_at: 2.days.ago) }

  describe 'GET /:namespace/:project/cycle_analytics/events/issues' do
    before do
      project.add_developer(user)

      3.times do |count|
        Timecop.freeze(Time.now + count.days) do
          create_cycle
        end
      end

      deploy_master(user, project)

      login_as(user)
    end

    it 'lists the issue events' 


    it 'lists the plan events' 


    it 'lists the code events' 


    it 'lists the test events' 


    it 'lists the review events' 


    it 'lists the staging events' 


    it 'lists the production events' 


    context 'specific branch' do
      it 'lists the test events' 

    end

    context 'with private project and builds' do
      before do
        project.members.last.update(access_level: Gitlab::Access::GUEST)
      end

      it 'does not list the test events' 


      it 'does not list the staging events' 


      it 'lists the issue events' 

    end
  end

  def create_cycle
    milestone = create(:milestone, project: project)
    issue.update(milestone: milestone)
    mr = create_merge_request_closing_issue(user, project, issue, commit_message: "References #{issue.to_reference}")

    pipeline = create(:ci_empty_pipeline, status: 'created', project: project, ref: mr.source_branch, sha: mr.source_branch_sha, head_pipeline_of: mr)
    pipeline.run

    create(:ci_build, pipeline: pipeline, status: :success, author: user)
    create(:ci_build, pipeline: pipeline, status: :success, author: user)

    merge_merge_requests_closing_issue(user, project, issue)

    ProcessCommitWorker.new.perform(project.id, user.id, mr.commits.last.to_hash)
  end
end

