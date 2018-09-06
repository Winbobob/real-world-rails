require 'open_food_network/enterprise_issue_validator'

module OpenFoodNetwork
  describe EnterpriseIssueValidator do
    describe "warnings" do
      let(:enterprise_invisible) { create(:enterprise, visible: false) }
      let(:warnings) { EnterpriseIssueValidator.new(enterprise_invisible).warnings }

      it "reports invisible enterprises" 

    end
  end
end

