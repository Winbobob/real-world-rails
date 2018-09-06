require 'spec_helper'

describe PipelineDetailsEntity do
  set(:user) { create(:user) }
  let(:request) { double('request') }

  it 'inherrits from PipelineEntity' 


  before do
    stub_not_protect_default_branch

    allow(request).to receive(:current_user).and_return(user)
  end

  let(:entity) do
    described_class.represent(pipeline, request: request)
  end

  describe '#as_json' do
    subject { entity.as_json }

    context 'when pipeline is empty' do
      let(:pipeline) { create(:ci_empty_pipeline) }

      it 'contains details' 


      it 'contains flags' 

    end

    context 'when pipeline is retryable' do
      let(:project) { create(:project) }

      let(:pipeline) do
        create(:ci_pipeline, status: :success, project: project)
      end

      before do
        create(:ci_build, :failed, pipeline: pipeline)
      end

      context 'user has ability to retry pipeline' do
        before do
          project.add_developer(user)
        end

        it 'retryable flag is true' 

      end

      context 'user does not have ability to retry pipeline' do
        it 'retryable flag is false' 

      end
    end

    context 'when pipeline is cancelable' do
      let(:project) { create(:project) }

      let(:pipeline) do
        create(:ci_pipeline, status: :running, project: project)
      end

      before do
        create(:ci_build, :pending, pipeline: pipeline)
      end

      context 'user has ability to cancel pipeline' do
        before do
          project.add_developer(user)
        end

        it 'cancelable flag is true' 

      end

      context 'user does not have ability to cancel pipeline' do
        it 'cancelable flag is false' 

      end
    end

    context 'when pipeline has commit statuses' do
      let(:pipeline) { create(:ci_empty_pipeline) }

      before do
        create(:generic_commit_status, pipeline: pipeline)
      end

      it 'contains stages' 

    end

    context 'when pipeline has YAML errors' do
      let(:pipeline) do
        create(:ci_pipeline, config: { rspec: { invalid: :value } })
      end

      it 'contains information about error' 


      it 'contains flag that indicates there are errors' 

    end

    context 'when pipeline does not have YAML errors' do
      let(:pipeline) { create(:ci_empty_pipeline) }

      it 'does not contain field that normally holds an error' 


      it 'contains flag that indicates there are no errors' 

    end
  end
end

