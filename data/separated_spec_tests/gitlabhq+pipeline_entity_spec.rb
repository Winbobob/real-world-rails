require 'spec_helper'

describe PipelineEntity do
  set(:user) { create(:user) }
  let(:request) { double('request') }

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

      it 'contains required fields' 


      it 'excludes coverage data when disabled' 


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

        it 'contains retry path' 

      end

      context 'user does not have ability to retry pipeline' do
        it 'does not contain retry path' 

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

        it 'contains cancel path' 

      end

      context 'user does not have ability to cancel pipeline' do
        it 'does not contain cancel path' 

      end
    end

    context 'when pipeline ref is empty' do
      let(:pipeline) { create(:ci_empty_pipeline) }

      before do
        allow(pipeline).to receive(:ref).and_return(nil)
      end

      it 'does not generate branch path' 

    end

    context 'when pipeline has a failure reason set' do
      let(:pipeline) { create(:ci_empty_pipeline) }

      before do
        pipeline.drop!(:config_error)
      end

      it 'has a correct failure reason' 

    end
  end
end

