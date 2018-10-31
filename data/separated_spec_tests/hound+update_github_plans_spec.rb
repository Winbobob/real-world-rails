require "rails_helper"

RSpec.describe UpdateGitHubPlans do
  describe ".call" do
    it "updates marketplace plan ids for all owners" 

  end

  def stub_marketplace_plans_for_account(ids_to_plans)
    url = %r{/marketplace_listing/plans/\d+/accounts}
    body = ids_to_plans.map do |id, plan_id|
      {
        id: id,
        marketplace_purchase: {
          plan: {
            id: plan_id,
          },
        },
      }
    end

    stub_request(:get, url).to_return(
      headers: { "Content-Type": "application/json" },
      body: body.to_json,
    )
  end
end

