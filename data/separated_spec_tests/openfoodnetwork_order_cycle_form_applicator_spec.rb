require 'open_food_network/order_cycle_form_applicator'

module OpenFoodNetwork
  describe OrderCycleFormApplicator do
    include AuthenticationWorkflow

    let!(:user) { create_enterprise_user }

    context "unit specs" do
      it "creates new exchanges for incoming_exchanges" 


      it "creates new exchanges for outgoing_exchanges" 


      it "updates existing exchanges for incoming_exchanges" 


      it "updates existing exchanges for outgoing_exchanges" 


      describe "removing exchanges that are no longer present" do
        it "destroys untouched exchanges" 


        it "compares exchanges by id only" 


        context "as a manager of the coordinator" do
          let(:applicator) { OrderCycleFormApplicator.new(nil, user) }
          before { applicator.stub(:manages_coordinator?) { true } }

          it "destroys exchanges" 

        end

        context "as a non-manager of the coordinator" do
          let(:applicator) { OrderCycleFormApplicator.new(nil, user) }
          before { applicator.stub(:manages_coordinator?) { false } }

          it "does not destroy any exchanges" 

        end
      end

      describe "updating the list of variants for a given outgoing exchange" do
        let!(:v1) { create(:variant) } # Not Existing + Request Add + Editable + Incoming
        let!(:v2) { create(:variant) } # Not Existing + Request Add + Not Editable + Incoming
        let!(:v3) { create(:variant) } # Existing + Request Add + Editable + Incoming
        let!(:v4) { create(:variant) } # Existing + Not mentioned + Editable + Incoming
        let!(:v5) { create(:variant) } # Existing + Request Remove + Editable + Incoming
        let!(:v6) { create(:variant) } # Existing + Request Remove + Not Editable + Incoming
        let!(:v7) { create(:variant) } # Existing + Request Add + Not Editable + Not Incoming
        let!(:v8) { create(:variant) } # Existing + Request Add + Editable + Not Incoming
        let!(:v9) { create(:variant) } # Not Existing + Request Add + Editable + Not Incoming
        let!(:exchange) { create(:exchange, incoming: false, variant_ids: [v3.id, v4.id, v5.id, v6.id, v7.id, v8.id]) }
        let!(:oc) { exchange.order_cycle }
        let!(:enterprise) { exchange.receiver }
        let!(:coordinator) { oc.coordinator }
        let!(:applicator) { OrderCycleFormApplicator.new(oc, user) }
        let(:ids) do
          applicator.send(:outgoing_exchange_variant_ids, {
            :enterprise_id => enterprise.id,
            :variants => {
              "#{v1.id}" => true,
              "#{v2.id}" => true,
              "#{v3.id}" => true,
              "#{v5.id}" => false,
              "#{v6.id}" => false,
              "#{v7.id}" => true,
              "#{v8.id}" => true,
              "#{v9.id}" => true
            }
          })
        end


        before do
          allow(applicator).to receive(:incoming_variant_ids) { [v1.id, v2.id, v3.id, v4.id, v5.id, v6.id] }
          allow(applicator).to receive(:editable_variant_ids_for_outgoing_exchange_between) { [v1.id, v3.id, v4.id, v5.id, v8.id, v9.id]}
        end

        it "updates the list of variants for the exchange" 

      end

      describe "updating the list of variants for a given incoming exchange" do
        let!(:v1) { create(:variant) } # Not Existing + Request Add + Editable
        let!(:v2) { create(:variant) } # Not Existing + Request Add + Not Editable
        let!(:v3) { create(:variant) } # Existing + Request Add + Editable
        let!(:v4) { create(:variant) } # Existing + Request Remove + Not Editable
        let!(:v5) { create(:variant) } # Existing + Request Remove + Editable
        let!(:v6) { create(:variant) } # Existing + Request Remove + Not Editable
        let!(:v7) { create(:variant) } # Existing + Not mentioned + Editable
        let!(:exchange) { create(:exchange, incoming: true, variant_ids: [v3.id, v4.id, v5.id, v6.id, v7.id]) }
        let!(:oc) { exchange.order_cycle }
        let!(:enterprise) { exchange.sender }
        let!(:coordinator) { oc.coordinator }
        let!(:applicator) { OrderCycleFormApplicator.new(oc, user) }
        let(:ids) do
          applicator.send(:incoming_exchange_variant_ids, {
            :enterprise_id => enterprise.id,
            :variants => {
              "#{v1.id}" => true,
              "#{v2.id}" => true,
              "#{v3.id}" => true,
              "#{v4.id}" => false,
              "#{v5.id}" => false,
              "#{v6.id}" => false
            }
          })
        end

        before do
          allow(applicator).to receive(:editable_variant_ids_for_incoming_exchange_between) { [v1.id, v3.id, v5.id, v7.id]}
        end

        it "updates the list of variants for the exchange" 

      end

      describe "filtering exchanges for permission" do
        describe "checking permission on a single exchange" do
          it "returns true when it has permission" 


          it "returns false otherwise" 

        end
      end
    end

    context "integration specs" do
      before(:all) do
        require 'spec_helper'
      end

      it "checks whether exchanges exist" 


      describe "adding exchanges" do
        let!(:sender) { create(:enterprise) }
        let!(:receiver) { create(:enterprise) }
        let!(:oc) { create(:simple_order_cycle) }
        let!(:applicator) { OrderCycleFormApplicator.new(oc, user) }
        let!(:incoming) { true }
        let!(:variant1) { create(:variant) }
        let!(:variant2) { create(:variant) }
        let!(:enterprise_fee1) { create(:enterprise_fee) }
        let!(:enterprise_fee2) { create(:enterprise_fee) }

        context "as a manager of the coorindator" do
          before do
            allow(applicator).to receive(:manages_coordinator?) { true }
            applicator.send(:touched_exchanges=, [])
            applicator.send(:add_exchange, sender.id, receiver.id, incoming, {:variant_ids => [variant1.id, variant2.id], :enterprise_fee_ids => [enterprise_fee1.id, enterprise_fee2.id]})
          end

          it "adds new exchanges" 

        end

        context "as a user which does not manage the coorindator" do
          before do
            allow(applicator).to receive(:manages_coordinator?) { false }
            applicator.send(:add_exchange, sender.id, receiver.id, incoming, {:variant_ids => [variant1.id, variant2.id], :enterprise_fee_ids => [enterprise_fee1.id, enterprise_fee2.id]})
          end

          it "does not add new exchanges" 

        end
      end

      describe "updating exchanges" do
        let!(:sender) { create(:enterprise) }
        let!(:receiver) { create(:enterprise) }
        let!(:oc) { create(:simple_order_cycle) }
        let!(:applicator) { OrderCycleFormApplicator.new(oc, user) }
        let!(:incoming) { true }
        let!(:variant1) { create(:variant) }
        let!(:variant2) { create(:variant) }
        let!(:variant3) { create(:variant) }
        let!(:enterprise_fee1) { create(:enterprise_fee) }
        let!(:enterprise_fee2) { create(:enterprise_fee) }
        let!(:enterprise_fee3) { create(:enterprise_fee) }

        let!(:exchange) { create(:exchange, order_cycle: oc, sender: sender, receiver: receiver, incoming: incoming, variant_ids: [variant1.id, variant2.id], enterprise_fee_ids: [enterprise_fee1.id, enterprise_fee2.id]) }

        context "as a manager of the coorindator" do
          before do
            allow(applicator).to receive(:manages_coordinator?) { true }
            allow(applicator).to receive(:manager_for) { false }
            allow(applicator).to receive(:permission_for) { true }
            applicator.send(:touched_exchanges=, [])
            applicator.send(:update_exchange, sender.id, receiver.id, incoming, {:variant_ids => [variant1.id, variant3.id], :enterprise_fee_ids => [enterprise_fee2.id, enterprise_fee3.id], :pickup_time => 'New Pickup Time', :pickup_instructions => 'New Pickup Instructions', tag_list: 'wholesale'})
          end

          it "updates the variants, enterprise fees tags, and pickup information of the exchange" 

        end

        context "as a manager of the participating enterprise" do
          before do
            allow(applicator).to receive(:manages_coordinator?) { false }
            allow(applicator).to receive(:manager_for) { true }
            allow(applicator).to receive(:permission_for) { true }
            applicator.send(:touched_exchanges=, [])
            applicator.send(:update_exchange, sender.id, receiver.id, incoming, {:variant_ids => [variant1.id, variant3.id], :enterprise_fee_ids => [enterprise_fee2.id, enterprise_fee3.id], :pickup_time => 'New Pickup Time', :pickup_instructions => 'New Pickup Instructions', tag_list: 'wholesale'})
          end

          it "updates the variants, enterprise fees, tags and pickup information of the exchange" 

        end

        context "where the participating enterprise is permitted for the user" do
          before do
            allow(applicator).to receive(:manages_coordinator?) { false }
            allow(applicator).to receive(:manager_for) { false }
            allow(applicator).to receive(:permission_for) { true }
            applicator.send(:touched_exchanges=, [])
            applicator.send(:update_exchange, sender.id, receiver.id, incoming, {:variant_ids => [variant1.id, variant3.id], :enterprise_fee_ids => [enterprise_fee2.id, enterprise_fee3.id], :pickup_time => 'New Pickup Time', :pickup_instructions => 'New Pickup Instructions', tag_list: 'wholesale'})
          end

          it "updates the variants in the exchange, but not the fees, tags or pickup information" 

        end
      end

      it "does not add exchanges it is not permitted to touch" 


      it "does not update exchanges it is not permitted to touch" 

    end
  end
end

