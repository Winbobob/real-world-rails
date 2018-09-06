require 'open_food_network/reports/report'

module OpenFoodNetwork::Reports
  P1 = Proc.new { |o| o[:one] }
  P2 = Proc.new { |o| o[:two] }
  P3 = Proc.new { |o| o[:three] }
  P4 = Proc.new { |o| o[:four] }

  class TestReport < Report
    header 'One', 'Two', 'Three', 'Four'

    columns do
      column(&P1)
      column(&P2)
      column(&P3)
      column(&P4)
    end

    organise do
      group(&P1)
      sort(&P2)

      organise do
        group(&P3)
        sort(&P4)

        summary_row do
          column(&P1)
          column(&P4)
        end
      end
    end
  end

  class HelperReport < Report
    columns do
      column { |o| my_helper(o) }
    end


    private

    def self.my_helper(o)
      o[:one]
    end
  end


  describe Report do
    let(:report) { TestReport.new }
    let(:helper_report) { HelperReport.new }
    let(:rules_head) { TestReport._rules_head }
    let(:data) { {one: 1, two: 2, three: 3, four: 4} }

    it "returns the header" 


    it "returns columns as an array of procs" 


    it "supports helpers when outputting columns" 


    describe "rules" do
      let(:group_by) { rules_head.to_h[:group_by] }
      let(:sort_by) { rules_head.to_h[:sort_by] }
      let(:next_group_by) { rules_head.next.to_h[:group_by] }
      let(:next_sort_by) { rules_head.next.to_h[:sort_by] }
      let(:next_summary_columns) { rules_head.next.to_h[:summary_columns] }

      it "constructs the head of the rules list" 


      it "constructs nested rules" 


      it "constructs summary columns for rules" 

    end

    describe "outputting rules" do
      it "outputs the rules" 

    end
  end
end

