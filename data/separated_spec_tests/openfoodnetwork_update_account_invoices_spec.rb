require 'spec_helper'

def travel_to(time)
  around { |example| Timecop.travel(start_of_july + time) { example.run } }
end

describe UpdateAccountInvoices do
  let(:year) { Time.zone.now.year }

  before do
    # Make sure that bills are > 0
    Spree::Config.set(:account_invoices_monthly_fixed, 5)
    Spree::Config.set(:account_invoices_monthly_rate, 0.02)
    Spree::Config.set(:account_invoices_monthly_cap, 50)
    Spree::Config.set(:minimum_billable_turnover, 0)
  end

  describe "units specs" do
    let!(:start_of_july) { Time.zone.local(year, 7) }

    let!(:updater) { UpdateAccountInvoices.new }

    let!(:user) { create(:user) }
    let!(:june_billable_period1) { create(:billable_period, owner: user, begins_at: start_of_july - 1.month, ends_at: start_of_july - 20.days) }
    let!(:june_billable_period2) { create(:billable_period, owner: user, begins_at: start_of_july - 20.days, ends_at: start_of_july - 10.days, turnover: 45, sells: "none" ) }
    let!(:june_billable_period3) { create(:billable_period, owner: user, begins_at: start_of_july - 10.days, ends_at: start_of_july - 1.days, turnover: 0, sells: "any" ) }
    let!(:july_billable_period1) { create(:billable_period, owner: user, begins_at: start_of_july, ends_at: start_of_july + 12.days) }
    let!(:july_billable_period2) { create(:billable_period, owner: user, begins_at: start_of_july + 12.days, ends_at: start_of_july + 20.days) }
    let!(:july_billable_period3) { create(:billable_period, owner: user, begins_at: start_of_july + 20.days, ends_at: start_of_july + 25.days, turnover: 45, sells: 'none') }
    let!(:july_billable_period4) { create(:billable_period, owner: user, begins_at: start_of_july + 25.days, ends_at: start_of_july + 28.days, turnover: 0, sells: 'any') }
    let(:june_account_invoice) { june_billable_period1.account_invoice }
    let(:july_account_invoice) { july_billable_period1.account_invoice }

    describe "perform" do
      let(:accounts_distributor) { double(:accounts_distributor) }
      before do
        allow(Enterprise).to receive(:find_by_id) { accounts_distributor }
        allow(updater).to receive(:update)
        allow(Bugsnag).to receive(:notify)
      end

      context "when necessary global config setting have not been set" do
        travel_to(20.days)

        context "when accounts_distributor has been set" do
          before do
            allow(Enterprise).to receive(:find_by_id) { false }
            updater.perform
          end

          it "snags errors and doesn't run" 

        end
      end

      context "when necessary global config setting have been set" do
        context "on the first of the month" do
          travel_to(3.hours)

          it "updates invoices from the previous month" 

        end

        context "on other days" do
          travel_to(20.days)

          it "updates invoices from the current month" 

        end

        context "when specfic a specific month (and year) are passed as arguments" do
          let!(:updater) { UpdateAccountInvoices.new(year, 7) }

          before do
            allow(updater).to receive(:update)
          end

          context "that just ended (in the past)" do
            travel_to(1.month)

            it "updates invoices from the previous month" 

          end

          context "that starts in the past and ends in the future (ie. current_month)" do
            travel_to 30.days

            it "updates invoices from that current month" 

          end

          context "that starts in the future" do
            travel_to(-1.days)

            it "snags an error and does not update invoices" 

          end
        end
      end
    end

    describe "update" do
      before do
        allow(june_account_invoice).to receive(:save).and_call_original
        allow(july_account_invoice).to receive(:save).and_call_original
        allow(updater).to receive(:clean_up)
        allow(updater).to receive(:finalize)
        allow(Bugsnag).to receive(:notify)
      end

      context "where an order for the invoice already exists" do
        let!(:invoice_order) { create(:order, user: user) }

        before do
          expect(Spree::Order).to_not receive(:new)
          allow(june_account_invoice).to receive(:order) { invoice_order }
        end

        context "where the order is already complete" do
          before do
            allow(invoice_order).to receive(:complete?) { true }
            updater.update(june_account_invoice)
          end

          it "snags a bug" 


          it "does not save the order" 


          it "does not clean up the order" 

        end

        context "where the order is not complete" do
          before do
            allow(invoice_order).to receive(:complete?) { false }
            june_billable_period1.enterprise.update_attributes(contact_name: "Firstname Lastname Something Else", phone: '12345')
            updater.update(june_account_invoice)
          end

          it "creates adjustments for each billing item where bill is not 0" 


          it "assigns a addresses to the order" 


          it "saves the order" 


          it "cleans up the order" 

        end
      end

      context "where an order for the invoice does not already exist" do
        let!(:accounts_distributor) { create(:distributor_enterprise) }
        before do
          Spree::Config.set({ accounts_distributor_id: accounts_distributor.id })
          updater.update(july_account_invoice)
        end

        it "creates adjustments for each billing item where bill is not 0" 


        it "saves the order" 


        it "cleans up order" 

      end
    end

    describe "clean_up" do
      let!(:invoice_order) { create(:order) }
      let!(:obsolete1) { create(:adjustment, adjustable: invoice_order) }
      let!(:obsolete2) { create(:adjustment, adjustable: invoice_order) }
      let!(:current1) { create(:adjustment, adjustable: invoice_order) }
      let!(:current2) { create(:adjustment, adjustable: invoice_order) }

      before do
        allow(invoice_order).to receive(:save)
        allow(invoice_order).to receive(:destroy)
        allow(Bugsnag).to receive(:notify)
      end

      context "when current adjustments are present" do
        let!(:current_adjustments) { [current1, current2] }

        context "and obsolete adjustments are present" do
          let!(:obsolete_adjustments) { [obsolete1, obsolete2] }

          before do
            allow(obsolete_adjustments).to receive(:destroy_all)
            allow(invoice_order).to receive(:adjustments) { double(:adjustments, where: obsolete_adjustments) }
            updater.clean_up(invoice_order, current_adjustments)
          end

          it "destroys obsolete adjustments and snags a bug" 

        end

        context "and obsolete adjustments are not present" do
          let!(:obsolete_adjustments) { [] }

          before do
            allow(invoice_order).to receive(:adjustments) { double(:adjustments, where: obsolete_adjustments) }
            updater.clean_up(invoice_order, current_adjustments)
          end

          it "has no bugs to snag" 

        end
      end

      context "when current adjustments are not present" do
        let!(:current_adjustments) { [] }

        context "and obsolete adjustments are present" do
          let!(:obsolete_adjustments) { [obsolete1, obsolete2] }

          before do
            allow(obsolete_adjustments).to receive(:destroy_all)
            allow(invoice_order).to receive(:adjustments) { double(:adjustments, where: obsolete_adjustments) }
          end

          it "destroys obsolete adjustments and snags a bug" 


          context "when the order is not persisted" do
            before do
              allow(invoice_order).to receive(:persisted?) { false }
            end

            it "destroys the order" 

          end

          context "when the order is persisted" do
            before do
              allow(invoice_order).to receive(:persisted?) { true }
            end

            it "snags a bug" 

          end
        end

        context "and obsolete adjustments are not present" do
          let!(:obsolete_adjustments) { [] }

          before do
            allow(invoice_order).to receive(:adjustments) { double(:adjustments, where: obsolete_adjustments) }
          end

          it "has no bugs to snag" 


          context "when the order is not persisted" do
            before do
              allow(invoice_order).to receive(:persisted?) { false }
            end

            it "destroys the order" 

          end

          context "when the order is persisted" do
            before do
              allow(invoice_order).to receive(:persisted?) { true }
            end

            it "snags a bug" 

          end
        end
      end
    end
  end

  describe "validation spec" do
    let!(:start_of_july) { Time.zone.local(year, 7) }

    let!(:updater) { UpdateAccountInvoices.new }

    let!(:accounts_distributor) { create(:distributor_enterprise) }

    let!(:user) { create(:user) }
    let!(:july_billable_period1) { create(:billable_period, sells: 'any', owner: user, begins_at: start_of_july - 1.month, ends_at: start_of_july) }
    let!(:july_billable_period2) { create(:billable_period, owner: user, begins_at: start_of_july, ends_at: start_of_july + 10.days) }
    let!(:july_billable_period3) { create(:billable_period, owner: user, begins_at: start_of_july + 12.days, ends_at: start_of_july + 20.days) }
    let!(:july_account_invoice) { july_billable_period2.account_invoice }
    let!(:august_account_invoice) { create(:account_invoice, user: user, year: july_account_invoice.year, month: 8)}

    before do
      Spree::Config.set({ accounts_distributor_id: accounts_distributor.id })
      july_billable_period2.enterprise.update_attributes(contact_name: 'Anna Karenina', phone: '3433523')
    end

    context "when no invoice_order currently exists" do
      context "when relevant billable periods exist" do
        travel_to(20.days)

        it "creates an invoice_order" 

      end

      context "when no relevant billable periods exist" do
        travel_to(1.month + 5.days)

        it "does not create an order" 

      end
    end

    context "when an order already exists" do
      context "when relevant billable periods exist" do
        let!(:invoice_order) { create(:order, user: user, distributor: accounts_distributor, created_at: start_of_july) }
        let!(:billable_adjustment) { create(:adjustment, adjustable: invoice_order, source_type: 'BillablePeriod') }

        before do
          invoice_order.line_items.clear
          july_account_invoice.update_attribute(:order, invoice_order)
        end

        travel_to(20.days)

        it "updates the order, and clears any obsolete invoices" 

      end

      context "when no relevant billable periods exist" do
        let!(:invoice_order) { create(:order, user: user, distributor: accounts_distributor) }

        before do
          invoice_order.line_items.clear
          august_account_invoice.update_attribute(:order, invoice_order)
        end

        travel_to(1.month + 5.days)

        it "snags a bug" 

      end
    end
  end
end

