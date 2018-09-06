require 'open_food_network/subscription_payment_updater'

module OpenFoodNetwork
  describe SubscriptionPaymentUpdater do
    let(:order) { create(:order) }
    let(:updater) { OpenFoodNetwork::SubscriptionPaymentUpdater.new(order) }

    describe "#payment" do
      context "when only one payment exists on the order" do
        let!(:payment) { create(:payment, order: order) }

        context "where the payment is in the 'checkout' state" do
          it { expect(updater.send(:payment)).to eq payment }
        end

        context "where the payment is in some other state" do
          before { payment.update_attribute(:state, 'pending') }
          it { expect(updater.send(:payment)).to be nil }
        end
      end

      context "when more that one payment exists on the order" do
        let!(:payment1) { create(:payment, order: order) }
        let!(:payment2) { create(:payment, order: order) }

        context "where more than one payment is in the 'checkout' state" do
          it { expect([payment1, payment2]).to include updater.send(:payment) }
        end

        context "where only one payment is in the 'checkout' state" do
          before { payment1.update_attribute(:state, 'pending') }
          it { expect(updater.send(:payment)).to eq payment2 }
        end

        context "where no payments are in the 'checkout' state" do
          before do
            payment1.update_attribute(:state, 'pending')
            payment2.update_attribute(:state, 'pending')
          end

          it { expect(updater.send(:payment)).to be nil }
        end
      end
    end

    describe "#update!" do
      let!(:payment){ create(:payment, amount: 10) }

      context "when no pending payments are present" do
        let(:payment_method) { create(:payment_method) }
        let(:subscription) { double(:subscription, payment_method_id: payment_method.id) }

        before do
          allow(order).to receive(:pending_payments).once { [] }
          allow(order).to receive(:outstanding_balance) { 5 }
          allow(order).to receive(:subscription) { subscription }
        end

        it "creates a new payment on the order" 

      end

      context "when a payment is present" do
        before { allow(order).to receive(:pending_payments).once { [payment] } }

        context "when a credit card is not required" do
          before do
            allow(updater).to receive(:card_required?) { false }
            expect(updater).to_not receive(:card_available?)
            expect(updater).to_not receive(:ensure_credit_card)
          end

          context "when the payment total doesn't match the outstanding balance on the order" do
            before { allow(order).to receive(:outstanding_balance) { 5 } }
            it "updates the payment total to reflect the outstanding balance" 

          end

          context "when the payment total matches the outstanding balance on the order" do
            before { allow(order).to receive(:outstanding_balance) { 10 } }

            it "does nothing" 

          end
        end

        context "when a credit card is required" do
          before do
            expect(updater).to receive(:card_required?) { true }
          end

          context "and the payment source is not a credit card" do
            before { expect(updater).to receive(:card_set?) { false } }

            context "and no credit card is available on the subscription" do
              before { expect(updater).to receive(:ensure_credit_card) { false } }

              it "adds an error to the order and does not update the payment" 

            end

            context "but a credit card is available on the subscription" do
              before { expect(updater).to receive(:ensure_credit_card) { true } }

              context "when the payment total doesn't match the outstanding balance on the order" do
                before { allow(order).to receive(:outstanding_balance) { 5 } }
                it "updates the payment total to reflect the outstanding balance" 

              end

              context "when the payment total matches the outstanding balance on the order" do
                before { allow(order).to receive(:outstanding_balance) { 10 } }

                it "does nothing" 

              end
            end
          end

          context "and the payment source is already a credit card" do
            before { expect(updater).to receive(:card_set?) { true } }

            context "when the payment total doesn't match the outstanding balance on the order" do
              before { allow(order).to receive(:outstanding_balance) { 5 } }
              it "updates the payment total to reflect the outstanding balance" 

            end

            context "when the payment total matches the outstanding balance on the order" do
              before { allow(order).to receive(:outstanding_balance) { 10 } }

              it "does nothing" 

            end
          end
        end
      end
    end

    describe "#ensure_credit_card" do
      let!(:payment) { create(:payment, source: nil) }
      before { allow(updater).to receive(:payment) { payment } }

      context "when no credit card is specified by the subscription" do
        before { allow(updater).to receive(:saved_credit_card) { nil } }

        it "returns false and down not update the payment source" 

      end

      context "when a credit card is specified by the subscription" do
        let(:credit_card) { create(:credit_card) }
        before { allow(updater).to receive(:saved_credit_card) { credit_card } }

        it "returns true and stores the credit card as the payment source" 

      end
    end
  end
end

