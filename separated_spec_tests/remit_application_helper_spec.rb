require "rails_helper"

RSpec.describe ApplicationHelper, type: :helper do
  describe "#study_timeline" do
    let(:accept_status) { FactoryGirl.create(:accept) }
    let(:base_timeline) do
      {
        concept: { label: "Concept", state: "todo" },
        protocol_erb: { label: "Protocol & ERB", state: "todo" },
        delivery: { label: "Delivery", state: "todo" },
        completion: { label: "Completion", state: "todo" },
      }
    end

    context "given a study with no history" do
      context "when the study is in the concept stage" do
        let(:study) { FactoryGirl.create(:study) }

        it "returns a timeline with one entry" 

      end

      context "when the study is in the protocol_erb stage" do
        let(:study) do
          FactoryGirl.create(:study, study_stage: "protocol_erb",
                                     erb_status: accept_status)
        end

        it "returns a timeline with multiple entries" 

      end

      context "when the study is in the completion stage" do
        let(:study) do
          FactoryGirl.create(:study, study_stage: "completion",
                                     erb_status: accept_status)
        end

        it "returns a timeline with multiple entries" 

      end

      context "when the study is in the withdrawn stage" do
        let(:study) do
          FactoryGirl.create(:study, study_stage: "withdrawn_postponed")
        end

        it "returns a timeline with two entries" 

      end

      context "when the study is archived" do
        let(:study) do
          FactoryGirl.create(
            :study,
            study_stage: "completion",
            completed: Time.zone.today - (5.years + 1.day),
            protocol_needed: false)
        end

        it "returns a timeline with multiple entries" 

      end
    end

    context "given a study with history" do
      let(:study) { FactoryGirl.create(:study) }

      before do
        PublicActivity.enabled = true
      end

      after do
        PublicActivity.enabled = false
      end

      context "when the study is in the concept stage" do
        let(:study) { FactoryGirl.create(:study) }

        it "returns a timeline with one entry" 

      end

      context "when the study is in the protocol_erb stage" do
        let(:study) { FactoryGirl.create(:study) }

        it "returns a timeline with multiple entries" 

      end

      context "when the study is in the completion stage" do
        let(:study) { FactoryGirl.create(:study) }

        it "returns a timeline with multiple entries" 

      end

      context "when a study has skipped a stage" do
        let(:study) { FactoryGirl.create(:study) }

        it "returns a timeline with multiple entries" 

      end

      context "when a study is in the withdrawn stage" do
        let(:study) { FactoryGirl.create(:study) }

        it "returns a timeline with entries only for completed stages" 

      end

      context "when the study is archived" do
        let(:study) { FactoryGirl.create(:study) }

        it "returns a timeline with multiple entries" 

      end
    end
  end

  describe "#study_stage_transition" do
    let(:non_final_stages) do
      Study.study_stages.select do |s|
        s != "withdrawn_postponed" && s != "completed"
      end
    end

    context "when the after stage is withdrawn" do
      it "returns 'Study was withdrawn or postponed'" 

    end

    context "when the after stage is completed" do
      it "returns 'Study completed'" 

    end

    context "when the before stage is concept" do
      it "returns 'Concept note approved'" 

    end

    context "when the before stage is protocol" do
      it "returns 'Protocol passed ERB'" 

    end

    context "when the before stage is delivery" do
      it "returns 'Delivery ended'" 

    end

    context "when the stages are nil" do
      it "returns nil" 

    end
  end

  describe "#total_not_archived_or_withdrawn_studies" do
    it "returns the total number of non archived or withdrawn studies" 

  end

  describe "#total_not_withdrawn_studies" do
    it "returns the total number of non withdrawn studies" 

  end

  describe "#total_locations" do
    it "returns the total number of distinct locations" 

  end

  describe "#total_impactful_studies" do
    it "returns the total number of impactful studies" 

  end
end

