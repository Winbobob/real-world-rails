require 'rails_helper'

RSpec.describe InjectionAttemptsController, type: :controller do
  describe "PATCH #dismiss" do
    let(:case_worker) { create(:case_worker) }
    let(:claim) { create(:submitted_claim) }
    let(:injection_attempt) { create(:injection_attempt, :with_errors, claim: claim) }

    def do_put
      put :dismiss, params: { id: injection_attempt.id }, format: :js
      injection_attempt.reload
    end

    before do
      sign_in case_worker.user
      expect(injection_attempt).to be_active
      do_put
    end

    it "returns http success" 


    it 'assigns injection attempt to @injection_attempt' 


    it 'assigns result to @dismissed' 


    it "softley deletes the injection attempt" 

  end
end

