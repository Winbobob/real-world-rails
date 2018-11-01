require 'spec_helper'

describe StageEntity do
  let(:pipeline) { create(:ci_pipeline) }
  let(:request) { double('request') }
  let(:user) { create(:user) }

  let(:entity) do
    described_class.new(stage, request: request)
  end

  let(:stage) do
    build(:ci_stage, pipeline: pipeline, name: 'test')
  end

  before do
    allow(request).to receive(:current_user).and_return(user)
    create(:ci_build, :success, pipeline: pipeline)
  end

  describe '#as_json' do
    subject { entity.as_json }

    it 'contains relevant fields' 


    it 'contains detailed status' 


    it 'contains valid name' 


    it 'contains path to the stage' 


    it 'contains path to the stage dropdown' 


    it 'contains stage title' 


    context 'when the jobs should be grouped' do
      let(:entity) { described_class.new(stage, request: request, grouped: true) }

      it 'exposes the group key' 


      context 'and contains commit status' do
        before do
          create(:generic_commit_status, pipeline: pipeline, stage: 'test')
        end

        it 'contains commit status' 

      end
    end
  end
end

