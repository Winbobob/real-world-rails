describe FactoryBot::DeclarationList, "#attributes" do
  let(:attribute_1) { double("attribute 1") }
  let(:attribute_2) { double("attribute 2") }
  let(:attribute_3) { double("attribute 3") }
  let(:declaration_1) do
    double(
      "declaration 1",
      to_attributes: [attribute_1, attribute_2],
    )
  end
  let(:declaration_2) do
    double("declaration_2", to_attributes: [attribute_3])
  end

  it "returns an AttributeList" 


  let(:attribute_list) { double("attribute list", define_attribute: true) }

  it "defines each attribute on the attribute list" 

end

describe FactoryBot::DeclarationList, "#declare_attribute" do
  let(:declaration_1) { double("declaration", name: "declaration 1") }
  let(:declaration_2) { double("declaration", name: "declaration 2") }
  let(:declaration_with_same_name) do
    double("declaration", name: "declaration 1")
  end

  context "when not overridable" do
    it "adds the declaration to the list" 

  end

  context "when overridable" do
    before { subject.overridable }

    it "adds the declaration to the list" 


    it "deletes declarations with the same name" 

  end
end

