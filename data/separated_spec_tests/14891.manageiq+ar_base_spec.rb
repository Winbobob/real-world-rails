describe "ar_base extension" do
  context "with a test class" do
    let(:test_class) do
      Class.new(ActiveRecord::Base) do
        def self.name; "TestClass"; end
      end
    end

    it ".vacuum" 

  end
end

