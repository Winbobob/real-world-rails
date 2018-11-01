require 'spec_helper'
require 'open_food_network/order_cycle_permissions'

module Admin
  describe EnterprisesController, type: :controller do
    include AuthenticationWorkflow

    let(:user) { create(:user) }
    let(:admin_user) { create(:admin_user) }
    let(:distributor_manager) { create(:user, enterprise_limit: 10, enterprises: [distributor]) }
    let(:supplier_manager) { create(:user, enterprise_limit: 10, enterprises: [supplier]) }
    let(:distributor_owner) { create(:user, enterprise_limit: 10) }
    let(:supplier_owner) { create(:user) }

    let(:distributor) { create(:distributor_enterprise, owner: distributor_owner ) }
    let(:supplier) { create(:supplier_enterprise, owner: supplier_owner) }

    before { @request.env['HTTP_REFERER'] = 'http://test.com/' }

    describe "creating an enterprise" do
      let(:country) { Spree::Country.find_by_name 'Australia' }
      let(:state) { Spree::State.find_by_name 'Victoria' }
      let(:enterprise_params) { {enterprise: {name: 'zzz', permalink: 'zzz', is_primary_producer: '0', address_attributes: {address1: 'a', city: 'a', zipcode: 'a', country_id: country.id, state_id: state.id}}} }

      it "grants management permission if the current user is an enterprise user" 


      it "overrides the owner_id submitted by the user (when not super admin)" 


      context "when I already own a hub" do
        before { distributor }

        it "creates new non-producers as hubs" 


        it "creates new producers as sells none" 


        it "doesn't affect the hub status for super admins" 

      end

      context "when I do not have a hub" do
        it "does not create the new enterprise as a hub" 


        it "doesn't affect the hub status for super admins" 

      end
    end

    describe "updating an enterprise" do
      let(:profile_enterprise) { create(:enterprise, sells: 'none') }

      context "as manager" do
        it "does not allow 'sells' to be changed" 


        it "does not allow owner to be changed" 


        it "does not allow managers to be changed" 


        describe "enterprise properties" do
          let(:producer) { create(:enterprise) }
          let!(:property) { create(:property, name: "A nice name") }

          before do
            login_as_enterprise_user [producer]
          end

          context "when a submitted property does not already exist" do
            it "does not create a new property, or product property" 

          end

          context "when a submitted property exists" do
            it "adds a product property" 

          end
        end

        describe "tag rules" do
          let(:enterprise) { create(:distributor_enterprise) }
          let!(:tag_rule) { create(:tag_rule, enterprise: enterprise) }

          before do
            login_as_enterprise_user [enterprise]
          end

          context "discount order rules" do
            it "updates the existing rule with new attributes" 


            it "creates new rules with new attributes" 

          end
        end
      end

      context "as owner" do
        it "allows 'sells' to be changed" 


        it "allows owner to be changed" 


        it "allows managers to be changed" 

      end

      context "as super admin" do
        it "allows 'sells' to be changed" 



        it "allows owner to be changed" 


        it "allows managers to be changed" 

      end
    end

    describe "register" do
      let(:enterprise) { create(:enterprise, sells: 'none') }

      context "as a normal user" do
        before do
          controller.stub spree_current_user: distributor_manager
        end

        it "does not allow access" 

      end

      context "as a manager" do
        before do
          controller.stub spree_current_user: distributor_manager
          enterprise.enterprise_roles.build(user: distributor_manager).save
        end

        it "does not allow access" 

      end

      context "as an owner" do
        before do
          controller.stub spree_current_user: enterprise.owner
        end

        context "setting 'sells' to 'none'" do
          it "is allowed" 

        end

        context "setting producer_profile_only" do
          it "is ignored" 

        end

        context "setting 'sells' to 'own'" do
          before do
            enterprise.sells = 'none'
            enterprise.save!
          end

          context "if the trial has finished" do
            let(:trial_start) { 30.days.ago.beginning_of_day }

            before do
              enterprise.update_attribute(:shop_trial_start_date, trial_start)
            end

            it "is allowed" 

          end

          context "if the trial has not finished" do
            let(:trial_start) { Date.current.to_time }

            before do
              enterprise.update_attribute(:shop_trial_start_date, trial_start)
            end

            it "is allowed, but trial start date is not reset" 

          end

          context "if a trial has not started" do
            it "is allowed" 

          end
        end

        context "setting 'sells' to any" do
          context "if the trial has finished" do
            let(:trial_start) { 30.days.ago.beginning_of_day }

            before do
              enterprise.update_attribute(:shop_trial_start_date, trial_start)
            end

            it "is allowed" 

          end

          context "if the trial has not finished" do
            let(:trial_start) { Date.current.to_time }

            before do
              enterprise.update_attribute(:shop_trial_start_date, trial_start)
            end

            it "is allowed, but trial start date is not reset" 

          end

          context "if a trial has not started" do
            it "is allowed" 

          end
        end

        context "settiing 'sells' to 'unspecified'" do
          it "is not allowed" 

        end
      end
    end

    describe "bulk updating enterprises" do
      let!(:original_owner) do
        user = create_enterprise_user
        user.enterprise_limit = 2
        user.save!
        user
      end
      let!(:new_owner) do
        user = create_enterprise_user
        user.enterprise_limit = 2
        user.save!
        user
      end
      let!(:profile_enterprise1) { create(:enterprise, sells: 'none', owner: original_owner ) }
      let!(:profile_enterprise2) { create(:enterprise, sells: 'none', owner: original_owner ) }

      context "as manager" do
        it "does not allow 'sells' or 'owner' to be changed" 


        it "cuts down the list of enterprises displayed when error received on bulk update" 

      end

      context "as the owner of an enterprise" do
        it "allows 'sells' and 'owner' to be changed" 

      end

      context "as super admin" do
        it "allows 'sells' and 'owner' to be changed" 

      end
    end

    describe "for_order_cycle" do
      let!(:user) { create_enterprise_user }
      let!(:enterprise) { create(:enterprise, sells: 'any', owner: user) }
      let(:permission_mock) { double(:permission) }

      before do
        # As a user with permission
        controller.stub spree_current_user: user
        OrderCycle.stub find_by_id: "existing OrderCycle"
        Enterprise.stub find_by_id: "existing Enterprise"
        OrderCycle.stub new: "new OrderCycle"

        allow(OpenFoodNetwork::OrderCyclePermissions).to receive(:new) { permission_mock }
        allow(permission_mock).to receive(:visible_enterprises) { [] }
        allow(ActiveModel::ArraySerializer).to receive(:new) { "" }
      end

      context "when no order_cycle or coordinator is provided in params" do
        before { spree_get :for_order_cycle, format: :json }
        it "initializes permissions with nil" 

      end

      context "when an order_cycle_id is provided in params" do
        before { spree_get :for_order_cycle, format: :json, order_cycle_id: 1 }
        it "initializes permissions with the existing OrderCycle" 

      end

      context "when a coordinator is provided in params" do
        before { spree_get :for_order_cycle, format: :json, coordinator_id: 1 }
        it "initializes permissions with a new OrderCycle" 

      end

      context "when both an order cycle and a coordinator are provided in params" do
        before { spree_get :for_order_cycle, format: :json, order_cycle_id: 1, coordinator_id: 1 }
        it "initializes permissions with the existing OrderCycle" 

      end
    end

    describe "visible" do
      let!(:user) { create(:user, enterprise_limit: 10) }
      let!(:visible_enterprise) { create(:enterprise, sells: 'any', owner: user) }
      let!(:not_visible_enterprise) { create(:enterprise, sells: 'any') }

      before do
        # As a user with permission
        controller.stub spree_current_user: user

        # :create_variant_overrides does not affect visiblity (at time of writing)
        create(:enterprise_relationship, parent: not_visible_enterprise, child: visible_enterprise, permissions_list: [:create_variant_overrides])
      end

      it "uses permissions to determine which enterprises are visible and should be rendered" 

    end

    describe "index" do
      context "as super admin" do
        let(:super_admin) { create(:admin_user) }
        let!(:user) { create_enterprise_user(enterprise_limit: 10) }
        let!(:enterprise1) { create(:enterprise, sells: 'any', owner: user) }
        let!(:enterprise2) { create(:enterprise, sells: 'own', owner: user) }
        let!(:enterprise3) { create(:enterprise, sells: 'any', owner: create_enterprise_user ) }

        before do
          controller.stub spree_current_user: super_admin
        end

        context "html" do
          it "returns all enterprises" 

        end

        context "json" do
          it "returns all enterprises" 

        end
      end

      context "as an enterprise user" do
        let!(:user) { create_enterprise_user(enterprise_limit: 10) }
        let!(:enterprise1) { create(:enterprise, sells: 'any', owner: user) }
        let!(:enterprise2) { create(:enterprise, sells: 'own', owner: user) }
        let!(:enterprise3) { create(:enterprise, sells: 'any', owner: create_enterprise_user ) }

        before do
          controller.stub spree_current_user: user
        end

        context "html" do
          it "returns an empty @collection" 

        end

        context "json" do
          it "scopes @collection to enterprises editable by the user" 

        end
      end
    end
  end
end

