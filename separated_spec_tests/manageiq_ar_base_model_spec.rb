describe "ar_base_model extension" do
  context "with a test class" do
    let(:test_class) do
      Class.new(ActiveRecord::Base) do
        def self.name; "TestClass"; end
      end
    end

    it ".base_model" 


    it ".model_suffix" 


    context "with a subclass" do
      let(:test_class_foo) do
        Class.new(test_class) do
          def self.name; "TestClassFoo"; end
        end
      end

      it ".base_model" 


      it ".model_suffix" 

    end
  end
end

