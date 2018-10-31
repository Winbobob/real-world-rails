require 'spec_helper'

describe Ci::BuildPresenter do
  let(:project) { create(:project) }
  let(:pipeline) { create(:ci_pipeline, project: project) }
  let(:build) { create(:ci_build, pipeline: pipeline) }

  subject(:presenter) do
    described_class.new(build)
  end

  it 'inherits from Gitlab::View::Presenter::Delegated' 


  describe '#initialize' do
    it 'takes a build and optional params' 


    it 'exposes build' 


    it 'forwards missing methods to build' 

  end

  describe '#erased_by_user?' do
    it 'takes a build and optional params' 

  end

  describe '#erased_by_name' do
    context 'when build is not erased' do
      before do
        expect(presenter).to receive(:erased_by_user?).and_return(false)
      end

      it 'returns nil' 

    end

    context 'when build is erased' do
      before do
        expect(presenter).to receive(:erased_by_user?).and_return(true)
        expect(build).to receive(:erased_by)
          .and_return(double(:user, name: 'John Doe'))
      end

      it 'returns the name of the eraser' 

    end
  end

  describe '#status_title' do
    context 'when build is auto-canceled' do
      before do
        expect(build).to receive(:auto_canceled?).and_return(true)
        expect(build).to receive(:auto_canceled_by_id).and_return(1)
      end

      it 'shows that the build is auto-canceled' 

    end

    context 'when build failed' do
      let(:build) { create(:ci_build, :failed, pipeline: pipeline) }

      it 'returns the reason of failure' 

    end

    context 'when build has failed && retried' do
      let(:build) { create(:ci_build, :failed, :retried, pipeline: pipeline) }

      it 'does not include retried title' 

    end

    context 'when build has failed and is allowed to' do
      let(:build) { create(:ci_build, :failed, :allowed_to_fail, pipeline: pipeline) }

      it 'returns the reason of failure' 

    end

    context 'For any other build' do
      let(:build) { create(:ci_build, :success, pipeline: pipeline) }

      it 'returns the status' 

    end
  end

  describe 'quack like a Ci::Build permission-wise' do
    context 'user is not allowed' do
      let(:project) { create(:project, public_builds: false) }

      it 'returns false' 

    end

    context 'user is allowed' do
      let(:project) { create(:project, :public) }

      it 'returns true' 

    end
  end

  describe '#trigger_variables' do
    let(:build) { create(:ci_build, pipeline: pipeline, trigger_request: trigger_request) }
    let(:trigger) { create(:ci_trigger, project: project) }
    let(:trigger_request) { create(:ci_trigger_request, pipeline: pipeline, trigger: trigger) }

    context 'when variable is stored in ci_pipeline_variables' do
      let!(:pipeline_variable) { create(:ci_pipeline_variable, pipeline: pipeline) }

      context 'when pipeline is triggered by trigger API' do
        it 'returns variables' 

      end

      context 'when pipeline is not triggered by trigger API' do
        let(:build) { create(:ci_build, pipeline: pipeline) }

        it 'does not return variables' 

      end
    end

    context 'when variable is stored in ci_trigger_requests.variables' do
      before do
        trigger_request.update_attribute(:variables, { 'TRIGGER_KEY_1' => 'TRIGGER_VALUE_1' } )
      end

      it 'returns variables' 

    end
  end

  describe '#tooltip_message' do
    context 'When build has failed' do
      let(:build) { create(:ci_build, :script_failure, pipeline: pipeline) }

      it 'returns the reason of failure' 

    end

    context 'When build has failed and retried' do
      let(:build) { create(:ci_build, :script_failure, :retried, pipeline: pipeline) }

      it 'should include the reason of failure and the retried title' 

    end

    context 'When build has failed and is allowed to' do
      let(:build) { create(:ci_build, :script_failure, :allowed_to_fail, pipeline: pipeline) }

      it 'should include the reason of failure' 

    end

    context 'For any other build (no retried)' do
      let(:build) { create(:ci_build, :success, pipeline: pipeline) }

      it 'should include build name and status' 

    end

    context 'For any other build (retried)' do
      let(:build) { create(:ci_build, :success, :retried, pipeline: pipeline) }

      it 'should include build name and status' 

    end
  end

  describe '#callout_failure_message' do
    let(:build) { create(:ci_build, :failed, :script_failure) }

    it 'returns a verbose failure reason' 

  end

  describe '#recoverable?' do
    let(:build) { create(:ci_build, :failed, :script_failure) }

    context 'when is a script or missing dependency failure' do
      let(:failure_reasons) { %w(script_failure missing_dependency_failure) }

      it 'should return false' 

    end

    context 'when is any other failure type' do
      let(:failure_reasons) { %w(unknown_failure api_failure stuck_or_timeout_failure runner_system_failure) }

      it 'should return true' 

    end
  end
end

