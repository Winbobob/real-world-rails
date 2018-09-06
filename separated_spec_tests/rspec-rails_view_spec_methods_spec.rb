module RSpec::Rails
  RSpec.describe ViewSpecMethods do
    before do
      class ::VCSampleClass; end
    end

    after do
      Object.send(:remove_const, :VCSampleClass)
    end

    describe ".add_extra_params_accessors_to" do
      describe "when accessors are not yet defined" do
        it "adds them as instance methods" 


        describe "the added #extra_params reader" do
          it "raises an error when a user tries to mutate it" 

        end
      end

      describe "when accessors are already defined" do
        before do
          class ::VCSampleClass
            def extra_params; end

            def extra_params=; end
          end
        end

        it "does not redefine them" 

      end
    end

    describe ".remove_extra_params_accessors_from" do
      describe "when accessors are defined" do
        before do
          ViewSpecMethods.add_to(VCSampleClass)
        end

        it "removes them" 

      end

      describe "when accessors are not defined" do
        it "does nothing" 

      end
    end
  end
end

