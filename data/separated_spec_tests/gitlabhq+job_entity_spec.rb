require 'spec_helper'

describe JobEntity do
  let(:user) { create(:user) }
  let(:job) { create(:ci_build) }
  let(:project) { job.project }
  let(:request) { double('request') }

  before do
    stub_not_protect_default_branch
    allow(request).to receive(:current_user).and_return(user)

    project.add_developer(user)
  end

  let(:entity) do
    described_class.new(job, request: request)
  end

  subject { entity.as_json }

  it 'contains paths to job page action' 


  it 'does not contain sensitive information' 


  it 'contains whether it is playable' 


  it 'contains timestamps' 


  it 'contains details' 


  context 'when job is retryable' do
    before do
      job.update(status: :failed)
    end

    it 'contains cancel path' 

  end

  context 'when job is cancelable' do
    before do
      job.update(status: :running)
    end

    it 'contains cancel path' 

  end

  context 'when job is a regular job' do
    it 'does not contain path to play action' 


    it 'is not a playable build' 

  end

  context 'when job is a manual action' do
    let(:job) { create(:ci_build, :manual) }

    context 'when user is allowed to trigger action' do
      before do
        project.add_developer(user)

        create(:protected_branch, :developers_can_merge,
               name: job.ref, project: job.project)
      end

      it 'contains path to play action' 


      it 'is a playable action' 

    end

    context 'when user is not allowed to trigger action' do
      before do
        allow(job.project).to receive(:empty_repo?).and_return(false)

        create(:protected_branch, :no_one_can_push,
               name: job.ref, project: job.project)
      end

      it 'does not contain path to play action' 


      it 'is not a playable action' 

    end
  end

  context 'when job is scheduled' do
    let(:job) { create(:ci_build, :scheduled) }

    it 'contains path to unschedule action' 


    it 'contains scheduled_at' 

  end

  context 'when job is generic commit status' do
    let(:job) { create(:generic_commit_status, target_url: 'http://google.com') }

    it 'contains paths to target action' 


    it 'does not contain paths to other action paths' 


    it 'contains timestamps' 


    it 'contains details' 

  end

  context 'when job failed' do
    let(:job) { create(:ci_build, :api_failure) }

    it 'contains details' 


    it 'states that it failed' 


    it 'should indicate the failure reason on tooltip' 


    it 'should include a callout message with a verbose output' 


    it 'should state that it is not recoverable' 

  end

  context 'when job is allowed to fail' do
    let(:job) { create(:ci_build, :allowed_to_fail, :api_failure) }

    it 'contains details' 


    it 'states that it failed' 


    it 'should indicate the failure reason on tooltip' 


    it 'should include a callout message with a verbose output' 


    it 'should state that it is not recoverable' 

  end

  context 'when the job failed with a script failure' do
    let(:job) { create(:ci_build, :failed, :script_failure) }

    it 'should not include callout message or recoverable keys' 

  end

  context 'when job failed and is recoverable' do
    let(:job) { create(:ci_build, :api_failure) }

    it 'should state it is recoverable' 

  end

  context 'when job passed' do
    let(:job) { create(:ci_build, :success) }

    it 'should not include callout message or recoverable keys' 

  end
end

