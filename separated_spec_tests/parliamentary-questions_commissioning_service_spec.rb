require 'spec_helper'

describe CommissioningService do
  let(:pq) {
    DBHelpers.pqs.first
  }

  let(:minister) {
    DBHelpers.ministers[0]
  }
  let(:policy_minister) {
    DBHelpers.ministers[1]
  }

  let(:ao1) {
    DBHelpers.action_officers[0]
  }

  let(:ao2) {
    DBHelpers.action_officers[1]
  }

  let(:form_params) {{
    pq_id: pq.id,
    minister_id: minister.id,
    policy_minister_id: policy_minister.id,
    action_officer_id: [ao1.id, ao2.id],
    date_for_answer: Date.tomorrow,
    internal_deadline: Date.today
  }}

  let(:invalid_form_params) {
    form_params.merge(date_for_answer: nil)
  }

  let(:form) {
    CommissionForm.new(form_params)
  }

  let(:invalid_form) {
    CommissionForm.new(invalid_form_params)
  }


  describe "#commission" do
    context "when the supplied form data is not valid" do
      it "raises an error" 

    end

    context "when the supplied data is valid" do
      before do
        valid_form = CommissionForm.new(form_params)
        @pq        = CommissioningService.new.commission(valid_form)
      end

      it "returns an updated PQ" 


      it "sets the pqs' action officers" 


      it "notifies the action officers" 


      it "sets the PQ state to 'no-response'" 

    end
  end
end

