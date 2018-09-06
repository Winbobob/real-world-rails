require 'spec_helper'

feature 'Schedules', js: true do
  include AuthenticationWorkflow
  include WebHelper

  context "as an enterprise user" do
    let(:user) { create(:user, enterprise_limit: 10) }
    let(:managed_enterprise) { create(:distributor_enterprise, owner: user, enable_subscriptions: true) }
    let(:unmanaged_enterprise) { create(:distributor_enterprise, enable_subscriptions: true) }
    let(:managed_enterprise2) { create(:distributor_enterprise, owner: user, enable_subscriptions: true) }
    let!(:oc1) { create(:simple_order_cycle, coordinator: managed_enterprise, name: 'oc1') }
    let!(:oc2) { create(:simple_order_cycle, coordinator: managed_enterprise, name: 'oc2') }
    let!(:oc3) { create(:simple_order_cycle, coordinator: managed_enterprise, name: 'oc3') }
    let!(:oc4) { create(:simple_order_cycle, coordinator: unmanaged_enterprise, distributors: [managed_enterprise], name: 'oc4') }
    let!(:oc5) { create(:simple_order_cycle, coordinator: managed_enterprise2, name: 'oc5') }
    let!(:weekly_schedule) { create(:schedule, name: 'Weekly', order_cycles: [oc1, oc2, oc3, oc4]) }

    before { login_to_admin_as user }

    describe "Adding a new Schedule" do
      it "immediately shows the schedule in the order cycle list once created" 

    end

    describe "updating existing schedules" do
      let!(:fortnightly_schedule) { create(:schedule, name: 'Fortnightly', order_cycles: [oc1, oc3]) }

      it "immediately shows updated schedule lists for order cycles" 

    end

    describe "deleting a schedule" do
      it "immediately removes deleted schedules from order cycles" 

    end
  end
end

