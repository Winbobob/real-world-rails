require 'open_food_network/xero_invoices_report'

module OpenFoodNetwork
  describe XeroInvoicesReport do
    subject { XeroInvoicesReport.new user }

    let(:user) { create(:user) }

    describe "option defaults" do
      let(:report) { XeroInvoicesReport.new user, {initial_invoice_number: '', invoice_date: '', due_date: '', account_code: ''} }

      around { |example| Timecop.travel(Time.zone.local(2015, 5, 5, 14, 0, 0)) { example.run } }

      it "uses defaults when blank params are passed" 

    end

    describe "summary rows" do
      let(:report) { XeroInvoicesReport.new user, {initial_invoice_number: '', invoice_date: '', due_date: '', account_code: ''} }
      let(:order) { double(:order) }
      let(:summary_rows) { report.send(:summary_rows_for_order, order, 1, {}) }

      before do
        report.stub(:produce_summary_rows)  { ['produce'] }
        report.stub(:fee_summary_rows)      { ['fee'] }
        report.stub(:shipping_summary_rows) { ['shipping'] }
        report.stub(:payment_summary_rows)  { ['payment'] }
        report.stub(:admin_adjustment_summary_rows) { ['admin'] }
        order.stub(:account_invoice?)       { false }
      end

      it "displays produce summary rows when summary report" 


      it "does not display produce summary rows when detail report" 


      it "displays fee summary rows when summary report" 


      it "displays fee summary rows when this is not an account invoice" 


      it "does not display fee summary rows when this is a detail report for an account invoice" 


      it "always displays shipping summary rows" 


      it "displays admin adjustment summary rows when summary report" 


      it "does not display admin adjustment summary rows when detail report" 

    end

    describe "finding account invoice adjustments" do
      let(:report) { XeroInvoicesReport.new user, {initial_invoice_number: '', invoice_date: '', due_date: '', account_code: ''} }
      let!(:order) { create(:order) }
      let(:billable_period) { create(:billable_period) }
      let(:shipping_method) { create(:shipping_method) }
      let!(:adj_invoice)  { create(:adjustment, adjustable: order, label: 'Account invoice item', source: billable_period) }
      let!(:adj_shipping) { create(:adjustment, adjustable: order, label: "Shipping", originator: shipping_method) }

      it "returns BillablePeriod adjustments only" 


      it "excludes adjustments where the source is missing" 

    end

    describe "generating invoice numbers" do
      let(:order) { double(:order, number: 'R731032860') }

      describe "when no initial invoice number is given" do
        it "returns the order number" 

      end

      describe "when an initial invoice number is given" do
        subject { XeroInvoicesReport.new user, {initial_invoice_number: '123'} }

        it "increments the number by the index" 

      end
    end
  end
end

