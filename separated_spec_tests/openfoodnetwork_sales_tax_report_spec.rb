require 'open_food_network/sales_tax_report'

module OpenFoodNetwork
  describe SalesTaxReport do
    let(:user) { create(:user) }
    let(:report) { SalesTaxReport.new(user, {}) }

    describe "calculating totals for line items" do
      let(:li1) { double(:line_item, quantity: 1, amount: 12) }
      let(:li2) { double(:line_item, quantity: 2, amount: 24) }
      let(:totals) { report.send(:totals_of, [li1, li2]) }

      before do
        report.stub(:tax_included_in).and_return(2, 4)
      end

      it "calculates total quantity" 


      it "calculates total price" 


      context "when floating point math would result in fractional cents" do
        let(:li1) { double(:line_item, quantity: 1, amount: 0.11) }
        let(:li2) { double(:line_item, quantity: 2, amount: 0.12) }

        it "rounds to the nearest cent" 

      end

      it "calculates the taxable total price" 


      it "calculates sales tax" 


      context "when there is no tax on a line item" do
        before do
          report.stub(:tax_included_in) { 0 }
        end

        it "does not appear in taxable total" 


        it "still appears on items total" 


        it "does not register sales tax" 

      end
    end
  end
end

