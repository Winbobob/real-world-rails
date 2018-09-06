require 'spec_helper'

describe Admin::SchedulesController, type: :controller do
  include AuthenticationWorkflow

  describe "index" do
    let!(:coordinated_order_cycle) { create(:simple_order_cycle) }
    let!(:managed_coordinator) { coordinated_order_cycle.coordinator }
    let!(:other_order_cycle) { create(:simple_order_cycle, coordinator: create(:enterprise)) }
    let!(:coordinated_schedule) { create(:schedule, order_cycles: [coordinated_order_cycle] ) }
    let!(:uncoordinated_schedule) { create(:schedule, order_cycles: [other_order_cycle] ) }

    context "html" do
      context "where I manage an order cycle coordinator" do
        before do
          controller.stub spree_current_user: managed_coordinator.owner
        end

        it "returns an empty @collection" 

      end
    end

    context "json" do
      context "where I manage an order cycle coordinator" do
        before do
          controller.stub spree_current_user: managed_coordinator.owner
        end

        let(:params) { { format: :json } }

        it "scopes @collection to schedules containing order_cycles coordinated by enterprises I manage" 


        it "serializes the data" 

      end

      context "where I manage an order cycle coordinator" do
        it "returns an empty collection" 

      end
    end
  end

  describe "update" do
    let(:user) { create(:user, enterprise_limit: 10) }
    let!(:managed_coordinator) { create(:enterprise, owner: user) }
    let!(:managed_enterprise) { create(:enterprise, owner: user) }
    let!(:coordinated_order_cycle) { create(:simple_order_cycle, coordinator: managed_coordinator ) }
    let!(:coordinated_order_cycle2) { create(:simple_order_cycle, coordinator: managed_enterprise ) }
    let!(:uncoordinated_order_cycle) { create(:simple_order_cycle, coordinator: create(:enterprise) ) }
    let!(:uncoordinated_order_cycle2) { create(:simple_order_cycle, coordinator: create(:enterprise)) }
    let!(:uncoordinated_order_cycle3) { create(:simple_order_cycle, coordinator: create(:enterprise)) }
    let!(:coordinated_schedule) { create(:schedule, order_cycles: [coordinated_order_cycle, uncoordinated_order_cycle, uncoordinated_order_cycle3] ) }
    let!(:uncoordinated_schedule) { create(:schedule, order_cycles: [uncoordinated_order_cycle] ) }

    context "json" do
      context "where I manage at least one of the schedule's coordinators" do
        render_views

        before do
          controller.stub spree_current_user: user
        end

        it "allows me to update basic information" 


        it "allows me to add/remove only order cycles I coordinate to/from the schedule" 


        it "syncs proxy orders when order_cycle_ids change" 

      end

      context "where I don't manage any of the schedule's coordinators" do
        before do
          controller.stub spree_current_user: uncoordinated_order_cycle2.coordinator.owner
        end

        it "prevents me from updating the schedule" 

      end
    end
  end

  describe "create" do
    let(:user) { create(:user) }
    let!(:managed_coordinator) { create(:enterprise, owner: user) }
    let!(:coordinated_order_cycle) { create(:simple_order_cycle, coordinator: managed_coordinator ) }
    let!(:uncoordinated_order_cycle) { create(:simple_order_cycle, coordinator: create(:enterprise)) }

    def create_schedule(params)
      spree_put :create, params
    end

    context "json" do
      let(:params) { { format: :json, schedule: { name: 'new schedule' } } }

      context 'as an enterprise user' do
        before { allow(controller).to receive(:spree_current_user) { user } }

        context "where no order cycles ids are provided" do
          it "does not allow me to create the schedule" 

        end

        context "where I manage at least one of the order cycles to be added to the schedules" do
          before do
            params[:schedule].merge!( order_cycle_ids: [coordinated_order_cycle.id, uncoordinated_order_cycle.id] )
          end

          it "allows me to create the schedule, adding only order cycles that I manage" 


          it "sync proxy orders" 

        end

        context "where I don't manage any of the order cycles to be added to the schedules" do
          before do
            params[:schedule].merge!( order_cycle_ids: [uncoordinated_order_cycle.id] )
          end

          it "prevents me from creating the schedule" 

        end
      end

      context 'as an admin user' do
        before do
          allow(controller).to receive(:spree_current_user) { create(:admin_user) }
          params[:schedule].merge!( order_cycle_ids: [coordinated_order_cycle.id, uncoordinated_order_cycle.id] )
        end

        it "allows me to create a schedule" 

      end
    end
  end

  describe "destroy" do
    let(:user) { create(:user, enterprise_limit: 10) }
    let(:managed_coordinator) { create(:enterprise, owner: user) }
    let(:coordinated_order_cycle) { create(:simple_order_cycle, coordinator: managed_coordinator ) }
    let(:uncoordinated_order_cycle) { create(:simple_order_cycle, coordinator: create(:enterprise) ) }
    let(:coordinated_schedule) { create(:schedule, order_cycles: [coordinated_order_cycle, uncoordinated_order_cycle] ) }
    let(:uncoordinated_schedule) { create(:schedule, order_cycles: [uncoordinated_order_cycle] ) }
    let(:params) { { format: :json } }

    context "json" do
      context 'as an enterprise user' do
        before { allow(controller).to receive(:spree_current_user) { user } }

        context "where I manage at least one of the schedule's coordinators" do
          before { params.merge!(id: coordinated_schedule.id) }

          context "when no dependent subscriptions are present" do
            it "allows me to destroy the schedule" 

          end

          context "when a dependent subscription is present" do
            let!(:subscription) { create(:subscription, schedule: coordinated_schedule) }

            it "returns an error message and prevents me from deleting the schedule" 

          end
        end

        context "where I don't manage any of the schedule's coordinators" do
          before { params.merge!(id: uncoordinated_schedule.id) }

          it "prevents me from destroying the schedule" 

        end
      end
    end
  end
end

