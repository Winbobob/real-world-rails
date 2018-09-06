require 'spec_helper'

module Admin
  describe OrderCyclesController, type: :controller do
    include AuthenticationWorkflow

    let!(:distributor_owner) { create_enterprise_user enterprise_limit: 2 }

    before do
      controller.stub spree_current_user: distributor_owner
    end

    describe "#index" do
      describe "when the user manages a coordinator" do
        let!(:coordinator) { create(:distributor_enterprise, owner: distributor_owner) }
        let!(:oc1) { create(:simple_order_cycle, orders_open_at: 70.days.ago, orders_close_at: 60.days.ago ) }
        let!(:oc2) { create(:simple_order_cycle, orders_open_at: 70.days.ago, orders_close_at: 40.days.ago ) }
        let!(:oc3) { create(:simple_order_cycle, orders_open_at: 70.days.ago, orders_close_at: 20.days.ago ) }
        let!(:oc4) { create(:simple_order_cycle, orders_open_at: 70.days.ago, orders_close_at: nil ) }

        context "html" do
          it "doesn't load any data" 

        end

        context "json" do
          context "where ransack conditions are specified" do
            it "loads order cycles that closed within the past month, and orders without a close_at date" 

          end

          context "where q[orders_close_at_gt] is set" do
            let(:q) { { orders_close_at_gt: 45.days.ago } }

            it "loads order cycles that closed after the specified date, and orders without a close_at date" 


            context "and other conditions are specified" do
              before { q.merge!(id_not_in: [oc2.id, oc4.id]) }

              it "loads order cycles that meet all conditions" 

            end
          end
        end
      end
    end

    describe "new" do
      describe "when the user manages a single distributor enterprise suitable for coordinator" do
        let!(:distributor) { create(:distributor_enterprise, owner: distributor_owner) }

        it "renders the new template" 

      end

      describe "when a user manages multiple enterprises suitable for coordinator" do
        let!(:distributor1) { create(:distributor_enterprise, owner: distributor_owner) }
        let!(:distributor2) { create(:distributor_enterprise, owner: distributor_owner) }
        let!(:distributor3) { create(:distributor_enterprise) }

        it "renders the set_coordinator template" 


        describe "and a coordinator_id is submitted as part of the request" do
          describe "when the user manages the enterprise" do
            it "renders the new template" 

          end

          describe "when the user does not manage the enterprise" do
            it "renders the set_coordinator template and sets a flash error" 

          end
        end
      end
    end

    describe "update" do
      let(:order_cycle) { create(:simple_order_cycle) }
      let(:producer) { create(:supplier_enterprise) }
      let(:coordinator) { order_cycle.coordinator }
      let(:hub) { create(:distributor_enterprise) }
      let(:v) { create(:variant) }
      let!(:incoming_exchange) { create(:exchange, order_cycle: order_cycle, sender: producer, receiver: coordinator, incoming: true, variants: [v]) }
      let!(:outgoing_exchange) { create(:exchange, order_cycle: order_cycle, sender: coordinator, receiver: hub, incoming: false, variants: [v]) }

      context "as a manager of the coordinator" do
        before { login_as_enterprise_user([coordinator]) }

        it "sets flash message when page is reloading" 


        it "does not set flash message otherwise" 


        context "when updating without explicitly submitting exchanges" do
          let(:form_applicator_mock) { double(:form_applicator) }

          before do
            allow(OpenFoodNetwork::OrderCycleFormApplicator).to receive(:new) { form_applicator_mock }
            allow(form_applicator_mock).to receive(:go!) { nil }
          end

          it "does not run the OrderCycleFormApplicator" 

        end

        context "when a validation error occurs" do
          let(:params) {
            {
              format: :json,
              id: order_cycle.id,
              order_cycle: { orders_open_at: order_cycle.orders_close_at + 1.day }
            }
          }

          it "returns an error message" 

        end
      end

      context "as a producer supplying to an order cycle" do
        before do
          login_as_enterprise_user [producer]
        end

        describe "removing a variant from incoming" do
          let(:params) do
            {order_cycle: {
               incoming_exchanges: [{id: incoming_exchange.id, enterprise_id: producer.id, sender_id: producer.id, variants: {v.id => false}}],
               outgoing_exchanges: [{id: outgoing_exchange.id, enterprise_id: hub.id,      receiver_id: hub.id,    variants: {v.id => false}}] }
            }
          end

          it "removes the variant from outgoing also" 

        end
      end
    end

    describe "updating schedules" do
      let(:user) { create(:user, enterprise_limit: 10) }
      let!(:managed_coordinator) { create(:enterprise, owner: user) }
      let!(:managed_enterprise) { create(:enterprise, owner: user) }
      let!(:coordinated_order_cycle) { create(:simple_order_cycle, coordinator: managed_coordinator ) }
      let!(:coordinated_order_cycle2) { create(:simple_order_cycle, coordinator: managed_enterprise ) }
      let!(:uncoordinated_order_cycle) { create(:simple_order_cycle, coordinator: create(:enterprise) ) }
      let!(:coordinated_schedule) { create(:schedule, order_cycles: [coordinated_order_cycle] ) }
      let!(:coordinated_schedule2) { create(:schedule, order_cycles: [coordinated_order_cycle2] ) }
      let!(:uncoordinated_schedule) { create(:schedule, order_cycles: [uncoordinated_order_cycle] ) }

      context "where I manage the order_cycle's coordinator" do
        render_views

        before do
          controller.stub spree_current_user: user
        end

        it "allows me to assign only schedules that already I coordinate to the order cycle" 


        it "syncs proxy orders when schedule_ids change" 

      end
    end

    describe "bulk_update" do
      let(:oc) { create(:simple_order_cycle) }
      let!(:coordinator) { oc.coordinator }

      context "when I manage the coordinator of an order cycle" do
        let(:params) do
          { format: :json, order_cycle_set: { collection_attributes: { '0' => {
            id: oc.id,
            orders_open_at: Date.current - 21.days,
            orders_close_at: Date.current + 21.days,
          } } } }
        end

        before { create(:enterprise_role, user: distributor_owner, enterprise: coordinator) }

        it "updates order cycle properties" 


        it "does nothing when no data is supplied" 


        context "when a validation error occurs" do
          before do
            params[:order_cycle_set][:collection_attributes]['0'][:orders_open_at] = Date.current + 25.days
          end

          it "returns an error message" 

        end
      end

      context "when I do not manage the coordinator of an order cycle" do
        # I need to manage a hub in order to access the bulk_update action
        let!(:another_distributor) { create(:distributor_enterprise, users: [distributor_owner]) }

        it "doesn't update order cycle properties" 

      end
    end


    describe "notifying producers" do
      let(:user) { create_enterprise_user }
      let(:admin_user) do
        user = create(:user)
        user.spree_roles << Spree::Role.find_or_create_by_name!('admin')
        user
      end
      let(:order_cycle) { create(:simple_order_cycle) }

      before do
        controller.stub spree_current_user: admin_user
      end

      it "enqueues a job" 


      it "redirects back to the order cycles path with a success message" 

    end


    describe "destroy" do
      let(:distributor) { create(:distributor_enterprise, owner: distributor_owner) }
      let(:oc) { create(:simple_order_cycle, coordinator: distributor) }

      describe "when an order cycle is deleteable" do
        it "allows the order_cycle to be destroyed" 

      end

      describe "when an order cycle becomes non-deletable due to the presence of an order" do
        let!(:order) { create(:order, order_cycle: oc) }

        it "displays an error message when we attempt to delete it" 

      end

      describe "when an order cycle becomes non-deletable because it is linked to a schedule" do
        let!(:schedule) { create(:schedule, order_cycles: [oc]) }

        it "displays an error message when we attempt to delete it" 

      end
    end
  end
end
