RSpec.describe MiqExpression::Tag do
  describe ".parse" do
    it "with model.managed-in_tag" 


    it "with model.last.managed-in_tag" 


    it "with model.managed-in_tag" 


    it "with model-parent::model.managed-in_tag" 


    it "with model.associations.associations.managed-in_tag" 


    it "with model.associations.managed-in_tag" 


    it "with model.associations.user_tag-in_tag" 


    it "with invalid case model.associations.managed-in_tag" 


    it "supports managed-tag (no model)" 


    it "returns nil with invalid case managed" 


    it "returns nil with invalid case model.managed" 


    it "returns nil with invalid case parent-model::model::somethingmanaged-se" 


    it "can parse models in deeply nested namespaces" 

  end

  describe "#to_s" do
    it "renders tags in string form" 


    it "can handle model-less tags" 


    it "can handle associations" 

  end

  describe '#report_column' do
    it 'returns the correct format for a tag' 

  end

  describe "#column_type" do
    it "is always a string" 

  end

  describe "#numeric?" do
    it "is never numeric" 

  end

  describe "#sub_type" do
    it "is always a string" 

  end

  describe "#attribute_supported_by_sql?" do
    it "is always false" 

  end
end

