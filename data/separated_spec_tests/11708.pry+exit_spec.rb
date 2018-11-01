require_relative '../helper'

describe "exit" do
  before { @pry = Pry.new(target: :outer, output: StringIO.new) }

  it "should pop a binding" 


  it "should break out of the repl when binding_stack has only one binding" 


  it "should break out of the repl and return user-given value" 


  it "should break out of the repl even after an exception" 

end

