RSpec.describe "expect(...).to have_sym(*args)" do
  it_behaves_like "an RSpec matcher", :valid_value => { :a => 1 },
                                      :invalid_value => {} do
    let(:matcher) { have_key(:a) }
  end

  it "passes if #has_sym?(*args) returns true" 


  it "fails if #has_sym?(*args) returns false" 


  obj_with_block_method = Object.new
  def obj_with_block_method.has_some_stuff?; yield; end

  it 'forwards the given `{ }` block on to the `has_xyz?` method' 


  it 'forwards the given `do..end` block on to the `has_xyz?` method' 


  it 'favors a curly brace block over a do...end one since it binds to the matcher method' 


  it 'does not include any args in the failure message if no args were given to the matcher' 


  it 'includes multiple args in the failure message if multiple args were given to the matcher' 


  it "fails if #has_sym?(*args) returns nil" 


  it 'fails if #has_sym?(*args) is private' 


  it "fails if target does not respond to #has_sym?" 


  it "reraises an exception thrown in #has_sym?(*args)" 


  it 'allows composable aliases to be defined' 


  it 'composes gracefully' 

end

RSpec.describe "expect(...).not_to have_sym(*args)" do
  it "passes if #has_sym?(*args) returns false" 


  it "passes if #has_sym?(*args) returns nil" 


  it "fails if #has_sym?(*args) returns true" 


  it "fails if target does not respond to #has_sym?" 


  it "reraises an exception thrown in #has_sym?(*args)" 


  it 'does not include any args in the failure message if no args were given to the matcher' 


  it 'includes multiple args in the failure message if multiple args were given to the matcher' 

end

RSpec.describe "has" do
  it "works when the target implements #send" 

end

