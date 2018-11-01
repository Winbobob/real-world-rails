require 'spec_helper'

describe Gitlab::Ci::Status::Pipeline::Factory do
  let(:user) { create(:user) }
  let(:project) { pipeline.project }
  let(:status) { factory.fabricate! }
  let(:factory) { described_class.new(pipeline, user) }

  before do
    project.add_developer(user)
  end

  context 'when pipeline has a core status' do
    (HasStatus::AVAILABLE_STATUSES - HasStatus::BLOCKED_STATUS).each do |simple_status|
      context "when core status is #{simple_status}" do
        let(:pipeline) { create(:ci_pipeline, status: simple_status) }

        let(:expected_status) do
          Gitlab::Ci::Status.const_get(simple_status.capitalize)
        end

        it "matches correct core status for #{simple_status}" 


        it 'does not match extended statuses' 


        it "fabricates a core status #{simple_status}" 


        it 'extends core status with common pipeline methods' 

      end
    end

    context "when core status is manual" do
      let(:pipeline) { create(:ci_pipeline, status: :manual) }

      it "matches manual core status" 


      it 'matches a correct extended statuses' 


      it 'extends core status with common pipeline methods' 

    end

    context "when core status is scheduled" do
      let(:pipeline) { create(:ci_pipeline, status: :scheduled) }

      it "matches scheduled core status" 


      it 'matches a correct extended statuses' 


      it 'extends core status with common pipeline methods' 

    end
  end

  context 'when pipeline has warnings' do
    let(:pipeline) do
      create(:ci_pipeline, status: :success)
    end

    before do
      create(:ci_build, :allowed_to_fail, :failed, pipeline: pipeline)
    end

    it 'matches correct core status' 


    it 'matches correct extended statuses' 


    it 'fabricates extended "success with warnings" status' 


    it 'extends core status with common pipeline method' 

  end
end

