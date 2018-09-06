require 'spec_helper'
require 'open_food_network/permissions'

module OpenFoodNetwork
  describe Permissions do
    let(:user) { double(:user) }
    let(:permissions) { Permissions.new(user) }
    let(:permission) { 'one' }
    let(:e1) { create(:enterprise) }
    let(:e2) { create(:enterprise) }

    describe "finding managed and related enterprises granting a particular permission" do
      describe "as super admin" do
        before { allow(user).to receive(:admin?) { true } }

        it "returns all enterprises" 

      end

      describe "as an enterprise user" do
        let(:e3) { create(:enterprise) }
        before { allow(user).to receive(:admin?) { false } }

        it "returns only my managed enterprises any that have granting them P-OC" 

      end
    end

    describe "finding managed and related enterprises granting or granted a particular permission" do
      describe "as super admin" do
        before { allow(user).to receive(:admin?) { true } }

        it "returns all enterprises" 

      end

      describe "as an enterprise user" do
        let(:e3) { create(:enterprise) }
        let(:e4) { create(:enterprise) }
        before { allow(user).to receive(:admin?) { false } }

        it "returns only my managed enterprises any that have granting them P-OC" 

      end
    end

    describe "finding enterprises that can be selected in order report filters" do
      let(:e) { double(:enterprise) }

      it "returns managed and related enterprises with add_to_order_cycle permission" 

    end

    describe "finding visible enterprises" do
      let(:e) { double(:enterprise) }

      it "returns managed and related enterprises with add_to_order_cycle permission" 

    end

    describe "finding enterprises whose profiles can be edited" do
      let(:e) { double(:enterprise) }

      it "returns managed and related enterprises with edit_profile permission" 

    end

    describe "finding all producers for which we can create variant overrides" do
      let(:e1) { create(:supplier_enterprise) }
      let(:e2) { create(:supplier_enterprise) }

      it "compiles the list from variant_override_enterprises_per_hub" 

    end

    describe "finding enterprises for which variant overrides can be created, for each hub" do
      let!(:hub) { create(:distributor_enterprise) }
      let!(:producer) { create(:supplier_enterprise) }
      let!(:er) { create(:enterprise_relationship, parent: producer, child: hub,
                         permissions_list: [:create_variant_overrides]) 
      }

      before do
        permissions.stub(:managed_enterprises) { Enterprise.where(id: hub.id) }
        permissions.stub(:admin?) { false }
      end

      it "returns enterprises as hub_id => [producer, ...]" 


      it "returns only permissions relating to managed hubs" 


      it "returns only create_variant_overrides permissions" 


      describe "hubs connected to the user by relationships only" do
        let!(:producer_managed) { create(:supplier_enterprise) }
        let!(:er_oc) { create(:enterprise_relationship, parent: hub, child: producer_managed,
                              permissions_list: [:add_to_order_cycle, :create_variant_overrides]) 
        }

        before do
          permissions.stub(:managed_enterprises) { Enterprise.where(id: producer_managed.id) }
        end

        it "does not allow the user to create variant overrides for the hub" 

      end

      it "does not return managed producers (ie. only uses explicitly granted VO permissions)" 


      it "returns itself if self is also a primary producer (even when no explicit permission exists)" 

    end

    describe "finding editable products" do
      let!(:p1) { create(:simple_product, supplier: create(:supplier_enterprise) ) }
      let!(:p2) { create(:simple_product, supplier: create(:supplier_enterprise) ) }

      before do
        permissions.stub(:managed_enterprise_products) { Spree::Product.where('1=0') }
        allow(permissions).to receive(:related_enterprises_granting).with(:manage_products) { Enterprise.where("1=0") }
      end

      it "returns products produced by managed enterprises" 


      it "returns products produced by permitted enterprises" 

    end

    describe "finding visible products" do
      let!(:p1) { create(:simple_product, supplier: create(:supplier_enterprise) ) }
      let!(:p2) { create(:simple_product, supplier: create(:supplier_enterprise) ) }
      let!(:p3) { create(:simple_product, supplier: create(:supplier_enterprise) ) }

      before do
        permissions.stub(:managed_enterprise_products) { Spree::Product.where("1=0") }
        allow(permissions).to receive(:related_enterprises_granting).with(:manage_products) { Enterprise.where("1=0") }
        allow(permissions).to receive(:related_enterprises_granting).with(:add_to_order_cycle) { Enterprise.where("1=0") }
      end

      it "returns products produced by managed enterprises" 


      it "returns products produced by enterprises that have granted manage products" 


      it "returns products produced by enterprises that have granted P-OC" 

    end

    describe "finding enterprises that we manage products for" do
      let(:e) { double(:enterprise) }

      it "returns managed and related enterprises with manage_products permission" 

    end

    ########################################

    describe "finding related enterprises with a particular permission" do
      let!(:er) { create(:enterprise_relationship, parent: e1, child: e2, permissions_list: [permission]) }

      it "returns the enterprises" 


      it "returns an empty array when there are none" 

    end

    describe "finding enterprises that are managed or with a particular permission" do
      before do
        permissions.stub(:managed_enterprises) { Enterprise.where('1=0') }
        permissions.stub(:related_enterprises_granting) { Enterprise.where('1=0') }
        permissions.stub(:admin?) { false }
      end

      it "returns managed enterprises" 


      it "returns permitted enterprises" 

    end

    describe "finding orders that are visible in reports" do
      let(:distributor) { create(:distributor_enterprise) }
      let(:coordinator) { create(:distributor_enterprise) }
      let(:random_enterprise) { create(:distributor_enterprise) }
      let(:order_cycle) { create(:simple_order_cycle, coordinator: coordinator, distributors: [distributor]) }
      let(:order) { create(:order, order_cycle: order_cycle, distributor: distributor ) }
      let!(:line_item) { create(:line_item, order: order) }
      let!(:producer) { create(:supplier_enterprise) }

      before do
        permissions.stub(:coordinated_order_cycles) { Enterprise.where("1=0") }
      end

      context "as the hub through which the order was placed" do
        before do
          permissions.stub(:managed_enterprises) { Enterprise.where(id: distributor) }
        end

        it "should let me see the order" 

      end

      context "as the coordinator of the order cycle through which the order was placed" do
        before do
          permissions.stub(:managed_enterprises) { Enterprise.where(id: coordinator) }
          permissions.stub(:coordinated_order_cycles) { OrderCycle.where(id: order_cycle) }
        end

        it "should let me see the order" 

      end

      context "as a producer which has granted P-OC to the distributor of an order" do
        before do
          permissions.stub(:managed_enterprises) { Enterprise.where(id: producer) }
          create(:enterprise_relationship, parent: producer, child: distributor, permissions_list: [:add_to_order_cycle])
        end

        context "which contains my products" do
          before do
            line_item.product.supplier = producer
            line_item.product.save
          end

          it "should let me see the order" 

        end

        context "which does not contain my products" do
          it "should not let me see the order" 

        end
      end

      context "as an enterprise that is a distributor in the order cycle, but not the distributor of the order" do
        before do
          permissions.stub(:managed_enterprises) { Enterprise.where(id: random_enterprise) }
        end

        it "should not let me see the order" 

      end
    end

    describe "finding line items that are visible in reports" do
      let(:distributor) { create(:distributor_enterprise) }
      let(:coordinator) { create(:distributor_enterprise) }
      let(:random_enterprise) { create(:distributor_enterprise) }
      let(:order_cycle) { create(:simple_order_cycle, coordinator: coordinator, distributors: [distributor]) }
      let(:order) { create(:order, order_cycle: order_cycle, distributor: distributor ) }
      let!(:line_item1) { create(:line_item, order: order) }
      let!(:line_item2) { create(:line_item, order: order) }
      let!(:producer) { create(:supplier_enterprise) }

      before do
        permissions.stub(:coordinated_order_cycles) { Enterprise.where("1=0") }
      end

      context "as the hub through which the parent order was placed" do
        before do
          permissions.stub(:managed_enterprises) { Enterprise.where(id: distributor) }
        end

        it "should let me see the line_items" 

      end

      context "as the coordinator of the order cycle through which the parent order was placed" do
        before do
          permissions.stub(:managed_enterprises) { Enterprise.where(id: coordinator) }
          permissions.stub(:coordinated_order_cycles) { OrderCycle.where(id: order_cycle) }
        end

        it "should let me see the line_items" 

      end

      context "as the manager producer which has granted P-OC to the distributor of the parent order" do
        before do
          permissions.stub(:managed_enterprises) { Enterprise.where(id: producer) }
          create(:enterprise_relationship, parent: producer, child: distributor, permissions_list: [:add_to_order_cycle])

          line_item1.product.supplier = producer
          line_item1.product.save
        end

        it "should let me see the line_items pertaining to variants I produce" 

      end

      context "as an enterprise that is a distributor in the order cycle, but not the distributor of the parent order" do
        before do
          permissions.stub(:managed_enterprises) { Enterprise.where(id: random_enterprise) }
        end

        it "should not let me see the line_items" 

      end
    end

    describe "finding visible subscriptions" do
      let!(:so1) { create(:subscription) }
      let!(:so2) { create(:subscription) }

      it "returns subscriptions placed with managed shops" 

    end
  end
end

