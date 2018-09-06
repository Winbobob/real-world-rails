require "katello_test_helper"

module Katello
  describe Api::Rhsm::CandlepinProxiesController do
    before do
      setup_engine_routes
    end

    describe "routing" do
      let(:proxies_controller) { "katello/api/rhsm/candlepin_proxies" }
      let(:dynflow_proxy_controller) { "katello/api/rhsm/candlepin_dynflow_proxy" }

      it "should route to the correct controller actions" 

    end
  end
end

