require 'open_food_network/proxy_order_syncer'

module OpenFoodNetwork
  describe ProxyOrderSyncer, performance: true do
    let(:start) { Time.zone.now.beginning_of_day }
    let!(:schedule) { create(:schedule, order_cycles: order_cycles) }

    let!(:order_cycles) do
      Array.new(10) do |i|
        create(:simple_order_cycle, orders_open_at: start + i.days, orders_close_at: start + (i + 1).days )
      end
    end

    let!(:subscriptions) do
      Array.new(150) do |_i|
        create(:subscription, schedule: schedule, begins_at: start, ends_at: start + 10.days)
      end
      Subscription.where(schedule_id: schedule)
    end

    context "measuring performance for initialisation" do
      it "reports the average run time for adding 10 OCs to 150 subscriptions" 

    end

    context "measuring performance for removal" do
      it "reports the average run time for removing 8 OCs from 150 subscriptions" 

    end
  end
end

