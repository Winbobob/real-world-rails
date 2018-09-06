describe ActsAsArModel do
  # id is a default column included regardless if it's in the set_columns_hash
  let(:col_names_strs) { %w(str id int flt dt) }

  let(:base_class) do
    Class.new(ActsAsArModel) do
      set_columns_hash(
        :str              => :string,
        :int              => :integer,
        :flt              => :float,
        :dt               => :datetime,
      )
    end
  end

  describe "subclass, base_class," do
    it(".base_class") { expect(base_class.base_class).to eq(base_class) }
    it(".base_model") { expect(base_class.base_model).to eq(base_class) }

    it { expect(base_class.attribute_names).to match_array(col_names_strs) }

    describe "instance" do
      it { expect(base_class.new).to respond_to(:attributes) }
      it { expect(base_class.new).to respond_to(:str) }

      it "should allow attribute initialization" 


      it "should allow attribute access" 

    end

    describe "subclass, TestSubClass1," do
      let(:sub_class) { Class.new(base_class) }

      it(".base_class") { expect(sub_class.base_class).to eq(base_class) }
      it(".base_model") { expect(sub_class.base_model).to eq(base_class) }
    end
  end

  describe "subclass, TestClass2," do
    let(:sub_class) { Class.new(ActsAsArModel) }

    it(".base_class") { expect(sub_class.base_class).to eq(sub_class) }
    it(".base_model") { expect(sub_class.base_model).to eq(sub_class) }

    it { expect(sub_class.attribute_names).to be_empty }
  end

  describe ".all" do
    it "chains through active query" 


    it "supports where (as an example)" 

  end

  describe ".first" do
    it "chains through active query" 

  end

  describe ".last" do
    it "chains through active query" 

  end

  describe ".count" do
    it "chains through active query" 

  end
end

