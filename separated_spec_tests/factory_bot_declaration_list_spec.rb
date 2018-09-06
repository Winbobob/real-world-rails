require "spec_helper"

describe FactoryBot::DeclarationList, "#attributes" do
  let(:static_attribute_1)  { double("static attribute 1") }
  let(:static_attribute_2)  { double("static attribute 2") }
  let(:dynamic_attribute_1) { double("dynamic attribute 1") }
  let(:static_declaration)  do
    double(
      "static declaration",
      to_attributes: [static_attribute_1, static_attribute_2],
    )
  end
  let(:dynamic_declaration) do
    double("static declaration", to_attributes: [dynamic_attribute_1])
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

