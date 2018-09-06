require 'spec_helper'

describe BuildActionEntity do
  let(:job) { create(:ci_build, name: 'test_job') }
  let(:request) { double('request') }

  let(:entity) do
    described_class.new(job, request: spy('request'))
  end

  describe '#as_json' do
    subject { entity.as_json }

    it 'contains original job name' 


    it 'contains path to the action play' 


    it 'contains whether it is playable' 

  end
end

