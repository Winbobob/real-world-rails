require "rails_helper"
require "support/shared_examples/views/content_forms"

RSpec.describe "outputs/new.html.erb", type: :view do
  let(:study) { FactoryGirl.create(:study) }

  context "when the publication form is invalid" do
    let(:resource_name) { :publication }
    let(:resource) do
      FactoryGirl.build(:publication, study: study, article_title: nil)
    end
    let(:expected_error) { "Article title can't be blank" }
    let(:form_field) { "output-type-publication" }

    it_behaves_like "content form view"
  end

  context "when the dissemination form is invalid" do
    let(:resource_name) { :dissemination }
    let(:resource) do
      FactoryGirl.build(:dissemination, study: study, details: nil)
    end
    let(:expected_error) { "Details can't be blank" }
    let(:form_field) { "output-type-dissemination" }

    it_behaves_like "content form view"
  end

  context "when the impact form is invalid" do
    context "when there's one invalid impact" do
      let(:study_impact) do
        FactoryGirl.build(:study_impact, study: study, description: nil)
      end

      before do
        study_impact.valid?
        assign(:study, study)
        assign(:study_impacts_errors, true)
        study_impacts = {
          study_impact.impact_type.id => study_impact
        }
        assign(:study_impacts, study_impacts)
        render
      end

      it "prints an error message" 


      it "opens the impact subform" 

    end

    context "when there are multiple invalid impacts" do
      let(:programme_impact) { FactoryGirl.create(:programme_impact) }
      let(:msf_policy_impact) { FactoryGirl.create(:msf_policy_impact) }
      let(:study_impact) do
        FactoryGirl.build(:study_impact, study: study,
                                         description: nil,
                                         impact_type: msf_policy_impact)
      end
      let(:study_impact_2) do
        FactoryGirl.build(:study_impact, study: study,
                                         description: nil,
                                         impact_type: programme_impact)
      end

      before do
        study_impact.valid?
        study_impact_2.valid?
        assign(:study, study)
        assign(:study_impacts_errors, true)
        study_impacts = {
          msf_policy_impact.id => study_impact,
          programme_impact.id => study_impact_2
        }
        assign(:study_impacts, study_impacts)
        render
      end

      it "prints an error message for each impact" 


      it "opens the impact subform" 

    end
  end
end

