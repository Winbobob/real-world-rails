require 'spec_helper'

describe Gitlab::Ci::Status::Build::Factory do
  let(:user) { create(:user) }
  let(:project) { build.project }
  let(:status) { factory.fabricate! }
  let(:factory) { described_class.new(build, user) }

  before do
    stub_not_protect_default_branch

    project.add_developer(user)
  end

  context 'when build is successful' do
    let(:build) { create(:ci_build, :success, :trace_artifact) }

    it 'matches correct core status' 


    it 'matches correct extended statuses' 


    it 'fabricates a retryable build status' 


    it 'fabricates status with correct details' 

  end

  context 'when build is erased' do
    let(:build) { create(:ci_build, :success, :erased) }

    it 'matches correct core status' 


    it 'matches correct extended statuses' 


    it 'fabricates a retryable build status' 


    it 'fabricates status with correct details' 

  end

  context 'when build is failed' do
    context 'when build is not allowed to fail' do
      let(:build) { create(:ci_build, :failed) }

      it 'matches correct core status' 


      it 'matches correct extended statuses' 


      it 'fabricates a failed build status' 


      it 'fabricates status with correct details' 

    end

    context 'when build is allowed to fail' do
      let(:build) { create(:ci_build, :failed, :allowed_to_fail, :trace_artifact) }

      it 'matches correct core status' 


      it 'matches correct extended statuses' 


      it 'fabricates a failed but allowed build status' 


      it 'fabricates status with correct details' 

    end
  end

  context 'when build is a canceled' do
    let(:build) { create(:ci_build, :canceled) }

    it 'matches correct core status' 


    it 'matches correct extended statuses' 


    it 'fabricates a retryable build status' 


    it 'fabricates status with correct details' 

  end

  context 'when build is running' do
    let(:build) { create(:ci_build, :running) }

    it 'matches correct core status' 


    it 'matches correct extended statuses' 


    it 'fabricates a canceable build status' 


    it 'fabricates status with correct details' 

  end

  context 'when build is pending' do
    let(:build) { create(:ci_build, :pending) }

    it 'matches correct core status' 


    it 'matches correct extended statuses' 


    it 'fabricates a cancelable build status' 


    it 'fabricates status with correct details' 

  end

  context 'when build is skipped' do
    let(:build) { create(:ci_build, :skipped) }

    it 'matches correct core status' 


    it 'matches correct extended statuses' 


    it 'fabricates a skipped build status' 


    it 'fabricates status with correct details' 

  end

  context 'when build is a manual action' do
    context 'when build is a play action' do
      let(:build) { create(:ci_build, :playable) }

      it 'matches correct core status' 


      it 'matches correct extended statuses' 


      it 'fabricates action detailed status' 


      it 'fabricates status with correct details' 


      context 'when user has ability to play action' do
        it 'fabricates status that has action' 

      end

      context 'when user does not have ability to play action' do
        before do
          allow(build.project).to receive(:empty_repo?).and_return(false)

          create(:protected_branch, :no_one_can_push,
                 name: build.ref, project: build.project)
        end

        it 'fabricates status that has no action' 

      end
    end

    context 'when build is an environment stop action' do
      let(:build) { create(:ci_build, :playable, :teardown_environment) }

      it 'matches correct core status' 


      it 'matches correct extended statuses' 


      it 'fabricates action detailed status' 


      context 'when user is not allowed to execute manual action' do
        before do
          allow(build.project).to receive(:empty_repo?).and_return(false)

          create(:protected_branch, :no_one_can_push,
                 name: build.ref, project: build.project)
        end

        it 'fabricates status with correct details' 

      end
    end
  end

  context 'when build is a delayed action' do
    let(:build) { create(:ci_build, :scheduled) }

    it 'matches correct core status' 


    it 'matches correct extended statuses' 


    it 'fabricates action detailed status' 


    it 'fabricates status with correct details' 


    context 'when user has ability to play action' do
      it 'fabricates status that has action' 

    end

    context 'when user does not have ability to play action' do
      before do
        allow(build.project).to receive(:empty_repo?).and_return(false)

        create(:protected_branch, :no_one_can_push,
                name: build.ref, project: build.project)
      end

      it 'fabricates status that has no action' 

    end
  end
end

