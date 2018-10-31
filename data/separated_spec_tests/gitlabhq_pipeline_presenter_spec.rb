require 'spec_helper'

describe Ci::PipelinePresenter do
  let(:project) { create(:project) }
  let(:pipeline) { create(:ci_pipeline, project: project) }

  subject(:presenter) do
    described_class.new(pipeline)
  end

  it 'inherits from Gitlab::View::Presenter::Delegated' 


  describe '#initialize' do
    it 'takes a pipeline and optional params' 


    it 'exposes pipeline' 


    it 'forwards missing methods to pipeline' 

  end

  describe '#status_title' do
    context 'when pipeline is auto-canceled' do
      before do
        expect(pipeline).to receive(:auto_canceled?).and_return(true)
        expect(pipeline).to receive(:auto_canceled_by_id).and_return(1)
      end

      it 'shows that the pipeline is auto-canceled' 

    end

    context 'when pipeline is not auto-canceled' do
      before do
        expect(pipeline).to receive(:auto_canceled?).and_return(false)
      end

      it 'does not have a status title' 

    end
  end

  context '#failure_reason' do
    context 'when pipeline has failure reason' do
      it 'represents a failure reason sentence' 

    end

    context 'when pipeline does not have failure reason' do
      it 'returns nil' 

    end
  end
end

