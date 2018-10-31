RSpec.describe MiqExpression::Field do
  describe ".parse" do
    it "can parse the model name" 


    it "can parse a namespaced model name" 


    it "can parse the model name with associations present" 


    it "can parse the column name" 


    it "can parse the column name with associations present" 


    it "can parse the column name with pivot table suffix" 


    it "can parse column names with snakecase" 


    it "can parse the associations when there is none present" 


    it "can parse the associations when there is one present" 


    it "can parse the associations when there are many present" 


    it "will return nil when given a field with unsupported syntax" 


    it "will return nil when given a tag" 


    it 'parses field with numbers in association' 

  end

  describe "#to_s" do
    it "renders fields in string form" 


    it "can handle associations" 

  end

  describe '#report_column' do
    it 'returns the correct format for a field' 

  end

  describe "#parse!" do
    it "can parse the model name" 


    # this calls out to parse, so just needed to make sure one value worked

    it "will raise a parse error when given a field with unsupported syntax" 

  end

  describe "#valid?" do
    it "returns true when the column belongs to the set of column names" 


    it "returns true when the column belongs to the set of virtual attributes" 


    it "returns true when the column is a custom attribute" 


    it "returns false for non-attribute public methods" 

  end

  describe "#reflections" do
    it "returns an empty array if there are no associations" 


    it "returns the reflections of fields with one association" 


    it "returns the reflections of fields with multiple associations" 


    it "can handle associations which override the class name" 


    it "can handle virtual associations" 


    it "raises an error if the field has invalid associations" 

  end

  describe "#date?" do
    it "returns false for fields of column type other than :date" 

  end

  describe "#datetime?" do
    it "returns true for fields of column type :datetime" 


    it "returns false for fields of column type other than :datetime" 


    it "returns true for a :datetime type column on an association" 

  end

  describe "#target" do
    it "returns the model when there are no associations" 


    it "returns the model of the target association if there are associations" 

  end

  describe "#arel_table" do
    it "returns the main table when there are no associations" 


    it "returns the table of the target association without an alias" 


    it "returns the table of the target association with an alias if needed" 

  end

  describe "#arel_attribute" do
    it "returns the main table when there are no associations" 


    it "returns the table of the target association without an alias" 


    it "returns the table of the target association with an alias if needed" 

  end

  describe "#plural?" do
    it "returns false if the column is on a 'belongs_to' association" 


    it "returns false if the column is on a 'has_one' association" 


    it "returns true if the column is on a 'has_many' association" 


    it "returns true if the column is on a 'has_and_belongs_to_many' association" 

  end

  describe "#column_type" do
    it "detects :string" 


    it "detects :integer" 

  end

  describe "#attribute_supported_by_sql?" do
    it "detects if column is supported by sql with custom_attribute" 


    it "detects if column is supported by sql with regular column" 


    it "detects if column is supported by sql through regular association" 


    it "detects if column is supported by sql through virtual association" 

  end

  describe "#virtual_attribute?" do
    it "detects non-virtual" 


    it "detects virtual" 


    it "detects non-virtual through a relation" 


    it "detects virtual through a relation" 

  end

  describe "#sub_type" do
    it "detects :string" 


    it "detects :integer" 

  end

  describe "#numeric?" do
    it "detects integer as numeric" 


    it "detects string as non-numeric" 

  end

  describe "#reflection_supported_by_sql?" do
    it "detects if column is accessed directly" 


    it "detects if column is accessed through regular association" 


    it "detects if column is accessed through regular virtual association" 

  end

  describe "#is_field?" do
    it "detects a valid field" 


    it "does not detect a string to looks like a field but isn't" 


    it "handles regular expression" 

  end
end

