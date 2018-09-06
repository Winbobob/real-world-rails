require_relative 'helper'

# Please keep in mind that any hash signs ("#") in the heredoc strings are
# placed on purpose. Without these editors might remove the whitespace on empty
# lines.
describe Pry::Indent do
  before do
    @indent = Pry::Indent.new
  end

  it 'should indent an array' 


  it 'should indent a hash' 


  it 'should indent a function' 


  it 'should indent a module and class' 


  it 'should indent separate lines' 


  it 'should not indent single line statements' 


  it 'should handle multiple open and closing tokens on a line' 


  it 'should properly indent nested code' 

end
TXT

    expect(@indent.indent(input)).to eq output
  end

  it 'should indent statements such as if, else, etc' 


  it "should correctly handle while <foo> do" 


  it "should ident case statements" 

when 5
  #
else
  #
end
TXT

    expect(@indent.indent(input)).to eq output
  end

  it "should indent correctly with nesting" 


  it "should not indent single-line ifs" 


  it "should indent cunningly disguised ifs" 


  it "should differentiate single/multi-line unless" 


  it "should not indent single/multi-line until" 


  it "should indent begin rescue end" 


  it "should not indent single-line rescue" 


  it "should not indent inside strings" 


  it "should not indent inside HEREDOCs" 


  it "should not indent nested HEREDOCs" 


  describe "nesting" do
      test = File.read("spec/fixtures/example_nesting.rb")

      test.lines.each_with_index do |line, i|
        result = line.split("#").last.strip
        if result == ""
          it "should fail to parse nesting on line #{i + 1} of example_nesting.rb" 

        else
          it "should parse nesting on line #{i + 1} of example_nesting.rb" 

        end
      end
    end
end

