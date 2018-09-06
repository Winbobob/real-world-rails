require 'spec_helper'

describe Admin::InventoryItemsController, type: :controller do
  # include AuthenticationWorkflow

  describe "create" do
    context "json" do
      let(:format) { :json }

      let(:enterprise) { create(:distributor_enterprise) }
      let(:variant) { create(:variant) }
      let(:inventory_item) { create(:inventory_item, enterprise: enterprise, variant: variant, visible: true) }
      let(:params) { { format: format, inventory_item: { enterprise_id: enterprise.id, variant_id: variant.id, visible: false } } }

      context "where I don't manage the inventory item enterprise" do
        before do
          user = create(:user)
          user.owned_enterprises << create(:enterprise)
          allow(controller).to receive(:spree_current_user) { user }
        end

        it "redirects to unauthorized" 

      end

      context "where I manage the variant override hub" do
        before do
          allow(controller).to receive(:spree_current_user) { enterprise.owner }
        end

        context "but the producer has not granted VO permission" do
          it "redirects to unauthorized" 

        end

        context "and the producer has granted VO permission" do
          before do
            create(:enterprise_relationship, parent: variant.product.supplier, child: enterprise, permissions_list: [:create_variant_overrides])
          end

          context "with acceptable data" do
            it "allows me to create the inventory item" 

          end

          context "with unacceptable data" do
            render_views
            let!(:bad_params) { { format: format, inventory_item: { enterprise_id: enterprise.id, variant_id: variant.id, visible: nil } } }

            it "returns an error message" 

          end
        end
      end
    end
  end

  describe "update" do
    context "json" do
      let(:format) { :json }

      let(:enterprise) { create(:distributor_enterprise) }
      let(:variant) { create(:variant) }
      let(:inventory_item) { create(:inventory_item, enterprise: enterprise, variant: variant, visible: true) }
      let(:params) { { format: format, id: inventory_item.id, inventory_item: { visible: false } } }

      context "where I don't manage the inventory item enterprise" do
        before do
          user = create(:user)
          user.owned_enterprises << create(:enterprise)
          allow(controller).to receive(:spree_current_user) { user }
        end

        it "redirects to unauthorized" 

      end

      context "where I manage the variant override hub" do
        before do
          allow(controller).to receive(:spree_current_user) { enterprise.owner }
        end

        context "but the producer has not granted VO permission" do
          it "redirects to unauthorized" 

        end

        context "and the producer has granted VO permission" do
          before do
            create(:enterprise_relationship, parent: variant.product.supplier, child: enterprise, permissions_list: [:create_variant_overrides])
          end

          context "with acceptable data" do
            it "allows me to update the inventory item" 

          end

          context "with unacceptable data" do
            render_views
            let!(:bad_params) { { format: format, id: inventory_item.id, inventory_item: { visible: nil } } }

            it "returns an error message" 

          end
        end
      end
    end
  end
end

