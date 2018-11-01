module RSpec::Matchers::BuiltIn
  RSpec.describe ThrowSymbol do
    it_behaves_like("an RSpec matcher", :valid_value => lambda { throw :foo },
                                        :invalid_value => lambda { }) do
      let(:matcher) { throw_symbol(:foo) }
    end

    describe "with no args" do
      before(:example) { @matcher = throw_symbol }

      it "matches if any Symbol is thrown" 

      it "matches if any Symbol is thrown with an arg" 

      it "does not match if no Symbol is thrown" 

      it "provides a failure message" 

      it "provides a negative failure message" 

    end

    describe "with a symbol" do
      before(:example) { @matcher = throw_symbol(:sym) }

      it "matches if correct Symbol is thrown" 

      it "matches if correct Symbol is thrown with an arg" 

      it "does not match if no Symbol is thrown" 

      it "does not match if correct Symbol is thrown" 

      it "provides a failure message when no Symbol is thrown" 

      it "provides a failure message when wrong Symbol is thrown" 

      it "provides a negative failure message" 

      it "only matches NameErrors raised by uncaught throws" 

    end

    describe "with a symbol and an arg" do
      before(:example) { @matcher = throw_symbol(:sym, "a") }

      it "matches if correct Symbol and args are thrown" 

      it "does not match if nothing is thrown" 

      it "does not match if other Symbol is thrown" 

      it "does not match if no arg is thrown" 

      it "does not match if wrong arg is thrown" 

      it "provides a failure message when no Symbol is thrown" 

      it "provides a failure message when wrong Symbol is thrown" 

      it "provides a failure message when wrong arg is thrown" 

      it "provides a failure message when no arg is thrown" 

      it "provides a negative failure message" 

      it "only matches NameErrors raised by uncaught throws" 

      it "raises other errors" 

    end

    describe "composing with other matchers" do
      it 'passes when the matcher matches the thrown arg' 


      it 'fails when the matcher does not match the thrown arg' 


      it 'provides a description' 

    end
  end
end

