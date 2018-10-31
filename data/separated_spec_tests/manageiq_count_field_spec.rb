RSpec.describe MiqExpression::CountField do
  describe '.parse' do
    it 'parses field model.has_many_associations with valid format' 


    it 'doesn\'t parse field model.belongs_to_associations with invalid format' 


    it 'doesn\'t parse field with format of MiqExpression::Field::REGEX' 


    it 'doesn\'t parse field with format of  MiqExpression::Tag::REGEX' 


    it 'doesn\'t parse field with invalid format' 

  end

  describe "#to_s" do
    it "renders count fields in string form" 


    it "can handle multiple associations" 

  end
end

