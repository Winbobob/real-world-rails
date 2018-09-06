RSpec.describe "expect(...).to match(expected)" do
  it_behaves_like "an RSpec matcher", :valid_value => 'ab', :invalid_value => 'bc' do
    let(:matcher) { match(/a/) }
  end

  it "passes when target (String) matches expected (Regexp)" 


  it "passes when target (Regexp) matches expected (String)" 


  it "passes when target (Regexp) matches expected (Regexp)" 


  it "passes when target (String) matches expected (a matcher)" 


  it "passes when target (Regexp) matches expected (a matcher)" 


  it "passes when target (String) matches expected (String)" 


  it "fails when target (String) does not match expected (Regexp)" 


  it "fails when target (Regexp) does not match expected (String)" 


  it "fails when target (String) does not match expected (a matcher)" 


  it "fails when target (Regexp) does not match expected (a matcher)" 


  it "fails when target (String) does not match expected (String)" 


  it "provides message, expected and actual on failure" 


  it "provides a diff on failure" 


  context "when passed a data structure with matchers" do
    it 'passes when the matchers match' 


    it 'fails when the matchers do not match' 


    it 'provides a description' 

  end
end

RSpec.describe "expect(...).not_to match(expected)" do
  it "passes when target (String) matches does not match (Regexp)" 


  it "passes when target (String) matches does not match (String)" 


  it "fails when target (String) matches expected (Regexp)" 


  it "fails when target (String) matches expected (String)" 


  it "provides message, expected and actual on failure" 


  context "when passed a data structure with matchers" do
    it 'passes when the matchers match' 


    it 'fails when the matchers do not match' 

  end
end

