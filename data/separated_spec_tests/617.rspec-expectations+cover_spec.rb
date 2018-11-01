if (1..2).respond_to?(:cover?)
  RSpec.describe "expect(...).to cover(expected)" do
    it_behaves_like "an RSpec matcher", :valid_value => (1..10), :invalid_value => (20..30) do
      let(:matcher) { cover(5) }
    end

    context "for a range target" do
      it "passes if target covers expected" 


      it "fails if target does not cover expected" 

    end
  end

  RSpec.describe "expect(...).to cover(with, multiple, args)" do
    context "for a range target" do
      it "passes if target covers all items" 


      it "fails if target does not cover any one of the items" 

    end
  end

  RSpec.describe "expect(...).not_to cover(expected)" do
    context "for a range target" do
      it "passes if target does not cover expected" 


      it "fails if target covers expected" 

    end
  end

  RSpec.describe "expect(...).not_to cover(with, multiple, args)" do
    context "for a range target" do
      it "passes if the target does not cover any of the expected" 


      it "fails if the target covers all of the expected" 


      it "fails if the target covers some (but not all) of the expected" 

    end
  end
end

