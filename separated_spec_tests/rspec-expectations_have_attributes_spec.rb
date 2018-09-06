RSpec.describe "#have_attributes matcher" do

  Person = Struct.new(:name, :age)

  class Person
    def parent(parent_name)
      @parent = parent_name
    end
  end

  let(:wrong_name) { "Wrong Name" }
  let(:wrong_age) { 11 }

  let(:correct_name) { "Correct name" }
  let(:correct_age) { 33 }

  let(:person) { Person.new(correct_name, correct_age) }

  it "is diffable" 


  describe "expect(...).to have_attributes(with_one_attribute)" do

    it_behaves_like "an RSpec matcher", :valid_value => Person.new("Correct name", 33), :invalid_value => Person.new("Wrong Name", 11) do
      let(:matcher) { have_attributes(:name => "Correct name") }
    end

    it "passes if target has the provided attributes" 


    it "fails if target does not have any of the expected attributes" 


    it "fails with correct message if object manipulates its data" 


    it 'diffs the attributes received with those expected' 


    it "fails if target does not responds to any of the attributes" 


    it "doesn't produce a diff if the target fails the respond to check" 


    it "fails if target responds to the attribute but requires arguments" 


    describe "expect(...).to have_attributes(key => matcher)" do

      it "passes when the matchers match" 


      it 'provides a description' 


      it "fails with a clear message when the matcher does not match" 

    end
  end

  describe "expect(...).to_not have_attributes(with_one_attribute)" do

    it "passes if target does not have any of the expected attributes" 


    it "fails if target has all of the expected attributes" 


    it "doesn't produce a diff" 


    it "fails if target does not responds to any of the attributes" 


    it "fails if target responds to the attribute but requires arguments" 

  end

  describe "expect(...).to have_attributes(with_multiple_attributes)" do

    it_behaves_like "an RSpec matcher", :valid_value => Person.new("Correct name", 33), :invalid_value => Person.new("Wrong Name", 11) do
      let(:matcher) { have_attributes(:name => "Correct name", :age => 33) }
    end

    it "passes if target has the provided attributes" 


    it "fails if target does not have any of the expected attributes" 


    it 'diffs the attributes received with those expected' 


    it "fails if target does not responds to any of the attributes" 


    it "fails if target responds to the attribute but requires arguments" 

  end

  describe "expect(...).to_not have_attributes(with_multiple_attributes)" do

    it "passes if target has none of the expected attributes" 


    it "fails if target has any of the expected attributes" 


    it "fails if target has all of the expected attributes" 


    it "fails if target does not responds to any of the attributes" 


    it "fails if target responds to the attribute but requires arguments" 

  end

  include RSpec::Matchers::Composable
  # a helper for failure message assertion
  def object_inspect(object)
    surface_descriptions_in object.inspect
  end

end

